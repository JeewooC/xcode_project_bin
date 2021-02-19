//
//  AddNewThingVC.swift
//  TodoApp
//
//  Created by Jeewoo Chung on 7/30/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

// Delegate Pattern
protocol AddNewItemDelegate {
    func addNew(item: Item)
    func editNew(item: Item)
}

class AddNewItemViewController: UIViewController {
    
    @IBOutlet var addBarButtonItem: UIBarButtonItem!
    var item: Item?
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var descField: UITextField!
    @IBOutlet var priorityField: UISegmentedControl!
    var delegate: AddNewItemDelegate?

    private func updateUI() {
        addBarButtonItem.title = "Edit"
        titleField.text = item?.title
        descField.text = item?.todoDescription
        // Int       !=     Int?
        priorityField.selectedSegmentIndex = item?.priority ?? 1
    }
    
    @IBAction func addNewItem(_ sender: Any) {
        if item == nil {
            // get todoItem
            guard let titleText = titleField.text else { return }
            guard let descText = descField.text else { return }
            // optional unwrap
            self.delegate?.addNew(item: Item(title: titleText, desc: descText, priority: priorityField.selectedSegmentIndex))
            // back to TableViewController
            self.navigationController?.popViewController(animated: true)
        } else {
            guard let titleText = titleField.text else { return }
            guard let descText = descField.text else { return }
            self.delegate?.editNew(item: Item(title: titleText, desc: descText, priority: priorityField.selectedSegmentIndex))
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if item != nil {
            updateUI()
        }
    }
    
}
