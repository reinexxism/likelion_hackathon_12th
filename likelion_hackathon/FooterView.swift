//
//  FooterView.swift
//  likelion_hackathon
//
//  Created by 최주현 on 8/6/24.
//
import SwiftUI

struct FooterVIew: View {
    var body: some View {
        NavigationView{
            TabView(selection: .constant(1)){
                MainView()
                    .tabItem {
                        Label("Main", systemImage: "house.fill")
                    }
                    .foregroundColor(.black)
                UserSettingView()
                    .tabItem{
                        Label("MY", systemImage: "person")
                    }
                    .foregroundColor(.black)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    FooterVIew()
}
