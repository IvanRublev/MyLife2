//
//  EditPersonBoundaryModels.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

/**
    Structures that View Controller, Interactor and Presenter pass over boundary interfaces from one to other.
 */
struct EditPerson {
    struct Request {
        let identifier: Int?
        // For update
        var name: String!
        var dogPreference: Float!
        
        init(identifier: Int) {
            self.identifier = identifier
        }
        
        init(identifier: Int?, name: String, dogPreference: Float) {
            self.identifier = identifier
            self.name = name
            self.dogPreference = dogPreference
        }
    }
    struct Response {
        let name: String?
        let nameIsValid: Bool
        
        let image: UIImage?
        let dogPreference: Float?
        
        struct ViewModel {
            let name: String?
            let nameAsteriskHidden: Bool
            
            let image: UIImage?
            let dogPreference: Float?
        }
    }
}
