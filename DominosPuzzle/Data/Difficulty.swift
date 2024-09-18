//
//  Difficulty.swift
//  DominosPuzzle
//
//  Created by Hasan Edain on 9/15/24.
//

import Foundation

enum Difficulty {
    case easy
    case medium
    case hard

    var settings: DifficultySettings {
        switch self {
            case .easy:
                return DifficultySettings(rotationRange: 0..<90, axisToRotate: [.horizontal])
            case .medium:
                return DifficultySettings(rotationRange: 0..<90, axisToRotate: [.horizontal, .vertical])
            case .hard:
                return DifficultySettings(rotationRange: -90..<90, axisToRotate: [.horizontal, .vertical])
        }
    }

    var numberOfKeys: Int {
        switch self {
            case .easy:
                return 1
            case .medium:
                return 2
            case .hard:
                return 3
        }
    }
}

extension Difficulty {
    static var random: Difficulty {
        let allCases: [Difficulty] = [
            .easy,
            .medium,
            .hard
        ]
        let randomIndex = Int(arc4random_uniform(UInt32(allCases.count)))
        return allCases[randomIndex]
    }
}

extension CaseIterable {
    static var random: Self {
        return Self.allCases.randomElement()!
    }
}
