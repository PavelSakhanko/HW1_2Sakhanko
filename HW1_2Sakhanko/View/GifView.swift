//
//  GifView.swift
//  HW_1_2_ Sakhanko
//
//  Created by Pavel Sakhanko on 31.01.21.
//

import SwiftUI

struct GifView: View {
    
    let title: String
    
    var body: some View {
        CustomNavigationView(destination: GifThirdView(title: title), isRoot: false, isLast: false, title: title) {
            VStack {
                Spacer()
                Text("2")
                Spacer()
            }
        }
    }
}
