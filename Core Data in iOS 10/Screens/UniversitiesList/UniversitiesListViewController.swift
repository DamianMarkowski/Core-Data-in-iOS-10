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
    let screenTitle = "Universities"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = screenTitle
        fetchUniversities()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        universities = []
        configureTableView()
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "addUniversity") as! AddUniversityViewController
        present(vc, animated: true, completion: nil)
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataManager.getContext().delete(universities[indexPath.row])
            universities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
