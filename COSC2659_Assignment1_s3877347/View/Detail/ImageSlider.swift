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

// a view to display images of a university in a slider
struct ImageSlider: View {
    let images: [String];
    var body: some View {
        Group {
            TabView {// use TabView to display images in a slider
                ForEach(images, id: \.self) { imageName in
                    VStack {
                        Image(imageName)
                            .resizable()
                        // put an overlay to describe the image
                            .overlay(ImageOverlay(imageName: imageName), alignment: .topTrailing)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 200)
            // remove whitespace at sides of the image
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ImageSlider(images: UniversityViewModel().data[0].imageSlides)
        }
    }
}
