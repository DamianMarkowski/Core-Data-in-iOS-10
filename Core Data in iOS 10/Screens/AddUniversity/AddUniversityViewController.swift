//
//  AddUniversityViewController.swift
//  Core Data in iOS 10
//
//  Created by Damian Markowski on 25.06.2017.
//  Copyright © 2017 Damian Markowski. All rights reserved.
//

import UIKit

class AddUniversityViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var isPublicSwitch: UISwitch!
    let screenTitle = "Add University"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = screenTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        if let name = nameTextField.text, let country = countryTextField.text, let numberOfStudents = numberOfStudentsTextField.text {
            let university = University(context: CoreDataManager.getContext())
            university.name = name
            university.country = country
            if let number = Int64(numberOfStudents) {
                university.numberOfStudents = number
            }
            university.isPublic = isPublicSwitch.isOn
            CoreDataManager.saveContext()
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        if let name = nameTextField.text, let country = countryTextField.text, let numberOfStudents = numberOfStudentsTextField.text {
            saveButton.isEnabled = name.characters.count > 0 && country.characters.count > 0 && numberOfStudents.characters.count > 0
        }
    }
}
