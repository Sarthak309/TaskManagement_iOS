//
//  SignUpView.swift
//  TaskManagementApplication
//
//  Created by Sarthak Agrawal on 12/09/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                TextField("Name", text: $viewModel.name)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Button(action: {
                        viewModel.signUp()
                    }) {
                        Text("Sign Up")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(5)
                    }
                }
                
                if let alertMessage = viewModel.alertMessage{
                    Text(alertMessage)
                        .foregroundStyle(viewModel.showErrorAlert ? .red : .green)
                        .padding(.top, 10)
                }
                NavigationLink(destination: LoginView()) {
                    Text("Already signed in? Login")
                        .foregroundColor(.blue)
                }
            }
            .navigationDestination(isPresented: $viewModel.isSignUpSucessful,
                                   destination: {
                LoginView()
            })
            .padding()
            .navigationTitle("Sign Up")
            .navigationBarBackButtonHidden()
        }
    }
}



#Preview {
        SignUpView()
}
