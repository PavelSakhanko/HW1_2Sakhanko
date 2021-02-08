//
//  GifThirdView.swift
//  HW_1_2_ Sakhanko
//
//  Created by Pavel Sakhanko on 31.01.21.
//

import SwiftUI

struct GifThirdView: View {
    
    let title: String

    var body: some View {
        CustomNavigationView(destination: EmptyView(), isRoot: false, isLast: true, title: title) {
            VStack {
                Spacer()
                Text("3")
                Spacer()
            }
        }
    }
}
