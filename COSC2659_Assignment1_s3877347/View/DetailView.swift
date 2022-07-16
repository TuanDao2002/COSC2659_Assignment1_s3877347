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

struct DetailView: View {
    var data: University
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(data.name)")
            Text("Address: \(data.address)")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(data: UniversityViewModel().data[0])
    }
}
