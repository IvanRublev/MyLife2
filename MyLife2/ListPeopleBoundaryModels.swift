//
//  ListPeopleBoundaryModels.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

/**
    Structures that View Controller, Interactor and Presenter pass over boundary interfaces from one to other.
 */
struct ListPeople {
    struct Request {
    }
    struct Response {
        struct Item {
            let identifier: Int
            let name: String?
            let image: UIImage?
        }
        var items: [Item]
        
        struct ViewModel {
            struct ItemViewModel {
                let identifier: Int
                let preparedName: String?
                let preparedImage: UIImage?
            }
            var itemsViewModel: [ItemViewModel]
        }
    }
}
