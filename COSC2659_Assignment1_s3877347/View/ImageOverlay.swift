//
//  ImageOverlay.swift
//  Uni in VN
//
//  Created by Tuan Dao on 20/07/2022.
//

import SwiftUI

struct ImageOverlay: View {
    var imageName: String
    var body: some View {
        ZStack {
            Text(imageName)
                .font(.callout)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(10.0)
        .padding(6)
    }
}

struct ImageOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ImageOverlay(imageName: "Melbourne Theatre")
    }
}
