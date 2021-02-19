//
//  TableViewController.swift
//  TodoApp
//
//  Created by Jeewoo Chung on 7/30/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, AddNewItemDelegate {
    
    var items: [Item] = [
        Item(title: "ToDo1", desc: "First one to do", priority: 1),
        Item(title: "ToDo2", desc: "Second one to do", priority: 1),
        Item(title: "ToDo3", desc: "Third one to do", priority: 1),
        Item(title: "ToDo4", desc: "Fourth one to do", priority: 1),
        Item(title: "ToDo5", desc: "Fifth one to do", priority: 1),
        Item(title: "ToDo6", desc: "Sixth one to do", priority: 1)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let addNewThingVC = segue.destination as! AddNewItemViewController
            addNewThingVC.delegate = self
        } else if segue.identifier == "editItem" {
            let addNewThingVC = segue.destination as! AddNewItemViewController
            addNewThingVC.item = items[selectedIndex!]
            addNewThingVC.delegate = self
        }
    }
    
    func addNew(item: Item) {
        items.append(item)
        tableView.reloadData()
    }
    
    func editNew(item: Item) {
        items[selectedIndex!] = item
        tableView.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing == true {
            print(true)
        } else {
            print(false)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "DoCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].todoDescription
        cell.detailTextLabel?.font = UIFont.init(name: "Gill Sans", size: 15)
        cell.detailTextLabel?.textColor = .gray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Hello"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    var selectedIndex: Int?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Go to AddNewThingVC with selected Item
        self.selectedIndex = indexPath.row
        performSegue(withIdentifier: "editItem", sender: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let rowToMove = items[sourceIndexPath.row]
        items.remove(at: sourceIndexPath.row)
        items.insert(rowToMove, at: destinationIndexPath.row)
    }

}
