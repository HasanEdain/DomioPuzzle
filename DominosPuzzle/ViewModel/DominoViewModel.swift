//
//  DominoViewModel.swift
//  DominosPuzzle
//
//  Created by Hasan Edain on 9/15/24.
//

import Foundation
import Combine

class DominoViewModel: ObservableObject, Identifiable {
    @Published var id: String = UUID().uuidString
    @Published var topViewModel: NineDotViewModel
    @Published var bottomViewModel: NineDotViewModel
    @Published var difficultySettings: DifficultySettings
    @Published var isVertical: Bool
    @Published var showDomino: Bool
    @Published var existInKey: Bool

    private var cancellables = Set<AnyCancellable>()

    init(
        topViewModel: NineDotViewModel,
        bottomViewModel: NineDotViewModel,
        difficultySettings: DifficultySettings = .init(rotationRange: 0.0..<90.0, axisToRotate: [.horizontal]),
        isVertical: Bool = false,
        showDomino: Bool  = false,
        existInKey: Bool
    ) {
        self.topViewModel = topViewModel
        self.bottomViewModel = bottomViewModel
        self.difficultySettings = difficultySettings
        self.isVertical = isVertical
        self.showDomino = showDomino
        self.existInKey = existInKey

        setSelection()
    }

    func setSelection() {
        Publishers.CombineLatest(topViewModel.$selected, bottomViewModel.$selected)
            .sink { [weak self] topSelected, bottomSelected in
                self?.showDomino = (self?.existInKey == true) && topSelected && bottomSelected
            }
            .store(in: &cancellables)

            //        self.$showDomino.sink { [weak self] value in
            //            if value == true {
            //                if self?.topViewModel.usedForKey == true && self?.bottomViewModel.usedForKey == true  {
            //
            //                }
            //            }
            //        }
            //        .store(in: &cancellables)
    }
}

    extension Array {
        func chunked(into size: Int) -> [[Element]] {
            return stride(from: 0, to: count, by: size).map {
                Array(self[$0 ..< Swift.min($0 + size, count)])
            }
        }
    }
