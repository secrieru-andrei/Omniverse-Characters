//
//  AlsoFromLocationView.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 18.03.2023.
//

import SwiftUI
import URLImage

struct AlsoFromLocationView: View {
    
    @ObservedObject var viewModel: CharacterDetailsViewModel
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Also from: \(viewModel.currentCharacter.location.name)")
                .font(.headline.bold())
                .foregroundColor(.black)
                .padding(.horizontal)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(viewModel.charactersFromLocation, id: \.id) { character in
                        CustomButton(character: character)
                    }
                }
                .padding(.horizontal, 16)
                
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            }
        }
    }
    
    @ViewBuilder
    func CustomButton(character: SingleCharacter) -> some View {
        Button {
            withAnimation(.spring()) {
                viewModel.switchCharacter(character: character)
                viewModel.getCharactersFromLocation(location: character.location.name)
                viewModel.switchDetailsScreen(id: character.id)
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

struct AlsoFromLocationView_Previews: PreviewProvider {
    static var previews: some View {
        AlsoFromLocationView(viewModel: CharacterDetailsViewModel(coordinator: MainCoordinator()))
    }
}
