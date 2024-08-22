//
//  CustomBackgroundView.swift
//  miniProjectUI
//
//  Created by ÖMER  on 20.08.2024.
//

import SwiftUI
// Background Card view
struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // MARK: 3.DEPTH
            Color.customGreenDark
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y: 12)
                .opacity(0.88)
                .shadow(radius: 10)
            
            // MARK: 2.LIGHT
            Color.customGreenLight
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .offset(y: 3)
                .opacity(0.85)
            
            // MARK: 1.SURFACE
            
            LinearGradient(
                colors: [
                    .customGreenLight,
                    .customGreenMedium
                ],
                startPoint: .top,
            endPoint: .bottom
            )
            .clipShape(RoundedRectangle(cornerRadius: 40))
            
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
