//
//  CustomButtonView.swift
//  miniProjectUI
//
//  Created by ÖMER  on 21.08.2024.
//

import SwiftUI

struct CustomButtonView: View {
    // Parametreler
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button{
            action()
        }label: {
            Text(title)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenLight
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                            
        }
        .frame(width: 250, height: 20)
        .padding()
        .background(
            LinearGradient(
                colors: [
                    .customGrayLight,
                    .customGrayLight
                ],
                startPoint: .top,
                endPoint: .bottom)
        )
        .clipShape(RoundedRectangle(cornerRadius: 40))
                
                
        
        
    }
}

#Preview {
    CustomButtonView(title: "Login", action: {
        print("Login")
    })
}
