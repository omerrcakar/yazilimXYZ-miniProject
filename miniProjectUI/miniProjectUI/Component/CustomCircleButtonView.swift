//
//  CustomButtonView.swift
//  miniProjectUI
//
//  Created by ÖMER  on 21.08.2024.
//

import SwiftUI

struct CustomCircleButtonView: View {
    let name:String
    var body: some View {
        ZStack{
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
            
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [
                            .customGrayLight,
                            .customGrayMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom), lineWidth: 4)
            
            Image(systemName: name)
                .fontWeight(.black)
                .font(.system(size: 22))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGrayLight,
                            .customGrayMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
        }//: ZSTACK
        .frame(width: 50, height: 50)
    }
}

#Preview {
    CustomCircleButtonView(name: "leaf.fill")
}
