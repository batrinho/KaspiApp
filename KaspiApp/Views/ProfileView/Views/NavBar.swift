//
//  NavBar.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 16.01.2024.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "arrow.left")
                    .imageScale(.large)
                    .foregroundStyle(.red)
                    .frame(alignment: .leading)
                    .onTapGesture {
                        print("back button tapped")
                    }
                Spacer()
            }
            .padding(.leading)
            HStack {
                Text("Профиль")
                    .bold()
                    .frame(alignment: .center)
            }
        }
        .padding(.bottom)
        .background(Color(.white))
    }
}
