//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by 马学渊 on 2018/02/18.
//  Copyright © 2018年 Ma Xueyuan. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {

	var meals: [Meal] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		initMeals()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
	
	func initMeals() {
		let bread = Food(name: "Break", description: "a piece of bread")
		let milk = Food(name: "Milk", description: "a glass of milk")
		let bFoods = [bread, milk]
		let breakfast = Meal(name: "Breakfast", foods: bFoods)
		meals.append(breakfast)
		
		let burger = Food(name: "Burger", description: "a burger")
		let cola = Food(name: "Cola", description: "a bottle of cola")
		let potato = Food(name: "Potato", description: "fried potato")
		let lFoods = [burger, cola, potato]
		let lunch = Meal(name: "Lunch", foods: lFoods)
		meals.append(lunch)
		
		let pork = Food(name: "Pork", description: "a dish of pork")
		let rice = Food(name: "Rice", description: "a bowl of rice")
		let dFoods = [pork, rice]
		let dinner = Meal(name: "Dinner", foods: dFoods)
		meals.append(dinner)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].foods.count
    }

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return meals[section].name
	}
	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)

        let food = meals[indexPath.section].foods[indexPath.row]
		cell.textLabel?.text = food.name
		cell.detailTextLabel?.text = food.description

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
