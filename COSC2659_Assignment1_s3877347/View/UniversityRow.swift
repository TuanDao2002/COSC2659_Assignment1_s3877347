//
//  UniversityRow.swift
//  COSC2659_Assignment1_s3877347
//
//  Created by Tuan Dao on 19/07/2022.
//

import SwiftUI

struct UniversityRow: View {
    var object: University
    var body: some View {
        HStack {
            Image(object.image)
                .resizable()
                .scaledToFit()
                .frame(height: 50)
            NavigationLink(object.name, destination: DetailView(data: object))
                .font(.system(size: 20))
                .padding(8)
                .minimumScaleFactor(0.01)
        }
    }
}

struct UniversityRow_Previews: PreviewProvider {
    static var previews: some View {
        UniversityRow(object: UniversityViewModel().data[0])
    }
}
