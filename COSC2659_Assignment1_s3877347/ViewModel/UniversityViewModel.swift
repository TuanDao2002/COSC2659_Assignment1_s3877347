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
    
    func filter(searchText: String) -> [University] {
        if searchText.count > 1 {
            var matchingUniversities: [University] = []
            for university in data {
                let content = university.name + university.address + university.title
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
