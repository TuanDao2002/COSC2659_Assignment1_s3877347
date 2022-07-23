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

// a View to display logo in circle
struct CircleImage: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .clipShape(Circle()) // put the image in circle
            .frame(width: 200.0, height: 200.0) // set the width and height of image
            .overlay(Circle().stroke(Color.white, lineWidth: 4) // set a white border around image
            .shadow(radius: 10)) //set the shadow around image
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "rmit_logo")
    }
}
