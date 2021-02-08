//
//  GifsFeedView.swift
//  HW_1_2_ Sakhanko
//
//  Created by Pavel Sakhanko on 30.01.21.
//

import SwiftUI

struct GifsFeedView: View {
    
    @ObservedObject var gifsFeed: GifsFeed = .init()
    @State private var selectedSegment = 0
    @State private var listType = NetworkManager.ApiType.gifs.description
    @State private var isAnimating = false

    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .red
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.red], for: .normal)
    }
    
    var body: some View {
        CustomNavigationView(destination: GifView(title: listType), isRoot: true, isLast: false, title: listType) {
            List(gifsFeed) { (gif: GifData) in
                GifRowView(gif: gif)
                    .frame(height: 120)
                    .onAppear {
                        gifsFeed.loadGifs(selectedSegment, currentItem: gif)
                    }
            }

            Picker(selection: $selectedSegment, label: Text("")) {
                Text((NetworkManager.ApiType.gifs.description)).tag(0)
                Text((NetworkManager.ApiType.stickers.description)).tag(1)
            }
            .onChange(of: selectedSegment) {
                isAnimating = true
                selectedSegment = $0
                setListName($0)
                gifsFeed.loadGifs($0, toggleTag: true)
                isAnimating = false
            }
            .frame(width: UIScreen.main.bounds.size.width / 2, height: 80, alignment: .center)
            .pickerStyle(SegmentedPickerStyle())
            .scaledToFit()
            .scaleEffect(CGSize(width: 1.5, height: 1.5))
        }

        if isAnimating {
            SpinnerView(isAnimating: $isAnimating, style: .medium)
        }
    }

    private func setListName(_ tag: Int) {
        listType = "\(tag == 0 ? NetworkManager.ApiType.gifs.description : NetworkManager.ApiType.stickers.description)"
    }
}
