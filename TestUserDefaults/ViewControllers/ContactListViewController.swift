//
//  ContactListViewControllerTableViewController.swift
//  TestUserDefaults
//
//  Created by Алексей Турулин on 7/28/23.
//

import UIKit

protocol NewContactViewControllerDelegate: AnyObject {
    func add(contact: String)
}

class ContactListViewController: UITableViewController {

    private var contacts: [String] = []
    private let storageManager = StorageManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = storageManager.fetchContacts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newContactVC = segue.destination as? NewContactViewController else { return }
        newContactVC.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath)
        let contact = contacts[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = contact
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            storageManager.deleteContact(at: indexPath.row)
        }
    }
}

extension ContactListViewController: NewContactViewControllerDelegate {
    func add(contact: String) {
        contacts.append(contact)
        tableView.reloadData()
    }
}
