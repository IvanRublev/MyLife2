//
//  EditPersonRouter.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

/**
    Class to route to new view controller when it's needed to display something that current view controller is not responsible for.
 */
class EditPersonRouter {
    weak var viewController: EditPersonViewController?
    
    // MARK: Manual navigation
    func navigateToListPeople() {
        guard let viewController = viewController else {
            preconditionFailure()
        }
        /*
         Depending on style of presentation, this view controller needs to be
         dismissed in two different ways. We used a modal presentation for
         adding people, which needs to be dismissed. Editing an existing person
         used a 'push', which requires a 'pop' to return to the previous page.
         */
        let isPresentingInAddMode = viewController.presentingViewController is UINavigationController
        
        if isPresentingInAddMode {
            viewController.dismiss(animated: true, completion: nil)
        }
        else {
            viewController.navigationController!.popViewController(animated: true)
        }
    }
    
    // MARK: Scene communication
    func passDataBetweenScenes(of segue: UIStoryboardSegue) {
        if segue.identifier == "unwind" {
        }
    }
}

// MARK: - Pass segue event to router for scene communication.
extension EditPersonViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataBetweenScenes(of: segue)
    }
}
