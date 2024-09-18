//
//  DominoView.swift
//  DominosPuzzle
//
//  Created by Jeff  Hyde on 3/20/24.
//

import SwiftUI


struct DominoView: View {
    @ObservedObject var viewModel: DominoViewModel
    let isVertical: Bool
    let size: CGSize
    
    init(
        viewModel: DominoViewModel,
        isVertical: Bool = true,
        size: CGSize = CGSize(width: 50, height: 100)
    ) {
        self.viewModel = viewModel
        self.isVertical = isVertical
        self.size = size
    }
    
    var body: some View {
        if isVertical {
            VStack {
                VerticalNineDotView(viewModel: viewModel.topViewModel)
                    .padding(size.width/10)
                Spacer(minLength: .zero)
                VerticalNineDotView(viewModel: viewModel.bottomViewModel)
                    .padding(size.width/10)
                
            }
            .frame(width: size.width, height: size.height)
            .dominoOverlay(showDomino: viewModel.showDomino)
        } else {
            HStack {
                HorizontalNineDotView(viewModel: viewModel.topViewModel)
                    .padding(size.width/10)
                Spacer(minLength: .zero)
                HorizontalNineDotView(viewModel: viewModel.bottomViewModel)
                    .padding(size.width/10)
            }
            .frame(width: size.height, height: size.width)
            .dominoOverlay(
                showDomino: viewModel.showDomino,
                horizontal: true
            )
        }
    }
}

#Preview {
    DTest()
}

struct DTest: View {
    @State var viewModel: DominoViewModel = DominoViewModel(
        topViewModel: NineDotViewModel(
            type: .two, existInKey: false, usedForKey: false
        ),
        bottomViewModel: NineDotViewModel(
            type: .three, existInKey: false, usedForKey: false
        ),
        existInKey: true
    )
    
    var body: some View {
            DominoView(viewModel: viewModel)
    }
}

extension View {
    func dominoOverlay(
        showDomino: Bool,
        horizontal: Bool = false
    ) -> some View {
        self.modifier(
            DominoOverlayModifier(
                borderOpacity: showDomino ? 1 : 0,
                dividerOpacity: showDomino ? 1 : 0,
                horizontal: horizontal
            )
        )
    }
}

struct DominoOverlayModifier: ViewModifier {
    let borderOpacity: Double
    let dividerOpacity: Double
    let horizontal: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.primary, lineWidth: 1)
                    .opacity(borderOpacity)
            }
            .overlay {
                if horizontal {
                    Rectangle()
                        .frame(width: 1)
                        .opacity(dividerOpacity)
                        .padding(4)
                } else {
                    Rectangle()
                        .frame(height: 1)
                        .opacity(dividerOpacity)
                        .padding(4)
                }
            }
    }
}
