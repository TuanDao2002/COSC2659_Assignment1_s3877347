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

// a View to display each university in the List in ContentView
struct UniversityRow: View {
    var uni: University
    var body: some View {
        HStack {// use HStack to put items horizontally
            // display image of university logo
            Image(uni.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 50)
            
            // display the university name as the link to DetailView
            NavigationLink(uni.name, destination: DetailView(uni: uni))
                .font(.system(size: 20))
                .padding(8)
                .minimumScaleFactor(0.01)
        }
    }
}

struct UniversityRow_Previews: PreviewProvider {
    static var previews: some View {
        UniversityRow(uni: UniversityViewModel().data[0])
    }
}
