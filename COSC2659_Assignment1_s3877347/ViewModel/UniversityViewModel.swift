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

class UniversityViewModel: NSObject {
    public var data: [University]!
    
    override init() {
        super.init()
        load()
    }
    
    func load() {
        self.data = Bundle.main.loadJSONFrom("universityData.json")
    }
}
