//
//  ListPeopleRouter.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

/**
    Class to route to new view controller when it's needed to display something that current view controller is not responsible for.
 */
class ListPeopleRouter {
    weak var viewController: ListPeopleViewController?
    
    // MARK: Scene communication
    func passDataBetweenScenes(of segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPersonSegue" {
            print("Adding new person.")
        }
        else if segue.identifier == "ShowPersonSegue" {
            sendDataToEditPersonScene(segue, sender: sender)
        }
    }
    
    func sendDataToEditPersonScene(_ segue: UIStoryboardSegue, sender: Any?) {
        let destinationController = segue.destination as! EditPersonViewController
        let selectedTableCell = sender as! PersonCell
        
        destinationController.personIdentifier = selectedTableCell.objectIdentifier!
    }
}

// MARK: - Pass segue event to router for scene communication.
extension ListPeopleViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataBetweenScenes(of: segue, sender: sender)
    }
}
