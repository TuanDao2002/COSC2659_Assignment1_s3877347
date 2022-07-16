//
//  ContentView.swift
//  COSC2659_Assignment1_s3877347
//
//  Created by Tuan Dao on 15/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(UniversityModel.data, id: \.id) { object in
                HStack {
                    Text("\(object.name) at \(object.location)")
                }
            }
            .navigationTitle("University Vietnam")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
