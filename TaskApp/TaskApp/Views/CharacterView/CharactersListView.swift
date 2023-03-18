//
//  CharactersView.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 16.03.2023.
//

import SwiftUI

struct CharactersListView: View {
    
    @ObservedObject var viewModel: CharactersListViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                viewTitle(title: viewModel.viewTitle)
                    .padding(.horizontal, 16)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(viewModel.charactersArray, id: \.id) { character in
                            CharacterSection(viewModel: viewModel,
                                             character: character)
                        }
                    }
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                }
            }
        }
    }
    
    @ViewBuilder
    func viewTitle(title: String) -> some View {
        Text(title)
            .font(.system(.largeTitle).bold())
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView(viewModel: CharactersListViewModel(coordinator: MainCoordinator()))
    }
}
