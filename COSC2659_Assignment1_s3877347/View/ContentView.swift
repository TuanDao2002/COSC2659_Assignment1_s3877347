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
    @State var isPopoverShowing = false

    @State private var selection = "name"
    let options = ["name", "title", "description"]
    
    var filteredUni: [University] {
        if queryString.isEmpty {
            return universityVM.data
        } else {
            return universityVM.filter(searchText: queryString)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
//                    Text("Filter by")
//                        .font(.title3)
                Picker("filter option", selection: $selection) {
                    ForEach(options, id: \.self) {
                        Text("\($0)")
                            .font(.system(size: 30))
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 25)

                List(filteredUni, id: \.id) { object in
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
                .searchable(text: $queryString, prompt: "Enter keyword")

                .navigationTitle("🏫 in Vietnam")
                .minimumScaleFactor(0.01)
                
//                .navigationBarTitleDisplayMode(.inline)
            }
        }

//        .phoneOnlyStackNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UniversityViewModel())
    }
}
