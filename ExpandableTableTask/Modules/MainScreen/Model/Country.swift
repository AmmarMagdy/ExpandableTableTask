//
//  Country.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import Foundation

struct CommonData: Decodable {
    
    var id: Int
    var title: String
    var status: Int
    var isOpend = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case status
    }
}

// MARK: - Countries
struct Country: Decodable {
    
    var entity: CommonData
    var cities: [City]?

    enum CodingKeys: String, CodingKey {
        case cities
    }

    init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            cities = try values.decode([City]?.self, forKey: .cities)
            entity = try CommonData(from: decoder)
        }
    }
}

struct City: Decodable {
    
    var entity: CommonData?
    var states: [State]?

    enum CodingKeys: String, CodingKey {
        case states
    }
    
    init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            states = try values.decode([State]?.self, forKey: .states)
            entity = try CommonData(from: decoder)
        }
    }
}

struct State: Decodable {
    
    var entity: CommonData?
    
    init(from decoder: Decoder) throws {
        do {
            entity = try CommonData(from: decoder)
        }
    }
}
