//
//  EditPersonConfigurator.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

/**
    Class to build view controller's dependency tree. Makes and links ViewController, Interactor, and Presenter objects.
 */
class EditPersonConfigurator {
    static let sharedInstance = EditPersonConfigurator()
    
    func configure(viewController: EditPersonViewController) {
        let router = EditPersonRouter()
        router.viewController = viewController
        
        let presenter = EditPersonPresenter()
        presenter.output = viewController
        
        let interactor = EditPersonInteractor()
        interactor.output = presenter
        interactor.persons = personDatabase
        
        viewController.output = interactor
        viewController.router = router
    }
}
