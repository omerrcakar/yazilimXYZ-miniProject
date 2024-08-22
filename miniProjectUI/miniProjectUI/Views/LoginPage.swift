//
//  LoginPage.swift
//  miniProjectUI
//
//  Created by ÖMER  on 20.08.2024.
//

import SwiftUI

extension Image{
    func imageModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
    }
    
    func iconModifier() -> some View{
        self
            .imageModifier()
            .frame(maxWidth: 20)
            .foregroundStyle(.green)
            .opacity(0.5)
    }
}

struct LoginPage: View {
    @Environment(\.presentationMode) var presentationMode // Geriye dönmek için kullanacağız
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible :Bool = false
    @State private var signUpGecis:Bool = false
    @State private var isShowingSheet: Bool = false
    
    // Image URL
    private let imageURL: String = "https://cdn-icons-png.flaticon.com/128/708/708503.png"
    
    var body: some View {
        
        NavigationStack {
            ZStack{
                Color.colorGreenDark.opacity(0.45)
                
                
                
                VStack(spacing: 20){
                    
                    VStack{
                        HStack{
                            Button{
                                presentationMode.wrappedValue.dismiss()
                            }label: {
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(.red)
                            }
                            Spacer()
                        }
                        // MARK: HEADER
                        // Custom AsyncImage
                        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                            switch phase{
                            case.success(let image):
                                image
                                    .imageModifier()
                                    .transition(.scale)
                                    //.transition(.move(edge: .bottom))
                                    //.transition(.slide)
                            case.failure(_):
                                Image(systemName: "ant.circle.fill").iconModifier()
                            case.empty:
                                Image(systemName: "leaf.fill").iconModifier()
                            @unknown default: // Bu, henüz bilmediğimiz veya gelecekte eklenebilecek durumları kapsayacaktır.
                                ProgressView()
                            }
                        }
                        
                            
                            
                    }.padding(.top, 90)
                    Spacer()
                    
                    // MARK: MAIN CONTEXT
                    
                    VStack(spacing: 20){
                        VStack(alignment: .leading, spacing: 20) {
                            
                            HStack{
                                Text("Login")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.red).opacity(0.7)
                                Spacer()
                            }
                            
                            VStack(alignment: .leading){
                                Text("Hello there !")
                                    .font(.title)
                                
                                Text("Welcome Back")
                                    .font(.title)
                                    
                            }
                            
                        }
                        .padding(.leading, 5)
                        .padding(.bottom, 10)
                        
                        TextField("Email", text: $email)
                            .padding()
                            .frame(height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black)
                            )
                        ZStack(alignment: .trailing){
                            Group{
                                if isPasswordVisible{
                                    TextField("Password", text: $password)
                                }else{
                                    SecureField("Password", text: $password)
                                }
                            }
                            .padding()
                            .frame(height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black)
                            )
                            
                            
                            Button{
                                isPasswordVisible.toggle()
                            }label: {
                                Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                            }
                            .padding(.trailing, 20)
                            .foregroundStyle(.gray)
                            
                        }
                        VStack{
                            HStack {
                                Spacer()
                                Button{
                                    // Forget Password sheet
                                    isShowingSheet = true
                                }label: {
                                    HStack{
                                        Text("Forget Password")
                                        Image(systemName: "questionmark.circle")
                                    }
                                    
                                }
                                .sheet(isPresented: $isShowingSheet){
                                    ForgetPasswordSheet()
                                        .presentationDragIndicator(.visible)
                                        .presentationDetents([.medium,.large])
                                }
                                .padding(.trailing, 5)
                                .foregroundStyle(.red).opacity(0.7)
                                .fontWeight(.medium)
                                
                            }
                            .padding(.bottom, 20)
                            
                            
                            CustomButtonView(title: "Login", frameWidth: 330, titleColor: .white){
                                // LOGIN ACTION
                            }
                            
                        }
                    }
                    .padding(.top, -90)
                    
                    Spacer()
                
                    
                    // MARK: FOOTER
                    HStack{
                        Text("Don't have an account? ")
                        Button{
                            signUpGecis = true
                        }label: {
                            Text("Register Now")
                                .foregroundStyle(.red)
                        }
                        .navigationDestination(isPresented: $signUpGecis){
                            SignUpPage()
                                .navigationBarBackButtonHidden(true)
                        }
                        
                    }
                    .padding(.bottom, 8)
                    
                }
                .padding()
                
                
                
                
            }//:ZSTACK
            .ignoresSafeArea(.all)
        }
        
        
        
    }
}

#Preview {
    LoginPage()
}
