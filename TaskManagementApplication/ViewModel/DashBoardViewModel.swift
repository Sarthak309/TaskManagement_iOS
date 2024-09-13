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
    
    
    func logout(){
        userPref.jwt = nil
        userPref.userId = nil
        userPref.userRole = nil
        self.isUserLoggedout = true
    }
}
