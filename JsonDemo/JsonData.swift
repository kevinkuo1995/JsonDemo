//
//  JsonData.swift
//  JsonDemo
//
//  Created by KUO Chin Wei on 2020/4/1.
//  Copyright © 2020 KUO Chin Wei. All rights reserved.
//

import Foundation

struct JsonData: Decodable {
    let title: String
    let id: Int
    let thumbnailUrl: URL
    let url: URL
}
