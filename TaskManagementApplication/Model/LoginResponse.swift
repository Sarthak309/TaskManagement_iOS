//
//  LoginResponse.swift
//  TaskManagementApplication
//
//  Created by Sarthak Agrawal on 12/09/24.
//

import Foundation

struct LoginResponse: Codable {
    let jwt: String
    let userId: Int
    let userRole: String
}

extension LoginResponse {
    func decodedUserRole() -> UserRole? {
        return UserRole(rawValue: userRole.lowercased())
    }
}
