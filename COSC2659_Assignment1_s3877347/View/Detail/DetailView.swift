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
    var uni: University
    
    var rounded: String {
        if uni.annualTuitionFee.remainder(dividingBy: 10) == 0 {
            return String(format: "%.0f", uni.annualTuitionFee)
        } else {
            return String(format: "%.3f", uni.annualTuitionFee)
        }
    }
    
    var body: some View {
        ScrollView {
                VStack {
                    MapView(name: uni.name, latitude: uni.latitude, longitude: uni.longitude)
                        .frame(height: 300)

                    CircleImage(imageName: uni.imageName)
                        .offset(y: -90)
                        .padding(.bottom, -90)
                    
                    VStack(alignment: .leading) {
                        Text(uni.name)
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.title)

                        HStack (alignment: .top) {
                            Text("Address: \(uni.address)")
                                .font(.subheadline)
                            Spacer()
                            Divider()
                                .frame(width: 0.5)
                                .overlay(.black)
                            
                            VStack(alignment: .leading) {
                                Text("Annual tuition fee:")
                                    .font(.subheadline)
                                Text(">= \(rounded)M VND")
                            }
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                        Text("About \(uni.name)")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system( size: 20, weight: .medium))
                        Text(uni.description)
                            .font(.system(size: 20))
                            .multilineTextAlignment(.leading)
                        
                        Text("\nSome images of the university")
                            .fixedSize(horizontal: false, vertical: true)
                            .font(.system( size: 20, weight: .medium))
                        
                        ImageSlider(images: uni.imageSlides)
                    }
                    .padding()
                }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(uni.title)
                        .font(.title)
                        .padding(8)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(uni: UniversityViewModel().data[0])
    }
}
