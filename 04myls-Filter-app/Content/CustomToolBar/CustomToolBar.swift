//
//  CustomToolBar.swift
//  04myls-Filter-app
//
//  Created by 04myls on R 5/06/18.
//

import Foundation
import SwiftUI

struct CustomToolBar: View {
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 112)
                .foregroundColor(.gray)
                .opacity(0.3)
                .overlay(Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: UIScreen.main.bounds.maxX, y: 0))
                }.stroke(lineWidth: 1)
                .fill(Color.gray))
        }
    }
}

struct CustomToolBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomToolBar()
    }
}
