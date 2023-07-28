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

}

extension ContactListViewController: NewContactViewControllerDelegate {
    func add(contact: String) {
        
    }
}
