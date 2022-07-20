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
        let rounded = String(format: "%.3f", data.annualTuitionFee)
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

                        HStack (alignment: .top) {
                            Text("Address: \(data.address)")
                                .font(.subheadline)
                            Spacer()
                            Divider()
                                .frame(width: 0.5)
                                .overlay(.black)
                            Text("Annual tuition fee: \(rounded)M VND")
                                .font(.subheadline)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                        Text("About \(data.name)")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system( size: 20, weight: .medium))
                        Text(data.description)
                            .font(.system(size: 20))
                            .multilineTextAlignment(.leading)
                        
                        Text("\nSome images of the university")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system( size: 20, weight: .medium))
                        
                        ImageSlider(images: data.imageSlides)
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
