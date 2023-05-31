//
//  BaseResponse.swift
//  ExpandableTableTask
//
//  Created by Ammar.M on 31/05/2023.
//

import Foundation

// MARK: - BaseResponse
struct BaseResponse<T: Decodable>: Decodable {
    let success: Bool
    let data: T
    let message: String
}
