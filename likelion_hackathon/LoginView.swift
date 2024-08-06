//
//  LoginView.swift
//  likelion_hackathon
//
//  Created by 최주현 on 8/3/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .font(.system(size: 20))
                        .foregroundColor(Color(hex: "#A4A4A4"))
                }
            }
            .padding(.bottom, 30)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Log in")
                        .font(.system(size: 35))
                        .fontWeight(.semibold)
                        .padding(.bottom, -3)
                    Text("다시 오신 것을 환영해요!")
                        .font(.system(size: 17))
                        .foregroundColor(Color(hex: "#7C7C7C"))
                }
                Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.bottom, 50)
            
            
            VStack {
                TextField("email", text: $email)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                TextField("password", text: $password)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
            }
            .padding(.horizontal, 25)
            .padding(.bottom, 10)
            
            NavigationLink(destination: ContentView().modelContainer(for: Event.self)) {
                Text("Log in")
                    .padding(.horizontal, 120)
                    .padding(.vertical, 15)
                    .background(Color(hex: "#252525"))
                    .cornerRadius(20)
                    .foregroundColor(.white)
            }
            .padding(.bottom, 20)
            
            
            Text("or sign up with social account")
                .foregroundColor(Color(hex: "#929292"))
                .font(.system(size: 13))
                .padding(.bottom, 20)
            
            VStack(spacing: 14) {
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "#000000"))
                        .frame(width: 300, height: 45)
                        .cornerRadius(8)
                    HStack {
                        Text("Apple로 로그인")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                    }
                }
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "#EFD648"))
                        .frame(width: 300, height: 45)
                        .cornerRadius(8)
                    HStack {
                        Text("카카오톡으로 로그인")
                            .foregroundColor(Color(hex: "#020202"))
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                    }
                }
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "#05B819"))
                        .frame(width: 300, height: 45)
                        .cornerRadius(8)
                    HStack {
                        Text("네이버로 로그인")
                            .foregroundColor(Color(hex: "#FCFCFC"))
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                    }
                }
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "#F5F5F5"))
                        .frame(width: 300, height: 45)
                        .cornerRadius(8)
                    HStack {
                        Text("Sign In With Google")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
