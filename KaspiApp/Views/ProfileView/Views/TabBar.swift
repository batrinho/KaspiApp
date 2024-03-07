//
//  TabBar.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 16.01.2024.
//

import SwiftUI

struct TabBar: View {
    @EnvironmentObject private var viewModel: ProfileViewModel

    var names: [String : String] = [
        "house" : "Главная",
        "tengesign.arrow.circlepath" : "Переводы",
        "list.bullet" : "Профиль"
    ]
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                VStack {
                    Image(systemName: tab.rawValue)
                        .frame(height: 17.5)
                    Text(names[tab.rawValue]!)
                        .font(.system(size: 10))
                }
                .foregroundStyle((viewModel.currentState == tab ? .red : .gray))
                Spacer()
            }
        }
        .padding()
        .background(Color(.white))
    }
}
