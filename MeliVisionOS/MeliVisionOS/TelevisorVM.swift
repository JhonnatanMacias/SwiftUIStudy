//
//  TelevisorVM.swift
//  MeliVisionOS
//
//  Created by Jhonnatan Macias on 26/09/24.
//

import Foundation

@Observable
final class TelevisorVM {
    
    let interactor: Interactor
    var televisores: [Televisor]
    var selection: Televisor?
    
    init(interactor: Interactor = DataInteractor()) {
        self.interactor = interactor
        do {
            self.televisores = try interactor.loadTelevisor()
        } catch {
            self.televisores = []
        }
    }
}
