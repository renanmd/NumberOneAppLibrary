//
//  BookInfo.swift
//  NumberOneApp
//
//  Created by Renan Diniz on 23/07/19.
//  Copyright © 2019 RMD Goup. All rights reserved.
//

import Foundation

enum DecodingError: Error {
    case missingFile
}

struct UnitInfo: Decodable {
    let unitName: String
    let parts: [String]
}

struct ModuleInfo: Decodable {
    let moduleName: String
    let classes: [String]
}

struct BookInfo: Decodable {
    let bookTitle: String
    let coverImageName: String
    let units: [UnitInfo]
    let modules: [ModuleInfo]
}
