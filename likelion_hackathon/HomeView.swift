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
                VStack(alignment: .leading) {
                    HStack {
                        Text("SportTracker")
                            .padding(.top, 300)
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                        Image(systemName: "pencil.and.scribble")
                            .resizable()
                            .frame(width: 40, height: 30)
                            .foregroundColor(Color(hex: "#71A777"))
                            .padding(.top, 300)
                    }
                    .padding(.bottom, 5)
                    Text("당신만의 ")
                        .font(.system(size: 16)) +
                    Text("건강한 습관")
                        .fontWeight(.semibold) +
                    Text(" 기록")
                        .font(.system(size: 16))
                }
                
                Spacer()
                
                NavigationLink(destination: LoginView()) {
                    Text("나의 운동 기록 시작하기")
                        .padding(.horizontal, 70)
                        .padding(.vertical, 25)
                        .background(Color(hex: "#252525"))
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
