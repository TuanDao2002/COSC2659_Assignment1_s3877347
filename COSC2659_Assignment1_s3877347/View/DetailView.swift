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
        ScrollView {
                VStack {
                    MapView(name: data.name, latitude: data.latitude, longitude: data.longitude)
                        .frame(height: 300)

                    CircleImage(image: data.image)
                        .offset(y: -90)
                        .padding(.bottom, -90)

                    VStack(alignment: .leading) {
                        Text(data.name)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.title)

                        HStack {
                            Text(data.address)
                            Spacer()
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                        Divider()

                        Text("About \(data.name)")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system( size: 20, weight: .medium))
                        Text(data.description)
                            .font(.system(size: 20))
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(data.title)
                        .font(.title)
                        .padding(8)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(data: UniversityViewModel().data[0])
    }
}
