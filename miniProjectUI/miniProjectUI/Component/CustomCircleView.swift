//
//  CustomCircleView.swift
//  miniProjectUI
//
//  Created by ÖMER  on 21.08.2024.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .red.opacity(0.60),
                            .orange.opacity(0.20),
                        ],
                        startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing)
                    
                )
                .onAppear{
                    // withAnimation(): Bu fonksiyon, içerisine aldığı animasyonun etkili bir şekilde uygulanmasını sağlar.
                    withAnimation(.easeOut(duration: 2.0).repeatForever(autoreverses: true)){
                        isAnimateGradient.toggle()
                    }
                }
            MotionAnimationView()
        }//: ZSTACK
        .frame(width:300, height: 300)
    }
}

#Preview {
    CustomCircleView()
}
