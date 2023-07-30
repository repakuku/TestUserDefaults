//
//  Contact.swift
//  TestUserDefaults
//
//  Created by Алексей Турулин on 7/30/23.
//

import Foundation

struct Contact: Codable {
    var name: String
    var surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
