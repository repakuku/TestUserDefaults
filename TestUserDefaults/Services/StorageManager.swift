//
//  StorageManager.swift
//  TestUserDefaults
//
//  Created by Алексей Турулин on 7/28/23.
//

import Foundation

final class StorageManager {
    
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "contacts"
    
    private init() {}
    
    func fetchContacts() -> [String] {
        if let contacts = userDefaults.stringArray(forKey: key) {
            return contacts
        }
        
        return []
    }
    
    func save(contact: String) {
        var contacts = fetchContacts()
        contacts.append(contact)
        userDefaults.set(contacts, forKey: key)
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        userDefaults.set(contacts, forKey: key)
    }
}
