//
//  ViewController.swift
//  UITableViewDataSourceExample
//
//  Created by 류성두 on 08/05/2019.
//  Copyright © 2019 Sungdoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - View
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    // MARK: - Model
    let modelController = ModelController()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func segementSelected(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentControl.selectedSegmentIndex == 0 {
            return modelController.kittisList.count
        }
        else {
            return modelController.smileyList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segmentControl.selectedSegmentIndex == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "catCell", for: indexPath)
            cell.textLabel?.text = modelController.kittisList[indexPath.row]
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "smileyCell", for: indexPath)
            cell.textLabel?.text = modelController.smileyList[indexPath.row]
            return cell
        }
    }
}

