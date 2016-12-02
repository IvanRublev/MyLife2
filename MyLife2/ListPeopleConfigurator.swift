//
//  ListPeopleConfigurator.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

/**
    Class to build view controller's dependency tree. Makes and links ViewController, Interactor, and Presenter objects.
 */
class ListPeopleConfigurator {
    static let sharedInstance = ListPeopleConfigurator()
    
    func configure(viewController: ListPeopleViewController) {
        let router = ListPeopleRouter()
        router.viewController = viewController
        
        let presenter = ListPeoplePresenter()
        presenter.output = viewController
        
        let interactor = ListPeopleInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
