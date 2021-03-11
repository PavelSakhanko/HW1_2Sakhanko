//
//  GifsFeedView.swift
//  HW_1_2_ Sakhanko
//
//  Created by Pavel Sakhanko on 30.01.21.
//

import SwiftUI

struct GifsFeedView: View {
    
    @ObservedObject var gifsFeed = GifsFeed()
    @State private var selectedSegment = 0

    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.red], for: .normal)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(gifsFeed) { (gif: GifData) in
                    GifRowView(gif: gif)
                        .frame(height: 120)
                        .onAppear {
                            gifsFeed.loadGifs(.gifs, currentItem: gif)
                        }
                }
                Picker(selection: $selectedSegment, label: Text("")) {
                    Text((NetworkManager.ApiType.gifs.description)).tag(0)
                    Text((NetworkManager.ApiType.stickers.description)).tag(1)
                }
                .onChange(of: selectedSegment) {
                    gifsFeed.loadGifs($0 == 0 ? .gifs : .stickers)
                }
                .frame(width: UIScreen.main.bounds.size.width / 2, height: 80, alignment: .center)
                .pickerStyle(SegmentedPickerStyle())
                .scaledToFit()
                .scaleEffect(CGSize(width: 1.5, height: 1.5))
            }
            .navigationBarTitle(Text("\(selectedSegment == 0 ? "Gifs" : "Stickers")"))
        }
    }
}
