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
import MapKit

extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            self.navigationViewStyle(.stack)
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var universityVM: UniversityViewModel
    @State private var queryString = ""
    @State private var selection = "name"
    let options = ["name", "address", "fee"]
    
    var filteredUni: [University] {
        if queryString.isEmpty {
            return universityVM.data
        } else {
            return universityVM.filter(searchText: queryString, option: selection)
        }
    }
    
    var prompText: String {
        if selection == "name" {
            return "Keyword for name"
        } else if selection == "address" {
            return "Key word for address"
        } else if selection == "fee" {
            return "Max tuition fee (millions VND/year)"
        } else {
            return "Enter keyword"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Filter by")
                    .font(.subheadline)
                Picker("filter option", selection: $selection) {
                    ForEach(options, id: \.self) {
                        Text("\($0)")
                    }
                }
                .padding(.horizontal, 5)
                .pickerStyle(.segmented)
                
                List(filteredUni, id: \.id) { object in
                    UniversityRow(object: object)
                }
                .searchable(text: $queryString, prompt: prompText) {
                    ForEach(filteredUni, id: \.id) { result in
                        if selection == "name" {
                            Text("\(result.name)").searchCompletion(result.name)
                        }
                    }
                }
                .navigationTitle("🏫 in Vietnam")
            }
        }

        .phoneOnlyStackNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UniversityViewModel())
    }
}
