//
//  StorageManager.swift
//  TestUserDefaults
//
//  Created by Алексей Турулин on 7/28/23.
//

import Foundation

final class StorageManager {
    
    static let shared = StorageManager()
    
    private init() {}
    
    func fetchContacts() -> [String] {
        
        
        return []
    }
    
    func save(contact: String) {
        var contacts = fetchContacts()
        contacts.append(contact)
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContacts()
        contacts.remove(at: index)
    }
}
