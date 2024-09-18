//
//  DominoData.swift
//  DominosPuzzle
//
//  Created by Jeff  Hyde on 3/20/24.
//

import Foundation
 
enum DominoType: Int, CaseIterable {
    case zero = 0, one, two, three, four, five, six
}

extension DominoType {
    static var random: DominoType {
        let allCases = DominoType.allCases
        let randomIndex = Int(arc4random_uniform(UInt32(allCases.count)))
        return allCases[randomIndex]
    }
}
