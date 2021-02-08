//
//  CustomNavigationView.swift
//  HW_1_2_ Sakhanko
//
//  Created by Pavel Sakhanko on 31.01.21.
//

import SwiftUI

struct CustomNavigationView<Content: View, Destination: View>: View {
    let destination: Destination?
    let isRoot: Bool
    let isLast: Bool
    let title: String
    let content: Content

    @State var active = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(destination: Destination, isRoot: Bool, isLast: Bool, title: String, @ViewBuilder content: () -> Content) {
        self.destination = destination
        self.isRoot = isRoot
        self.isLast = isLast
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    HStack {
                        Image(systemName: "arrow.left")
                            .navIconModifier()
                            .onTapGesture(count: 1, perform: {
                                mode.wrappedValue.dismiss()
                            }).opacity(isRoot ? 0 : 1)
                        Spacer()
                        Text(title)
                            .foregroundColor(.red)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .navIconModifier()
                            .onTapGesture(count: 1, perform: {
                                active.toggle()
                            })
                            .opacity(isLast ? 0 : 1)
                        NavigationLink(
                            destination: destination.navigationBarHidden(true)
                                .navigationBarHidden(true),
                            isActive: $active,
                            label: {})
                    }
                    content
                        .navigationBarHidden(true)
                }
            }
         }
     }
 }
