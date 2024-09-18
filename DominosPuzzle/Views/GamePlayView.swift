//
//  CombinedDominoView.swift
//  DominosPuzzle
//
//  Created by Jeff  Hyde on 3/20/24.
//

import SwiftUI

struct GamePlayView: View {
    let size = CGSize(
        width: UIScreen.main.bounds.width/12,
        height: UIScreen.main.bounds.width/6
    )
    @State var gameViewModel: GameViewModel
    
    @State var showAlert: Bool = true 
    
    init(viewModel: GameViewModel = GameViewModel(difficulty: .easy, level: 1)) {
        self.gameViewModel = viewModel
    }
    
    var body: some View {
        HStack {
            ScrollView {
                VStack(spacing: 0) {
                    gameView
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 4, style: .circular)
                    .fill(Color.blue)
                    .frame(width: UIScreen.main.bounds.width/5 + 16)
                keyView
                    .padding()
                
            }
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Game Over"), message: Text("You ran out of chances"), dismissButton: .cancel())
        }
    }
    
    @ViewBuilder
    var gameView: some View {
        let chunked = gameViewModel.viewModels.chunked(into: 4)
        Grid {
            ForEach(Array(chunked.enumerated()), id: \.offset) { index, viewModels in
                GridRow {
                    ForEach(Array(viewModels.enumerated()), id: \.offset) { index, viewModel in
                        
                        if index % 2 == 0 {
                            DominoView(
                                viewModel: viewModel,
                                size: size
                            )
                            .padding(size.width/5)
                            .rotationEffect(Angle(degrees: 90))
                        } else {
                            DominoView(
                                viewModel: viewModel,
                                size: size
                            )
                            .padding(size.width/5)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var keyView: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(gameViewModel.keyViewModels) { vm in
                    if vm.existInKey {
                        DominoView(
                            viewModel: vm,
                            isVertical: false,
                            size: CGSize(
                                width: UIScreen.main.bounds.width/10,
                                height: UIScreen.main.bounds.width/5
                            )
                        )
                    }
                }
            }
        }
    }
}

struct GamePlayView_Previews: PreviewProvider {
    static var previews: some View {
        GamePlayViewTest()
    }
}

struct GamePlayViewTest: View {
    @State var viewModel: GameViewModel = GameViewModel(difficulty: .easy, level: 1)
    var body: some View {
        GamePlayView(viewModel: viewModel)
    }
}
