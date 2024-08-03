//
//  HomeView.swift
//  likelion_hackathon
//
//  Created by 최주현 on 8/3/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("이곳은 서비스의 타이틀이 들어갈 곳\n아직 미정입니다.")
                    .padding(.top, 300)
                
                Spacer()
                
                NavigationLink(destination: LoginView()) {
                    Text("나의 운동 기록 시작하기")
                        .padding(.horizontal, 70)
                        .padding(.vertical, 25)
                        .background(.black)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        
                }
                .padding(.bottom, 150)
            }
        }
    }
}

#Preview {
    HomeView()
}
