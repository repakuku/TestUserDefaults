//
//  NewContactViewController.swift
//  TestUserDefaults
//
//  Created by Алексей Турулин on 7/28/23.
//

import UIKit

class NewContactViewController: UIViewController {

    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    unowned var delegate: NewContactViewControllerDelegate!
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
