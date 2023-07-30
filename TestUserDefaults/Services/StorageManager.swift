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
    
    func fetchContacts() -> [Contact] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        guard let contacts = try? JSONDecoder().decode([Contact].self, from: data) else { return [] }
        
        return contacts
    }
    
    func save(contact: Contact) {
        var contacts = fetchContacts()
        contacts.append(contact)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: key)
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
        guard let data = try? JSONEncoder().encode(contacts) else { return }
        userDefaults.set(data, forKey: key)
    }
}
