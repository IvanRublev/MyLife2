//
//  ListPeopleViewController.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

/**
    Class to control the table view of the scene.
 */
class ListPeopleViewController: UITableViewController, ListPeoplePresenterOutput {
    var output: ListPeopleInteractorInput!
    var router: ListPeopleRouter!
    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        ListPeopleConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: Event handling

    
    // MARK: Display logic

}
