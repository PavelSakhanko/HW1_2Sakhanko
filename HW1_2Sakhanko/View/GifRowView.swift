//
//  GifRowView.swift
//  HW_1_2_ Sakhanko
//
//  Created by Pavel Sakhanko on 30.01.21.
//

import SwiftUI

struct GifRowView: View {
    
    var gif: GifData

    var body: some View {
        ZStack {
            Color.init(gif.url.contains(NetworkManager.ApiType.gifs.rawValue) ? .green : .red)

            VStack(alignment: .leading) {
                Text("\(gif.title)")
                    .font(.headline)
                Text("\(gif.url)")
                    .font(.subheadline)
            }
        }
    }
}