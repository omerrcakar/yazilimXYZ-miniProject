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
    var frameWidth: CGFloat
    var titleColor: Color
    var action: () -> Void
    
    
    var body: some View {
        Button{
            action()
        }label: {
            Text(title)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundStyle(
                    titleColor
                )
                            
        }
        .frame(width: frameWidth, height: 20)
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
    CustomButtonView(title: "Login",frameWidth: 200,titleColor: .colorGrayLight, action: {
        print("Login")
    })
}
