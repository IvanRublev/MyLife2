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
    func displayList(_ response: ListPeople.Response.ViewModel)
}

// MARK: Class
/**
 Class to format the data response from the Interactor and pass the result view model to the View Controller
 */
class ListPeoplePresenter: ListPeopleInteractorOutput {
    weak var output: ListPeoplePresenterOutput?
    
    // MARK: Presentation logic
    func presentList(_ response: ListPeople.Response) {
        var itemsViewModel: [ListPeople.Response.ViewModel.ItemViewModel] = []
        
        response.items.forEach { (item) in
            let name = item.name?.uppercased()
            
            let itemViewModel = ListPeople.Response.ViewModel
                                .ItemViewModel(identifier: item.identifier,
                                               preparedName: name,
                                               preparedImage: item.image)
            
            itemsViewModel.append(itemViewModel)
        }

        let viewModel = ListPeople.Response.ViewModel(itemsViewModel: itemsViewModel)
        output?.displayList(viewModel)
    }
}
