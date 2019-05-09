//
//  SmileyDataSource.swift
//  UITableViewDataSourceExample
//
//  Created by 류성두 on 09/05/2019.
//  Copyright © 2019 Sungdoo. All rights reserved.
//

import Foundation
import UIKit

class CatDataSource: NSObject, UITableViewDataSource {
    var dataList: [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = dataList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "catCell", for: indexPath)
        cell.textLabel?.text = item
        return cell
    }
}

