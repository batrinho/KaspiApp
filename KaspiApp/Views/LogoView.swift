//
//  LogoView.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 16.01.2024.
//

import SwiftUI

struct LogoView: View {
    @State private var isImageCollectionPresented = false
    @State var selectedImage: Image
    
    var body: some View {
        ZStack {
            Color("LogoViewColor")
            ZStack(alignment: .bottomTrailing) {
                selectedImage
                    .resizable()
                    .frame(width: 79, height: 79)
                    .cornerRadius(79)
                    .scaledToFill()
                    .foregroundStyle(.white)
                Image(systemName: "camera.circle.fill")
                    .foregroundStyle(.red)
                    .background(Color(.white))
                    .cornerRadius(21)
                    .font(.system(size: 21))
            }
            .onTapGesture {
                isImageCollectionPresented.toggle()
            }
        }
        .frame(height: 164)
        .sheet(isPresented: $isImageCollectionPresented, content: {
            ImageCollectionView(selectedImage: $selectedImage)
        })
    }
}
