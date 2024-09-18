//
//  NineDotViewModel.swift
//  DominosPuzzle
//
//  Created by Hasan Edain on 9/15/24.
//

import Foundation

class NineDotViewModel: ObservableObject, Identifiable {
    let id: String = UUID().uuidString
    @Published var viewModels: [DotViewModel]
    @Published var type: DominoType
    @Published var existInKey: Bool
    @Published var usedForKey: Bool
    @Published var selected: Bool

    init(
        type: DominoType = .zero,
        existInKey: Bool,
        usedForKey: Bool
    ) {
        self.type = type
        self.existInKey = existInKey
        self.usedForKey = usedForKey
        self.selected = usedForKey


        switch type {
            case .zero:
                self.viewModels = [
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true)
                ]
            case .one:
                self.viewModels = [
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true)
                ]
            case .two:
                self.viewModels = [
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true)
                ]

            case .three:
                self.viewModels = [
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true)
                ]
            case .four:
                self.viewModels = [
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false)
                ]
            case .five:
                self.viewModels = [
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false)
                ]
            case .six:
                self.viewModels = [
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: false),
                    DotViewModel(hidden: true),
                    DotViewModel(hidden: false)
                ]
        }
    }

    func onTap() {
        tapCount += 1

        if tapCount < 3 {
            if !usedForKey {
                selected.toggle()

                viewModels.indices.forEach { index in
                    viewModels[index].selected = selected
                    print("Tap")
                }
            }
        }
    }
}

var tapCount: Int = 0 {
    didSet {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TapCount"), object: nil, userInfo: ["tapCount" : tapCount])
    }
}
