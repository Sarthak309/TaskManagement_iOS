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
                        ForEach(viewModel.tasks) { task in
                            TaskCardView(
                                title: task.title,
                                description: task.description,
                                dueDate: viewModel.formatDate(task.dueDate),
                                employee: task.employeeName,
                                priority: task.mappedPriority() ?? .low,
                                status: task.mappedStatus() ?? .inprogress
                            )
                            .swipeActions {
                                Button(action: {
                                    viewModel.deleteTask()
                                }) {
                                    Image(systemName: "trash")
                                }
                            }
                        }
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
