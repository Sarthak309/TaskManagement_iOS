//
//  DashboardView.swift
//  TaskManagementApplication
//
//  Created by Sarthak Agrawal on 13/09/24.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject var viewModel = DashBoardViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                // Header
                HStack {
                    Text("Todo")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    HStack(spacing: 35){
                        Button("Post Task"){
                            
                        }
                        
                        Button("Logout") {
                            viewModel.logout()
                            // Logout action
                        }
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                
                // Search Bar
                HStack {
                    TextField("Enter Keyword to search", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                // Task Cards
                ScrollView {
                    LazyVStack(spacing:16){
                        TaskCardView(title: "Prepare Monthly Report", description: "Gather data from various departments, analyze performance metrics, and compile into a comprehensive report.", dueDate: "Mar 11, 2024", employee: "Michael John", priority: .high, status: .pending)
                            .swipeActions(edge:.leading){
                                Button("Delet", systemImage: "trash") {
                                    viewModel.logout()
                                }
                            }
                        
                        TaskCardView(title: "Complete Project Proposal", description: "Write a detailed proposal outlining the project scope, objectives, deliverables, timeline, budget, and expected outcomes.", dueDate: "Mar 10, 2024", employee: "John Doe", priority: .low, status: .completed)
                        
                        TaskCardView(title: "Schedule Team Meeting", description: "Coordinate with team members to schedule a meeting for discussing project updates, upcoming tasks, and brainstorming innovative solutions.", dueDate: "Mar 10, 2024", employee: "Jane Smith", priority: .medium, status: .cancelled)
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationDestination(isPresented: $viewModel.isUserLoggedout) {
            LoginView()
        }
    }
}

#Preview {
    DashboardView()
}
