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

import UIKit
import SwiftUI

// the model for each university
class University: Identifiable, Decodable {
    var id: Int
    var imageName: String
    var name: String
    var title: String
    var address: String
    var annualTuitionFee: Double
    var description: String
    var link: String
    var imageSlides: [String]
    var latitude: Double
    var longitude: Double
}

