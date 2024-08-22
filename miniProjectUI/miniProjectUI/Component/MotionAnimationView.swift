//
//  MotionAnimationView.swift
//  miniProjectUI
//
//  Created by ÖMER  on 21.08.2024.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: PROPERTIES
    @State private var randomCircle:Int = Int.random(in: 12...24)
    @State private var isAnimating: Bool = false
    
    // MARK: FUNCTIONS
    
    // 1. Random Coordinate
    
    func randomCoordinate() -> CGFloat{
        return CGFloat.random(in: 0...256)
    }
    // 2. Random Sıze
    
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 10...40))
    }
    // 3. Random Scale
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4. Random Speed
    func randomSpeed() -> Double{
        return Double.random(in: 0.05...0.06)
    }
    // 5. Random Delay
    func randomDelay() -> Double{
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                
                Image(systemName: "leaf")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.colorGreenMedium)
                    .opacity(0.55)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){
                            isAnimating = true
                        }
                    })
            }
        }//: ZSTACK
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    MotionAnimationView()
        .background(
            Circle()
                .fill(.teal)
        )
}
