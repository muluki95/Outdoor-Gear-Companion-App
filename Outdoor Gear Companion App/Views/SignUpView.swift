//
//  SignUpView.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 9/16/25.
//

import SwiftUI

struct SignUpView: View {
   @StateObject var viewModel = SignUpViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
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
                    TextField("Enter your fullname",text: $viewModel.fullname)
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
                
                Button{
                    Task{
                        try await viewModel.createUser()
                    }
                } label: {
                    Text("Sign Up")
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
                
                Button{
                    dismiss()
                } label: {
                    HStack{
                        Text("Already have an account?")
                        Text("Sign in")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                
            }
        }
    }
}


#Preview{
    SignUpView()
}
