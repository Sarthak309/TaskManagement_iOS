//
//  Status.swift
//  TaskManagementApplication
//
//  Created by Sarthak Agrawal on 13/09/24.
//

import Foundation
import UIKit

enum Status: String,Codable{
    case pending
    case inprogress
    case completed
    case deferred
    case cancelled
    
    var color: UIColor{
        switch self{
        case .cancelled:
            return .systemRed
        case .completed:
            return .systemGreen
        default:
            return .systemGray
        }
    }
}
