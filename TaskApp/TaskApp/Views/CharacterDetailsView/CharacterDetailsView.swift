//
//  CharacterDetailsView.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 18.03.2023.
//

import SwiftUI

struct CharacterDetailsView: View {
    @ObservedObject var viewModel: CharacterDetailsViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                BackButton()
                Title(titleString: viewModel.currentCharacter.name)
                CharacterContainerView(viewModel: viewModel)
                    .padding(.horizontal)
                AlsoFromLocationView(viewModel: viewModel)
                    .onAppear {
                        viewModel.getCharactersFromLocation(location: viewModel.currentCharacter.location.name)
                    }
                Spacer()
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
    
    @ViewBuilder
    func BackButton() -> some View {
        HStack {
            Button {
                withAnimation(.easeInOut.speed(2)) {
                    viewModel.navigateTo(to: .charactersList)
                }
            } label: {
                HStack {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                    Text("Back")
                        .foregroundColor(.black)
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func Title(titleString: String) -> some View {
        HStack {
            Text(titleString)
                .font(.system(.largeTitle).bold())
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct CharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(viewModel: CharacterDetailsViewModel(coordinator: MainCoordinator()))
    }
}
