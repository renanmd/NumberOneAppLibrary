//
//  Extensions.swift
//  NumberOneApp
//
//  Created by Renan Diniz on 23/07/19.
//  Copyright © 2019 RMD Goup. All rights reserved.
//

import Foundation

extension Array where Element == BookInfo {
    init(fileName: String) throws {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw DecodingError.missingFile
        }
        
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: url)
        self = try decoder.decode([BookInfo].self, from: data)
        
        //print("OK")
    }
}
