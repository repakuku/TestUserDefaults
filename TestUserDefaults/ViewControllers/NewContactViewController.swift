//
//  NewContactViewController.swift
//  TestUserDefaults
//
//  Created by Алексей Турулин on 7/28/23.
//

import UIKit

final class NewContactViewController: UIViewController {

    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    unowned var delegate: NewContactViewControllerDelegate!
    private let storageManager = StorageManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let action = UIAction { [weak self] _ in
            guard let firstName = self?.firstNameTextField.text else { return }
            self?.doneButton.isEnabled = !firstName.isEmpty
        }
        firstNameTextField.addAction(action, for: .editingChanged)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        save()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func save() {
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        
        let fullName = "\(firstName) \(lastName)"
        storageManager.save(contact: fullName)
        
        delegate.add(contact: fullName)
        dismiss(animated: true)
    }
}
