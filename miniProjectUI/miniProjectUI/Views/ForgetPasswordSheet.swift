//
//  ForgetPasswordSheet.swift
//  miniProjectUI
//
//  Created by ÖMER  on 22.08.2024.
//

import SwiftUI

struct ForgetPasswordSheet: View {
    
    @State private var email: String = ""
    var body: some View {
        
        Section(header: Text("Forget Password")){
            
            TextField("Email", text: $email)
                .padding()
                .frame(height: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black)
                )
                .padding(.top, 12)
            
            Text("Enter your email address to reset your password")
                .frame(minWidth: 0, maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .font(.footnote)
                .padding(.bottom, 12)
        }
        .listRowSeparator(.hidden)
        
    }
}

#Preview {
    ForgetPasswordSheet()
        .padding()
}
