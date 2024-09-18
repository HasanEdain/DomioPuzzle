//
//  DotView.swift
//  DominosPuzzle
//
//  Created by Jeff  Hyde on 3/20/24.
//

import SwiftUI


struct DotView: View {
    @ObservedObject var viewModel: DotViewModel
    
    var body: some View {
        Circle()
            .foregroundColor(viewModel.color)
            .opacity(viewModel.opacity)
    }
}

#Preview {
    let vstack = VStack {
        DotView(viewModel: DotViewModel(hidden: false, selected: false))
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        DotView(viewModel: DotViewModel(hidden: true, selected: false))
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        DotView(viewModel: DotViewModel(hidden: false, selected: true))
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        DotView(viewModel: DotViewModel(hidden: true, selected: true))
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }

    return vstack
}


