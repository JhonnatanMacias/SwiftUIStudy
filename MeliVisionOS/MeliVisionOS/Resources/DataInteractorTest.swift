//
//  DataInteractorTest.swift
//  MeliVisionOS
//
//  Created by Jhonnatan Macias on 26/09/24.
//

import Foundation

struct DataInteractorTest: Interactor {
    
    func loadTelevisor() throws -> [Televisor] {
        guard let url = Bundle.main.url(forResource: "televisoresDBTest", withExtension: "json") else {
            return []
        }
        
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Televisor].self, from: data)
    }
}
