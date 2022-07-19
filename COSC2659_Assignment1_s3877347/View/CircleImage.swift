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

struct CircleImage: View {
    var image: String
    var body: some View {
        Image(image)
            .resizable()
            .clipShape(Circle())
            .frame(width: 200.0, height: 200.0)
            .overlay(Circle().stroke(Color.white,lineWidth:4)
            .shadow(radius: 10))
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: "rmit_logo")
    }
}
