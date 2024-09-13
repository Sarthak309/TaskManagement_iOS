//
//  TaskCardView.swift
//  TaskManagementApplication
//
//  Created by Sarthak Agrawal on 13/09/24.
//

import SwiftUI

struct TaskCardView: View {
    var title: String
    var description: String
    var dueDate: String
    var employee: String
    var priority: Priority
    var status: Status
    
    var body: some View {
        VStack(alignment: .leading,spacing: 8) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(Color(uiColor: .systemBlue))
            
            Text(description)
                .font(.body)
                .foregroundStyle(Color(uiColor: .systemGray))
            
            HStack {
                Text("Due Date: ")
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                Text(dueDate)
                    .foregroundStyle(.black)
            }
            
            HStack {
                Text("Employee: ")
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                Text(employee.capitalized)
                    .foregroundStyle(.black)
                
            }
            
            HStack {
                Text("Priority: ")
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                Text(priority.rawValue.uppercased())
                    .foregroundStyle(Color(uiColor: priority.color))
                    .fontWeight(.bold)
            }
            
            HStack {
                Text("Status: ")
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                Text(status.rawValue.uppercased())
                    .foregroundStyle(Color(uiColor: status.color))
            }
            
            // Action Buttons
            HStack(spacing: 20) {
                Button(action: {
                    // View action
                }) {
                    Image(systemName: "eye")
                }
                Button(action: {
                    // Edit action
                }) {
                    Image(systemName: "pencil")
                }
                Button(action: {
                    // Delete action
                }) {
                    Image(systemName: "trash")
                }
            }
            .padding(.top,8)
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 60)
        .background(Color(uiColor: .white))
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .overlay {
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color(uiColor: .systemGray), lineWidth: 2)
        }
    }
}

#Preview {
    TaskCardView(title: "Update UI", description: "Please Update the UI of the app", dueDate: "20/09/2024", employee: "Sarah", priority: .medium, status: .completed)
}

#Preview{
    TaskCardView(title: "Create UI", description: "Integrate the login and signup API from freeAPI.com ", dueDate: "22/22/22", employee: "sarthak", priority: .high, status: .cancelled)
}
