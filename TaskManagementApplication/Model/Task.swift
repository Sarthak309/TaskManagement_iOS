//
//  Task.swift
//  TaskManagementApplication
//
//  Created by Sarthak Agrawal on 13/09/24.
//

import Foundation

struct Task:Codable, Identifiable, Comparable{
    static func < (lhs: Task, rhs: Task) -> Bool {
        return lhs.id < rhs.id
    }
    
    let id:Int
    let title: String
    let description: String
    let dueDate: String
    let priority: String
    let taskStatus: String
    let employeeId: Int
    let employeeName: String
}

extension Task{
    func mappedPriority() -> Priority?{
        return Priority(rawValue: priority.lowercased())
    }
    
    func mappedStatus() -> Status?{
        return Status(rawValue: taskStatus.lowercased())
    }
}
