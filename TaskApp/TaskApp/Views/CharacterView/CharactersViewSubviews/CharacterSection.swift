//
//  CharacterSection.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 16.03.2023.
//

import SwiftUI
import URLImage

struct CharacterSection: View {
    
    @ObservedObject var viewModel: CharactersListViewModel
    
    let character: SingleCharacter!
    
    var body: some View {
        Button {
            withAnimation(.easeInOut.speed(2)) {
                viewModel.transferData(currentCharacter: character)
                viewModel.navigateTo(to: .characterDetails(id: character.id))
            }
        } label: {
            HStack {
                URLImage(url: URL(string: character.image)!) { image in
                                        image
                                            .resizable()
                                            .frame(minWidth: 100, maxWidth: 100, minHeight: 50, maxHeight: .infinity)
                                            .ignoresSafeArea()
                }.id(UUID())
                
                VStack(alignment: .leading,spacing: 4) {
                    Text(character.name)
                        .font(.system(.title3).bold())
                        .foregroundColor(.orange)
                    Text(character.location.name)
                        .font(.system(.subheadline))
                        .foregroundColor(.black)
                    Text("Episode:")
                        .font(.system(.subheadline))
                        .foregroundColor(.black)
                    Text(viewModel.getSingleCharacterFirstAppearence(charater: character))
                        .font(.system(.caption))
                        .lineLimit(1)
                        .foregroundColor(.black)
                    
                }
                .padding(.vertical)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 110)
            .background(.white)
            .cornerRadius(20)
            .clipped()
            .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 10)
        }
    }
}
