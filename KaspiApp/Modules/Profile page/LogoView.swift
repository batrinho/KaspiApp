//
//  LogoView.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 16.01.2024.
//

import SwiftUI

struct LogoView: View {
    @State var selectedImage: Image

    var body: some View {
        ZStack {
            Color("LogoViewColor")
            ZStack(alignment: .bottomTrailing) {
                selectedImage
                    .font(.system(size: 79))
                    .foregroundStyle(.white)
                Image(systemName: "camera.circle.fill")
                    .foregroundStyle(.red)
                    .background(Color(.white))
                    .cornerRadius(21)
                    .font(.system(size: 21))
            }
        }
        .frame(height: 164)
    }
}
