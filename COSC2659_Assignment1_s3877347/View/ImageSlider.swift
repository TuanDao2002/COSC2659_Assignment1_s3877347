/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Author: Dao Kha Tuan
  ID: 3877347
  Created  date: 16/07/2022
  Last modified: 07/08/2022
  Acknowledgement: None
*/

import SwiftUI

struct ImageSlider: View {
    let images: [String];
    var body: some View {
        Group {
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
            .frame(height: 200)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlider(images: ["Melbourne Theatre"])
    }
}
