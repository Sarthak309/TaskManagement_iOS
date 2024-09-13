//
//  Priority.swift
//  TaskManagementApplication
//
//  Created by Sarthak Agrawal on 13/09/24.
//

import Foundation
import UIKit

enum Priority: String, Codable{
    case low
    case high
    case medium
    
    var color: UIColor{
        switch self{
        case .high:
            return .systemRed
        case .medium:
            return .systemOrange
        case .low:
            return .systemGreen
        }
    }
}


