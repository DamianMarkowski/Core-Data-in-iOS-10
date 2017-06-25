//
//  UniversityDetailsViewController.swift
//  Core Data in iOS 10
//
//  Created by Damian Markowski on 25.06.2017.
//  Copyright © 2017 Damian Markowski. All rights reserved.
//

import UIKit

class UniversityDetailsViewController: EditModeViewControllerCommon {
    @IBOutlet weak var displayContainer: UIStackView!
    @IBOutlet weak var editContainer: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var numberOfStudentsLabel: UILabel!
    @IBOutlet weak var isPublicSwitchDisplay: UISwitch!
    var selectedUniversity: University!
    var editMode: Bool!
    let screenTitle = "University details"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = screenTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContainersVisibility()
        populateData()
    }
    
    fileprivate func setContainersVisibility(){
        displayContainer.isHidden = editMode
        editContainer.isHidden = !editMode
    }
    
    fileprivate func populateData(){
        populateEditData()
        populateDisplayData()
    }
    
    fileprivate func populateDisplayData(){
        nameLabel.text = selectedUniversity.name
        countryLabel.text = selectedUniversity.country
        numberOfStudentsLabel.text = String(describing: selectedUniversity.numberOfStudents)
        isPublicSwitchDisplay.setOn(selectedUniversity.isPublic, animated: false)
    }
    
    fileprivate func populateEditData(){
        nameTextField.text = selectedUniversity.name
        countryTextField.text = selectedUniversity.country
        numberOfStudentsTextField.text = String(describing: selectedUniversity.numberOfStudents)
        isPublicSwitch.setOn(selectedUniversity.isPublic, animated: false)
    }
    
    @IBAction func editButtonClicked(_ sender: Any) {
        editMode = true
        setContainersVisibility()
        setUpSaveButton()
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        selectedUniversity.name = nameTextField.text
        selectedUniversity.country = countryTextField.text
        if let numberString = numberOfStudentsTextField.text {
            if let number = Int64(numberString) {
                selectedUniversity.numberOfStudents = number
            }
        }
        selectedUniversity.isPublic = isPublicSwitch.isOn
    }
}
