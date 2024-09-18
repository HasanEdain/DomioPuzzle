//
//  TestView.swift
//  DominosPuzzle
//
//  Created by Jeff  Hyde on 3/20/24.
//

import SwiftUI

struct TestView: View {
    
    var body: some View {
        VStack(spacing: 8) {
            VerticalNineDotView(viewModel: NineDotViewModel(type: .six, existInKey: true, usedForKey: false))
            VerticalNineDotView(viewModel: NineDotViewModel(type: .five, existInKey: true, usedForKey: false))
        }.frame(width: 50, height: 100)
        
        HStack(spacing: 8) {
            HorizontalNineDotView(viewModel: NineDotViewModel(type: .six, existInKey: false, usedForKey: false))
            HorizontalNineDotView(viewModel: NineDotViewModel(type: .five, existInKey: false, usedForKey: false))
        }.frame(width: 100, height: 50)
    }
}

#Preview {
    TestView()
}
