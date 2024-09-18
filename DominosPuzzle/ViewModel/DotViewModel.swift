//
//  DotViewModel.swift
//  DominosPuzzle
//
//  Created by Hasan Edain on 9/15/24.
//

import SwiftUI

class DotViewModel: ObservableObject, Identifiable {
    let id: String = UUID().uuidString
    @Published var hidden: Bool
    @Published var selected: Bool {
        didSet {
            color = selected ? .red : .primary
        }
    }
    @Published var color: Color
    @Published var opacity: Double

    init(
        hidden: Bool,
        selected: Bool = false
    ) {
        self.hidden = hidden
        self.selected = selected
        self.color = selected ? .red : .primary
        self.opacity = hidden ? 0 : 1
    }
}
