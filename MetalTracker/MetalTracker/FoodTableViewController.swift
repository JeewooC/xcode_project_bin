//
//  FoodTableViewController.swift
//  MetalTracker
//
//  Created by Jeewoo Chung on 9/17/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    var meals: [Meal] {
        get {
            let breakfast = Meal(name: "breakfast", food:
                [Food(name: "egg", description: "scrambled"), Food(name: "bacon", description: "crispy and salty"), Food(name: "waffles", description: "soft on the inside")])
            let lunch = Meal(name: "lunch", food:
                [Food(name: "rice", description: "white"), Food(name: "kimchi", description: "two different kinds"), Food(name: "lettuce", description: "fresh and washed")])
            let dinner = Meal(name: "dinner", food:
                [Food(name: "steak", description: "medium"), Food(name: "potatoes", description: "mashed"), Food(name: "sausage", description: "made in germany")])
            
            let allMeals = [breakfast, lunch, dinner]
            return allMeals
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals[section].food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        cell.textLabel?.text = meals[indexPath.section].food[indexPath.row].name
        cell.detailTextLabel?.text = meals[indexPath.section].food[indexPath.row].description

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }

}
