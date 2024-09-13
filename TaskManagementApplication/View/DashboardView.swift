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
                        .font(.largeTitle)
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
                }.padding(.horizontal)
                    .background(Color.blue)
                    .foregroundColor(.white)
                
                // Search Bar
                HStack {
                    TextField("Enter Keyword to search", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .padding(.bottom)
                }
                
                // Task Cards
                ScrollView {
                    LazyVStack(spacing: 16) {
                        //                        ForEach(viewModel.tasks.sorted()) { task in
                        //                            TaskCardView(
                        //                                title: task.title,
                        //                                description: task.description,
                        //                                dueDate: viewModel.formatDate(task.dueDate),
                        //                                employee: task.employeeName,
                        //                                priority: task.mappedPriority() ?? .low,
                        //                                status: task.mappedStatus() ?? .inprogress
                        //                            )
                        //
                        TaskCardView(title: "Update the UI", description: " Please Update the UI of the app", dueDate: "Mar 10, 2024", employee: "John Doe", priority: .low, status: .cancelled)

                        TaskCardView(title: "Create UI", description: " Please Create a good UI/UX of the app", dueDate: "Mar 11, 2024", employee: "Michael John", priority: .high, status: .pending)
                        
                        TaskCardView(title: "Integrate the APIS", description: "Integrate the login and signup API from freeAPI.com", dueDate: "Mar 10, 2024", employee: "Jane Smith", priority: .medium, status: .completed)
                    
                    }
                    .padding(.horizontal)
                }
                .onAppear {
                    viewModel.fetchTask()
                }
            }
        }
        .navigationDestination(isPresented: $viewModel.isUserLoggedout) {
            LoginView()
        }
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    DashboardView()
}
