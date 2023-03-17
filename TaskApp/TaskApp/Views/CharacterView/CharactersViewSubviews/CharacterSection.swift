//
//  CharacterSection.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 16.03.2023.
//

import SwiftUI

struct CharacterSection: View {
    
    @ObservedObject var viewModel: CharactersListViewModel
    let character: SingleCharacter!
    
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 50, maxWidth: 100, minHeight: 50, maxHeight: 100)

            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.custom("Verdana-Bold", size: 18))
                    .foregroundColor(.orange)
                Text(character.location.name)
                    .font(.custom("Verdana", size: 14))
                    .padding(.vertical, 1)
                Text("Episode:")
                    .font(.custom("Verdana", size: 14))
                    .onAppear {
                        
                    }
                Text(viewModel.getSingleCharacterFirstAppearence(charater: character))
                    .font(.custom("Verdana", size: 12))
                    .lineLimit(1)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.white)
        .cornerRadius(20)
        .clipped()
        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 10)
    }
}
