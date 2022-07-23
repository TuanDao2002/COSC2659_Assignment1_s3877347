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

import Foundation

// the ViewModel to retrieve data of universities and display them on Views
final class UniversityViewModel: ObservableObject {
    @Published var data: [University] = []
    
    init() { // initially load the data from JSON file when it is initialized
        load()
    }
    
    func load() {//load data from universityData.json
        self.data = Bundle.main.loadJSONFrom("universityData.json")
    }
    
    // function to filter the data based on user's input
    func filter(searchText: String, option: String, feeRange: String) -> [University] {
        var matchingUniversities: [University] = []
        if searchText.count >= 1 {// if user enters a string
            for university in data {
                var content = ""
                
                // filter the universities by name or address based on user's option
                if option == "name" {
                    content = university.name
                } else if option == "address" {
                    content = university.address
                }
                
                // find the university matching with the input by case - insensitive
                if content.lowercased().contains(searchText.lowercased()) {
                    matchingUniversities.append(university)
                }
            }
            
        } else { // if user does not enter a string, retrieve all data
            matchingUniversities = data
        }
        
        // filter the universities by a different ranges of annual tuition fee base on user's choice
        if feeRange == "< 10M" {
            matchingUniversities = matchingUniversities.filter{$0.annualTuitionFee < 10}
        } else if feeRange == "10M to 50M" {
            matchingUniversities = matchingUniversities.filter{$0.annualTuitionFee >= 10 && $0.annualTuitionFee <= 50}
        } else if feeRange == "> 50M" {
            matchingUniversities = matchingUniversities.filter{$0.annualTuitionFee > 50}
        }
        
        return matchingUniversities
    }
}
