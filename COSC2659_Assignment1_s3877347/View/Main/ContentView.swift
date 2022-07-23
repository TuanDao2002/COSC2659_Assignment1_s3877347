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

struct ContentView: View {
    // universityVM is used to filter the data based on user inputs
    @EnvironmentObject var universityVM: UniversityViewModel
    
    // a state variable to store the user text input
    @State private var queryString = ""
    
    // a state variable to store the user's option to filter
    @State private var selection = "name"
    let options = ["name", "address"]
    
    // a state variable to store the fee range user wants to filter
    @State private var fee = "Any"
    let feeRange = ["Any", "< 10M","10M to 50M", "> 50M"]
    
    // a state variable to store the data that was filtered
    @State private var filteredUni: [University] = []
    func filter() {
        filteredUni = universityVM.filter(searchText: queryString, option: selection, feeRange: fee)
    }
    
    // the variable to display the prompt text in input text field
    var prompText: String {
        if selection == "name" {
            return "Keyword for name"
        } else if selection == "address" {
            return "Key word for address"
        } else {
            return "Enter keyword"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                // display the picker to choose the option to filter (name or address)
                Text("Filter by")
                    .font(.subheadline)
                Picker("filter option", selection: $selection) {
                    ForEach(options, id: \.self) {
                        Text("\($0)")
                    }
                }
                .onChange(of: selection) { value in
                    filter()
                }
                .padding(.horizontal, 5)
                .pickerStyle(.segmented)
                
                // display the picker to choose the fee range to filter
                Text("Annual tuition fee range:")
                    .font(.subheadline)
                Picker("fee range", selection: $fee) {
                    ForEach(feeRange, id: \.self) {
                        Text("\($0)")
                    }
                }
                .onChange(of: fee) { value in
                    filter()
                }
                .padding(.horizontal, 5)
                .pickerStyle(.segmented)

                // display the filtered universities in form of a List
                List(filteredUni, id: \.id) { uni in
                    UniversityRow(uni: uni)
                }
                .listStyle(.plain)
                
                // use .searchable to display a searchbar for the list of universities
                .searchable(text: $queryString, prompt: prompText) {
                    ForEach(filteredUni, id: \.id) { result in
                        // help user to auto-complete while searching university by name
                        if selection == "name" {
                            Text(result.name).searchCompletion(result.name)
                        }
                    }
                }
                // filter the data when the search first appears
                .onAppear {
                    filter()
                }
                // filter the data when user type some string to the search bar
                .onChange(of: queryString) { value in
                    filter()
                }
                // title of the list
                .navigationTitle("🏫 in Vietnam")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UniversityViewModel())
    }
}
