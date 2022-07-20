//
//  ImageSlider.swift
//  Uni in VN
//
//  Created by Tuan Dao on 20/07/2022.
//

import SwiftUI

struct ImageSlider: View {
    let images: [String];
    var body: some View {
        List {
            TabView {
                ForEach(images, id: \.self) { imageName in
                    VStack {
                        Image(imageName)
                            .resizable()
                            .overlay(ImageOverlay(imageName: imageName), alignment: .topTrailing)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 300)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

        }
    }
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlider(images: ["Melbourne Theatre", "bku_logo", "bku_logo"])
    }
}
