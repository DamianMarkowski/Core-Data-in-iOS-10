//
//  EditModeViewControllerCommon.swift
//  Core Data in iOS 10
//
//  Created by Damian Markowski on 25.06.2017.
//  Copyright © 2017 Damian Markowski. All rights reserved.
//

import UIKit

class EditModeViewControllerCommon: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var isPublicSwitch: UISwitch!
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        setUpSaveButton()
    }
    
    func setUpSaveButton(){
        if let name = nameTextField.text, let country = countryTextField.text, let numberOfStudents = numberOfStudentsTextField.text {
            saveButton.isEnabled = name.characters.count > 0 && country.characters.count > 0 && numberOfStudents.characters.count > 0
        }
    }
}
