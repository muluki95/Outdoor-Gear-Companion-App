//
//  LoginView.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/16/25.
//

import SwiftUI


struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View{
        NavigationStack {
            VStack{
                Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding()
                    .frame(width:150, height:150)
                
                //textfields
                VStack{
                    TextField("Enter your email",text: $viewModel.email)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal, 24)
                    SecureField("Enter your password", text: $viewModel.password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal, 24)
                }
                //forgot password
                Button{
                    
                    
                } label: {
                    Text("Forgot password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing,28)
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                //login button
                Button{
                    Task {
                        try await viewModel.login()
                    }
                    
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 44)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.vertical,24)
                
                Spacer()
                
                Divider()
                //sign up link
                NavigationLink{
                    SignUpView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack{
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                
            }
        }
    }
}


#Preview{
    LoginView()
}
