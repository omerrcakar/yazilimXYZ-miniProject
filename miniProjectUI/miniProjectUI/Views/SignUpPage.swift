//
//  SignUpPage.swift
//  miniProjectUI
//
//  Created by ÖMER  on 20.08.2024.
//

import SwiftUI



struct SignUpPage: View {
    @Environment(\.presentationMode) var presentationMode // Geriye dönmek için kullanacağız
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible :Bool = false
    @State private var signInGecis: Bool = false
    
    // Image URL
    private let imageURL: String = "https://cdn-icons-png.flaticon.com/128/708/708503.png"
    
    var body: some View {
        NavigationStack{
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
                        .padding(.top, -15)
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
                                Text("Sign Up")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.red).opacity(0.7)
                                Spacer()
                            }
                            
                            VStack(alignment: .leading){
                                Text("Hello there !")
                                    .font(.title)
                                
                                Text("Let's create a new user")
                                    .font(.title)
                                    
                            }
                            
                        }
                        .padding(.leading, 5)
                        .padding(.bottom, 10)
                        
                        TextField("Username", text: $username)
                            .padding()
                            .frame(height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black)
                            )
                        
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
                        
                        
                        CustomButtonView(title: "Sign Up", frameWidth: 330, titleColor: .white){
                            // LOGIN ACTION
                        }
                        .padding(.top, 15)
                        
                    }
                    .padding(.top, -70)
                    
                    Spacer()
                
                    
                    // MARK: FOOTER
                    HStack{
                        Text("You have already account ?")
                        Button{
                            signInGecis = true
                        }label: {
                            Text("Sign In")
                                .foregroundStyle(.red)
                        }
                        .navigationDestination(isPresented: $signInGecis){
                            LoginPage()
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
    SignUpPage()
}
