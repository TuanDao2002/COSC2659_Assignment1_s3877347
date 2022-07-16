//
//  DataModel.swift
//  COSC2659_Assignment1_s3877347
//
//  Created by Tuan Dao on 16/07/2022.
//

import UIKit
import SwiftUI

struct University: Identifiable, Decodable {
    var id: Int
    var name: String
    var location: String
}

class UniversityModel: NSObject {
    public static var data: [University] = Bundle.main.load("universityData.json")
}
