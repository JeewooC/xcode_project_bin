//
//  DuringTableViewController.swift
//  Ski Maintenance Information
//
//  Created by Jeewoo Chung on 12/1/20.
//  Copyright © 2020 Jeewoo Chung. All rights reserved.
//

import UIKit

class DuringTableViewController: UITableViewController {

    let list = ["Tweaking Bindings", "Storing Skis", "Carrying Skis", "After-Ride Checklist"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = storyboard?.instantiateViewController(identifier: "Detail") as! DetailViewController
        detailVC.step = list[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }


}
