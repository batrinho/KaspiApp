//
//  NameTextField.swift
//  KaspiApp
//
//  Created by Batyr Tolkynbayev on 16.01.2024.
//

import SwiftUI

struct NameTextField: View {
    @State private var userInput: String = ""
    @State var placeholder: String
    
    var body: some View {
        HStack {
            Text(placeholder)
                .foregroundColor(.black)
                .bold()
            TextField("", text: $userInput)
                .onChange(of: userInput) { oldValue, newValue in
                    
                }
            Spacer()
            Image(userInput.isEmpty ? "pen" : "done")
                    .resizable()
                    .frame(width: 20, height: 20)
        }
        .padding()
        .background(Color(.white))
    }
}
