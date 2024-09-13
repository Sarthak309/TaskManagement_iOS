//
//  SplashScreenView.swift
//  TaskManagementApplication
//
//  Created by Sarthak Agrawal on 12/09/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack {
            if isActive {
                SignUpView()
            } else {
                Text("Welcome to Task Manager")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
