//
//  EditPersonViewController.swift
//  MyLife2
//
//  Created by Ivan Rublev on 12/2/16.
//  Copyright (c) 2016 Ivan Rublev. All rights reserved.
//

import UIKit

/**
    Class to control the table view of the scene.
 */
class EditPersonViewController: UITableViewController, EditPersonPresenterOutput {
    var output: EditPersonInteractorInput!
    var router: EditPersonRouter!
    
    var personIdentifier: Int?
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet var nameAsterisk: UILabel!
    
    @IBOutlet weak var imageButton: UIButton!
    
    @IBOutlet weak var preferenceSlider: UISlider!
    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        EditPersonConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showPersonDataOnLoad()
    }
    
    // MARK: Event handling
    func showPersonDataOnLoad() {
        guard let personIdentifier = personIdentifier else { // adding new person
            return
        }
        let request = EditPerson.Request(identifier: personIdentifier)
        output.showPersonData(request)
        let _ = validateData()
    }
    
    func validateData() -> (EditPerson.Request, Bool) {
        let request = EditPerson.Request(identifier: personIdentifier,
                                         name: nameTextField.text ?? "",
                                         dogPreference: preferenceSlider.value)
        let validation = output.validatePersonData(request)
        return (request, validation)
    }
    
    // MARK: Display logic
    func displayPerson(_ viewModel: EditPerson.Response.ViewModel) {
        nameTextField.text = viewModel.name
        imageButton.setImage(viewModel.image, for: [])
        /*
         If they have a dog preference value set, update the slider,
         otherwise it will use the default value set in the Main.storyboard
         file.
         */
        if let dogPreference = viewModel.dogPreference {
            preferenceSlider.value = dogPreference
        }
    }
    
    func displayValidationError(_ viewModel: EditPerson.Response.ViewModel) {
        nameAsterisk.isHidden = viewModel.nameAsteriskHidden
    }
    
    // MARK: Navigation
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        router.navigateToListPeople()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "unwind" {
            let (request, valid) = validateData()
            if valid == true {
                output.updatePersonData(request)
                return true
            }
            else {
                return false
            }
        }
        return true
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let _ = validateData()
        return true
    }
}
