//
//  ListPeoplePresenter.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

// MARK: Boundary protocol
protocol ListPeoplePresenterOutput: class {
    
}

// MARK: Class
/**
    Class to format the data response from the Interactor and pass the result view model to the View Controller
 */
class ListPeoplePresenter: ListPeopleInteractorOutput {
    weak var output: ListPeoplePresenterOutput?
    
    // MARK: Presentation logic

}
