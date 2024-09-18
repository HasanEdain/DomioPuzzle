//
//  GameViewModel.swift
//  DominosPuzzle
//
//  Created by Hasan Edain on 9/15/24.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var difficulty: Difficulty
    @Published var level: Int
    @Published var viewModels: [DominoViewModel]
    @Published var keyViewModels: [DominoViewModel]

    init(difficulty: Difficulty, level: Int) {
        self.difficulty = difficulty
        self.level = level
        self.viewModels = []
        self.keyViewModels = []
        setModels(difficultySettings: difficulty.settings)

    }

    func setModels(difficultySettings: DifficultySettings) {
        let models = getGameModels(difficultySettings: difficultySettings)
        viewModels = models.game
        keyViewModels = models.key
    }

    func getRange(for difficulty: Difficulty, from level: Int) -> (ClosedRange<Int>) {
        switch difficulty {
            case .easy:
                return (0...(12 + (level*2)))
            case .medium:
                return (0...(12 + (level*4)))
            case .hard:
                return (0...(12 + (level*8)))
        }

    }

    func getGameModels(difficultySettings: DifficultySettings) -> (game: [DominoViewModel], key: [DominoViewModel]) {
        let gameModels = (getRange(for: difficulty, from: level)).map { index in
            let randomTop = DominoType.random
            let randomBottom = DominoType.random

            let gameViewModel = generate(
                top: randomTop,
                bottom: randomBottom,
                difficultySettings: difficultySettings,
                existInKey: (index == 2) ? true : false,
                usedForKey: false
            )

            return gameViewModel
        }

        let keyModels = gameModels.filter { $0.existInKey }.map { model in
            let topViewModel = NineDotViewModel(
                type: model.topViewModel.type,
                existInKey: model.topViewModel.existInKey,
                usedForKey: true
            )
            let bottomViewModel = NineDotViewModel(
                type: model.bottomViewModel.type,
                existInKey: model.bottomViewModel.existInKey,
                usedForKey: true
            )

            return DominoViewModel(
                topViewModel: topViewModel,
                bottomViewModel: bottomViewModel,
                difficultySettings: model.difficultySettings,
                existInKey: model.existInKey
            )
        }

        return (gameModels, keyModels)
    }

    func generate(
        top: DominoType,
        bottom: DominoType,
        difficultySettings: DifficultySettings,
        existInKey: Bool,
        usedForKey: Bool
    ) -> DominoViewModel {
        let topViewModel = NineDotViewModel(type: top, existInKey: existInKey, usedForKey: usedForKey)
        let bottomViewModel = NineDotViewModel(type: bottom, existInKey: existInKey, usedForKey: usedForKey)

        return DominoViewModel(topViewModel: topViewModel, bottomViewModel: bottomViewModel, difficultySettings: difficultySettings, existInKey: existInKey)
    }
}
