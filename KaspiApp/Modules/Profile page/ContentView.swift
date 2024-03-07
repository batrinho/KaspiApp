//
//  ContentView.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 15.01.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            NavBar(selectedTab: .constant(.services))
            LogoView(selectedImage: )
            NameTextField(placeholder: "Имя: ")
                .padding(.top)
            NameTextField(placeholder: "Фамилия: ")
                .padding(.top)
            Spacer()
            TabBar(selectedTab: .services)
        }
        .background(Color(.backgroundGray))
    }
}

#Preview {
    ContentView()
}
