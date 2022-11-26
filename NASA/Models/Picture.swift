//
//  Picture.swift
//  NASA
//
//  Created by Юрий Губин on 22.11.2022.
//

import Foundation

struct Picture: Decodable {
    let copyright: String?
    let date: String
    let explanation: String
    let hdurl: String?
    let title: String
    let url: String
    
    var description: String {
        """
        \(date)
        \(title)
        """
    }
    
    var cd: String {
        """
        \(explanation)
        
        Copyright: \(copyright ?? "")
        """
    }
}
