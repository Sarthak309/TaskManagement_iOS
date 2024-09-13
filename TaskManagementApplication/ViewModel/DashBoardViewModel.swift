//
//  DashBoardViewModel.swift
//  TaskManagementApplication
//
//  Created by Sarthak Agrawal on 13/09/24.
//

import Foundation

class DashBoardViewModel:ObservableObject{
    
    private let userPref = UserPreferences()
    @Published var isUserLoggedout = false
    @Published var isLoading = false
    @Published var tasks: [Task] = []
    

    func formatDate(_ isoString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]  // To handle milliseconds
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"  // Desired format "20/10/2024"
        
        // Parse ISO 8601 date
        if let date = isoFormatter.date(from: isoString) {
            // Format to readable date in "dd/MM/yyyy"
            return dateFormatter.string(from: date)
        } else {
            return isoString  // Return original string if parsing fails
        }
    }
    
    func fetchTask(){
        
        guard let userRole = userPref.userRole?.rawValue, let token = userPref.jwt else{
            print("Error")
            return
        }
        
        isLoading = true
        
        APIService.shared.fetchTask(userRole: userRole,
                                    token: token) { [weak self] result in
            self?.isLoading = false
            switch result{
            case .success(let tasks):
                DispatchQueue.main.async {
                    self?.tasks = tasks
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logout(){
        userPref.jwt = nil
        userPref.userId = nil
        userPref.userRole = nil
        self.isUserLoggedout = true
    }
    
    func deleteTask(){
        
    }
}
