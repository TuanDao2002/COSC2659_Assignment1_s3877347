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

// the View to display the detail information of a university
struct DetailView: View {
    var uni: University
    
    // rounding the Double number of annual tuition fee
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
                    // display the location of university on a map
                    MapView(name: uni.name, latitude: uni.latitude, longitude: uni.longitude)
                        .frame(height: 300)

                    // display the logo of university with a circle image
                    CircleImage(imageName: uni.imageName)
                        .offset(y: -90)
                        .padding(.bottom, -90)
                    
                    // display the universit's name, address, annual tuition fee, description
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
                        
                        // display a slider showing some images of the university
                        ImageSlider(images: uni.imageSlides)
                    }
                    .padding()
                }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar { // custom the navigation title of Detail View to display univeristy's title
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
