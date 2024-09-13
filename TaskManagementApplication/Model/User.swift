//
//  USer.swift
//  TaskManagementApplication
//
//  Created by Sarthak Agrawal on 12/09/24.
//

import Foundation

struct User: Codable {
    
    let id: Double
    let name: String
    let email: String
    let password: String
    let userRole: String
}
