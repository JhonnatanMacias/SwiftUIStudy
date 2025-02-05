//
//  DataInteractor.swift
//  MeliVisionOS
//
//  Created by Jhonnatan Macias on 26/09/24.
//

import Foundation

protocol Interactor {
    func loadTelevisor() throws -> [Televisor]
}

struct DataInteractor: Interactor {
    
    func loadTelevisor() throws -> [Televisor] {
        guard let url = Bundle.main.url(forResource: "televisoresDB", withExtension: "json") else {
            return []
        }
        
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Televisor].self, from: data)
    }
    
    
}
