//
//  Countries.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import Foundation

protocol CommonData: Codable {
    var id: Int {set get}
    var title: String {set get}
    var status: Int {set get}
}

// MARK: - Countries
struct Countries: CommonData {
    var id: Int
    var title: String
    var status: Int
    var cities, states: [CommonData]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case status
    }
}
