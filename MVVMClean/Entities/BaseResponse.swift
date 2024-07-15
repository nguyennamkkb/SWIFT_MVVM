//
//  BaseResponse.swift
//  MVVMClean
//
//  Created by Mac mini on 15/07/2024.
//

import Foundation


struct BaseResponse<T: Codable>: Codable {
    let data: T?
    let currentPage: Int?
    let pageSize: Int?
    let total: Int?
}
