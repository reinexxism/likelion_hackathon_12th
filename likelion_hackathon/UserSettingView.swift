//
//  UserSettingView.swift
//  likelion_hackathon
//
//  Created by 최주현 on 8/3/24.
//

import SwiftUI

struct UserSettingView: View {
    @State private var showChangeSystemTheme: Bool = false
    @State private var showChangeSystemLanguage: Bool = false
    @State private var showChangeUserInfo: Bool = false
    @State private var isWithDraw: Bool = false
    @State private var isPushNotificationEnabled: Bool = false
    
    @State private var currentSystemTheme: String = "Green"
    @State private var currentSystemLang: String = "한국어"
    
    var body: some View {
        VStack {
            VStack {
                Text("settings")
            }
            .padding(.bottom, 30)
            
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 10)
                HStack {
                    Text("환영해요, ")
                        .font(.system(size: 23)) +
                    Text("bufslion")
                        .fontWeight(.semibold).font(.system(size: 23)) +
                    Text("님!")
                        .font(.system(size: 23))
                }
                .padding(.bottom, 3)
                HStack {
                    Text("현재 ")
                        .font(.system(size: 15)) +
                    Text("17일")
                        .font(.system(size: 16))
                        .foregroundColor(Color(hex: "#252525"))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        +
                    Text(" 동안 꾸준히 기록을 남기고 있어요")
                        .font(.system(size: 15))
                }
                .foregroundColor(Color(hex: "#6B6B6B"))
            }
            .padding(.bottom, 20)
            
            NavigationView {
                List {
                    HStack {
                        Button(action: {
                            showChangeSystemTheme = true
                        }) {
                            Text("시스템 테마 변경하기")
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                        }
                        .sheet(isPresented: $showChangeSystemTheme) {
                            ChangeSystemThemeView()
                        }
                        Spacer()
                        Text(currentSystemTheme)
                            .font(.system(size: 15))
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Button(action: {
                            showChangeSystemLanguage = true
                        }) {
                            Text("시스템 언어 변경하기")
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                        }
                        .sheet(isPresented: $showChangeSystemLanguage) {
                            ChangeSystemLangView()
                        }
                        Spacer()
                        Text(currentSystemLang)
                            .font(.system(size: 15))
                            .foregroundColor(.secondary)
                    }
                    
                    Toggle(isOn: $isPushNotificationEnabled) {
                        Text("푸시 알림 설정하기")
                            .font(.system(size: 15))
                    }
                }
            }
            .frame(width: .infinity, height: 200)
            .padding()
            .padding(.bottom, -25)
            
            NavigationView {
                List {
                    HStack {
                        Button(action: {
                            showChangeSystemTheme = true
                        }) {
                            Text("개인 정보 변경하기")
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                        }
                        .sheet(isPresented: $showChangeSystemTheme) {
                            ChangeSystemThemeView()
                        }
                        Spacer()
                    }
                    
                    HStack {
                        Button(action: {
                            showChangeSystemLanguage = true
                        }) {
                            Text("회원 탈퇴하기")
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                        }
                        .sheet(isPresented: $showChangeSystemLanguage) {
                            ChangeSystemLangView()
                        }
                        Spacer()
                    }
                }
            }
            .frame(width: .infinity, height: 150)
            .padding()
        }
    }
}

#Preview {
    UserSettingView()
}
