//
//  Models.swift
//  NASA
//
//  Created by Юрий Губин on 22.11.2022.
//

import Foundation

struct Picture: Decodable {
    let date: String
    let explanation: String
    let hdurl: String?
    let title: String
    let url: String
}
