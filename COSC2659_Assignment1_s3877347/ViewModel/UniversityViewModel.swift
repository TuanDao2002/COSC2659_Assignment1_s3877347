//
//  UniversityViewModel.swift
//  COSC2659_Assignment1_s3877347
//
//  Created by Tuan Dao on 16/07/2022.
//

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
