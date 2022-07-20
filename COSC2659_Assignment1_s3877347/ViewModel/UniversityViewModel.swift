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

final class UniversityViewModel: ObservableObject {
    @Published var data: [University] = []
    
    init() {
        load()
    }
    
    func load() {
        self.data = Bundle.main.loadJSONFrom("universityData.json")
    }
    
    func filter(searchText: String, option: String) -> [University] {
        if searchText.count >= 1 {
            var matchingUniversities: [University] = []
            for university in data {
                var content = ""
                if option == "name" {
                    content = university.name
                } else if option == "address" {
                    content = university.address
                }
                
                if option == "fee" {
                    if let fee = Double(searchText) {
                        if university.annualTuitionFee <= fee {
                            matchingUniversities.append(university)
                            continue
                        }
                    } else {
                        return data
                    }
                }
                if content.lowercased().contains(searchText.lowercased()) {
                    matchingUniversities.append(university)
                }
            }
            
            return matchingUniversities
        } else {
            return data
        }
    }
}
