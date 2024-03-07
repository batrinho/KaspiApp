//
//  TabBar.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 16.01.2024.
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedTab: Tab
    var names: [String : String] = [
        "house" : "Главная",
        "qrcode" : "Kaspi QR",
        "message.badge" : "Сообщения",
        "list.bullet" : "Сервисы"
    ]
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Spacer()
                VStack {
                    Image(systemName: tab.rawValue)
                        .frame(height: 17.5)
                    Text(names[tab.rawValue]!)
                        .font(.system(size: 10))
                }
                .foregroundStyle((selectedTab == tab ? .red : .gray))
                Spacer()
            }
        }
        .padding()
        .background(Color(.white))
    }
}

#Preview {
    TabBar(selectedTab: .constant(.services))
}
