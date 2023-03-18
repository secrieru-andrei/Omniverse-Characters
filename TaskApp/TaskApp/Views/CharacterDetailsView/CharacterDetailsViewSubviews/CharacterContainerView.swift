//
//  CharacterContainerView.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 18.03.2023.
//

import SwiftUI
import URLImage

struct CharacterContainerView: View {
    @ObservedObject var viewModel: CharacterDetailsViewModel
    
    var body: some View {
        HStack {
            URLImage(url: URL(string: viewModel.currentCharacter.image)!) { image in
                image
                    .resizable()
                    .cornerRadius(20)
                    .frame(minWidth: 50, maxWidth: 150, minHeight: 50, maxHeight: .infinity)
                    .ignoresSafeArea()
            }.id(UUID())
            
            VStack(alignment: .leading) {
                Text("Last known location:")
                    .font(.subheadline)
                    .foregroundColor(.orange)
                Text(viewModel.currentCharacter.location.name)
                    .font(.caption)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text("First Seen In:")
                    .font(.subheadline)
                    .foregroundColor(.orange)
                Text(viewModel.getSingleCharacterFirstAppearence(charater: viewModel.currentCharacter))
                    .font(.caption)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text("Status:")
                    .font(.subheadline)
                    .foregroundColor(.orange)
                HStack {
                    if viewModel.currentCharacter.status == "Alive" {
                        Image(systemName: "circle.fill")
                            .foregroundColor(.green)
                            .font(.caption)
                        
                    } else {
                        Image(systemName: "circle.fill")
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                    Text(viewModel.currentCharacter.status)
                        .font(.caption)
                        .foregroundColor(.black)
                    
                }
                Spacer()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(.white)
        .cornerRadius(20)
        .clipped()
        
    }
}

struct CharacterContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterContainerView(viewModel: CharacterDetailsViewModel(coordinator: MainCoordinator()))
    }
}
