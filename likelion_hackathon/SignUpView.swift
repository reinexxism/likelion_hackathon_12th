//
//  SignUpView.swift
//  likelion_hackathon
//
//  Created by 최주현 on 8/3/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var showAlert: Bool = false
    @State private var navigateToLogin: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: LoginView()) {
                    Text("Log in")
                        .font(.system(size: 20))
                        .foregroundColor(Color(hex: "#A4A4A4"))
                }
            }
            .padding(.bottom, 30)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Sign Up")
                        .font(.system(size: 35))
                        .fontWeight(.semibold)
                        .padding(.bottom, -3)
                    Text("나만의 운동 기록을 시작해볼까요?")
                        .font(.system(size: 17))
                        .foregroundColor(Color(hex: "#7C7C7C"))
                }
                Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.bottom, 50)
            
            VStack(spacing: 15) {
                TextField("email", text: $email)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                TextField("password", text: $password)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                TextField("nickname", text: $name)
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                
            }
            .padding(.horizontal, 25)
            .padding(.bottom, 15)
            
            Button(action: {showAlert = true}) {
                Text("Sign Up")
            }
            .padding(.horizontal, 120)
            .padding(.vertical, 15)
            .background(Color(hex: "#252525"))
            .cornerRadius(20)
            .foregroundColor(.white)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("성공적으로 회원가입 완료"),
                    message: Text("bufslion님, 환영해요!"),
                    primaryButton:.default(Text("로그인하기").font(.system(size: 13)), action: {
                        navigateToLogin = true
                    }),
                    secondaryButton: .cancel(Text("확인"))
                )
            }
            
            NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
                EmptyView()
            }
            .padding(.bottom, 200)
        }
    }
}

#Preview {
    SignUpView()
}
