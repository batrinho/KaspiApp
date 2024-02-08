//
//  ContentView.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 15.01.2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case main = "house"
    case qr = "qrcode"
    case messages = "message.badge"
    case services = "list.bullet"
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            NavBar(selectedTab: .constant(.services))
            LogoView(selectedImage: Image(systemName: "person.crop.circle"))
            NameTextField(placeholder: "Имя: ")
                .padding(.top)
            NameTextField(placeholder: "Фамилия: ")
                .padding(.top)
            Spacer()
            TabBar(selectedTab: .constant(.services))
        }
        .background(Color(.backgroundGray))
    }
}

#Preview {
    ContentView()
}
