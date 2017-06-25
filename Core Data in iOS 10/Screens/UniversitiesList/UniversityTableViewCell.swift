//
//  UniversityTableViewCell.swift
//  Core Data in iOS 10
//
//  Created by Damian Markowski on 25.06.2017.
//  Copyright © 2017 Damian Markowski. All rights reserved.
//

import UIKit

class UniversityTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    var dataToPopulate: University!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func configure(_ data: University) {
        dataToPopulate = data
        populateData()
    }
    
    fileprivate func populateData(){
        name.text = dataToPopulate.name
    }
}
