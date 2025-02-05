//
//  Televisor.swift
//  MeliVisionOS
//
//  Created by Jhonnatan Macias on 26/09/24.
//

import Foundation
struct Televisor: Codable, Identifiable, Hashable {
    
    let id: Int
    let title: String
    let owner: String
    let overview: String
    let runtime: Int
    let tags: [String]
    let pills: [String]
    let poster: URL
    
    var tagsString: String {
        tags.formatted(.list(type: .and))
    }
    
    var pillStr: String {
        pills.formatted(.list(type: .and))
    }
}
