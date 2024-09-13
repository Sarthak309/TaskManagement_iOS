//
//  SignUpViewModel.swift
//  TaskManagementApplication
//
//  Created by Sarthak Agrawal on 12/09/24.
//

import Foundation
import Combine

class SignUpViewModel:ObservableObject{
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var user: User? = nil
    @Published var alertMessage: String? = nil
    @Published var isLoading: Bool = false
    @Published var showErrorAlert:Bool = false
    @Published var isSignUpSucessful = false
    
    private var cancellables = Set<AnyCancellable>()
    
    func signUp() {
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty else {
            self.showErrorAlert = true
            self.alertMessage = "Please fill in all fields."
            self.isSignUpSucessful = false
            return
        }
        self.isLoading = true
        let parameters = ["name": name, "email": email, "password": password]
        
        name = ""
        email = ""
        password = ""
        APIService.shared.signUpUser(parameters: parameters) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let user):
                    print(user)
                    self?.showErrorAlert = false
                    self?.alertMessage = "Sign Up Successfull"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        self?.isSignUpSucessful = true
                        self?.alertMessage = nil
                    }
                    self?.user = user
                case .failure(let error):
                    if let errorCode = error.asAFError?.responseCode{
                        if errorCode == 406 {
                            self?.showErrorAlert = true
                            self?.alertMessage = "User already exists"
                            
                            self?.isSignUpSucessful = false
                            return
                        }
                    }
                    print(error.localizedDescription)
                    self?.showErrorAlert = true
                    self?.alertMessage = error.localizedDescription
                }
            }
        }
    }
}
