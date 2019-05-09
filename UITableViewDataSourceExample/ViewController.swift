//
//  ViewController.swift
//  UITableViewDataSourceExample
//
//  Created by 류성두 on 08/05/2019.
//  Copyright © 2019 Sungdoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - View
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segmentControl: UISegmentedControl!
    var dataSources:[UITableViewDataSource] = []
    let catDataSource = CatDataSource()
    let smileyDataSOurce = SmileyDataSource()
    
    // MARK: - Model
    let modelController = ModelController()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catDataSource.dataList = modelController.kittisList
        smileyDataSOurce.dataList = modelController.smileyList
        dataSources = [catDataSource, smileyDataSOurce]
        
        tableView.dataSource = dataSources[0]
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func segementSelected(_ sender: UISegmentedControl) {
        tableView.dataSource = dataSources[sender.selectedSegmentIndex]
        tableView.reloadData()
    }
}
