//
//  VerticalNineDotView.swift
//  DominosPuzzle
//
//  Created by Jeff  Hyde on 3/20/24.
//

import SwiftUI

struct VerticalNineDotView: View {
    @ObservedObject var viewModel: NineDotViewModel
    
    var body: some View {
        GeometryReader { geometry in
            let spacing = geometry.size.width/16
            VStack {
                HStack {
                    DotView(viewModel: viewModel.viewModels[0])
                    DotView(viewModel: viewModel.viewModels[1])
                    DotView(viewModel: viewModel.viewModels[2])
                }
                HStack {
                    DotView(viewModel: viewModel.viewModels[3])
                    DotView(viewModel: viewModel.viewModels[4])
                    DotView(viewModel: viewModel.viewModels[5])
                }
                HStack {
                    DotView(viewModel: viewModel.viewModels[6])
                    DotView(viewModel: viewModel.viewModels[7])
                    DotView(viewModel: viewModel.viewModels[8])
                }
            }
            .padding(8)
            .frame(width: 50, height: 50)
            .overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.blue, lineWidth: 1))
            .contentShape(Rectangle())
            .onTapGesture {
                viewModel.onTap()
            }
        }
    }
}

#Preview {
    VStack {
        ForEach(DominoType.allCases, id: \.self) { type in
            VerticalNineDotView(
                viewModel:  NineDotViewModel(type: type, existInKey: false, usedForKey: false)
            )
        }
    }.padding(16)
}

