//
//  UniversitiesListViewController.swift
//  Core Data in iOS 10
//
//  Created by Damian Markowski on 25.06.2017.
//  Copyright © 2017 Damian Markowski. All rights reserved.
//

import UIKit
import CoreData

class UniversitiesListViewController: UIViewController {

    @IBOutlet weak var noUniversitiesInfoLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "Cell"
    let cellXibName = "UniversityTableViewCell"
    var universities: [University]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        universities = []
        configureTableView()
        fetchUniversities()
    }
    
    fileprivate func configureTableView(){
        tableView.register(UINib(nibName: cellXibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    fileprivate func fetchUniversities(){
        let fetchRequest: NSFetchRequest<University> = University.fetchRequest()
        do {
            let result = try CoreDataManager.getContext().fetch(fetchRequest)
            updateNoUniversitiesInfoLabelVisibility(resultCount: result.count)
            if result.count > 0 {
                universities = result
                tableView.reloadData()
            }
        } catch {
            print("Error with request: \(error)")
        }
    }
    
    fileprivate func updateNoUniversitiesInfoLabelVisibility(resultCount : Int){
        noUniversitiesInfoLabel.isHidden = resultCount > 0
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
    }
}

extension UniversitiesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! UniversityTableViewCell
        cell.configure(universities[indexPath.row])
        return cell
    }
}
