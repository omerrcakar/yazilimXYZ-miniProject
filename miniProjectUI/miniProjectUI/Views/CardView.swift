//
//  CardView.swift
//  miniProjectUI
//
//  Created by ÖMER  on 20.08.2024.
//

import SwiftUI

struct CardView: View {
    // MARK: PROPERTIES
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    @State private var loginGecis:Bool = false
    @State private var signUpGecis:Bool = false
    
    @State private var isShowingSheet: Bool = false
    
    // MARK: FUNCTIONS
    
    // eğer random üretilen number mevcut image number ile aynı ise döngü yeniden başlar. farklı bir sayı üretilene kadar bu döngü devam eder
    func randomImage(){
        repeat{
            randomNumber = Int.random(in: 1...3)
        }while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    
    var body: some View {
        // MARK: CARD
        NavigationStack {
            ZStack {
                CustomBackgroundView()
                VStack {
                    // MARK: - HEADER
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Plant")
                                .fontWeight(.black)
                                .font(.system(size: 52))
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [
                                            .customGrayMedium,
                                            .customGrayLight
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom)
                            )
                            Spacer()
                            HStack(spacing: 15){
                                Button{
                                    // ACTION: Generate a random number
                                    randomImage()
                                }label: {
                                    CustomCircleButtonView(name: "arrow.triangle.2.circlepath")
                                }
                                
                                Button{
                                    // ACTION: Show a Sheet
                                    isShowingSheet.toggle()
                                }label: {
                                    CustomCircleButtonView(name: "leaf.fill")
                                }
                                .sheet(isPresented: $isShowingSheet){
                                    SettingSheetPage()
                                        .presentationDragIndicator(.visible)
                                        .presentationDetents([.medium,.large])
                                }
                               
                            }
                            
                        }
                        Text("Scan, learn the type of plant and find what it is missing. The fun way to grow plants.")
                            .multilineTextAlignment(.leading)
                            .italic()
                            .foregroundStyle(.colorGrayMedium)
                        
                    } //:HEADER
                    .padding(.horizontal, 30)
                    
                    // MARK: - MAIN CONTENT
                    
                    ZStack {
                        CustomCircleView()
                        
                        Image("plant-\(imageNumber)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .animation(.snappy, value: imageNumber) // imageNumber değişirse, resmin geçiş animasyonu .snappy stilinde gerçekleşir.
                    }.padding(.bottom, 20)
                    
                    // MARK: - FOOTER
                    VStack(spacing: 15){
                        CustomButtonView(title: "Login", frameWidth: 180,titleColor: .colorGreenLight){
                            // ACTION
                            loginGecis = true
                        }.navigationDestination(isPresented: $loginGecis){
                            LoginPage()
                                .navigationBarBackButtonHidden(true)
                                
                        }
                        
                        CustomButtonView(title: "Sign Up", frameWidth: 180, titleColor: .colorGreenLight){
                            // ACTION
                            signUpGecis = true
                        }.navigationDestination(isPresented: $signUpGecis){
                            SignUpPage()
                                .navigationBarBackButtonHidden(true)
                        }
                
                    }
                    
                }//: VStack
            }//: CARD
            .frame(width: 340, height: 680)
        }// NAVIGATION STACK
        
    }
}

#Preview {
    CardView()
}
