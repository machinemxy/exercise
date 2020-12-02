//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by 马学渊 on 2018/02/08.
//  Copyright © 2018年 Ma Xueyuan. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {

	var emojis: [Emoji]!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//get store path
		let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
		let archiveURL = documentDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
		
		//decode the emoji
		let propertyListDecoder = PropertyListDecoder()
		if let emojisData = try? Data(contentsOf: archiveURL), let decodedEmojis = try? propertyListDecoder.decode([Emoji].self , from: emojisData) {
			emojis = decodedEmojis
		} else {
			emojis = []
		}
		
		//set the edit button
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		
		if segue.identifier == "EditEmoji" {
			let indexPath = tableView.indexPathForSelectedRow!
			let emoji = emojis[indexPath.row]
			let addEditEmojiTableViewController = segue.destination as! AddEditEmojiTableViewController
			addEditEmojiTableViewController.emoji = emoji
		}
	}
	
	@IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
		guard segue.identifier == "saveUnwind" else {return}
		let addEditEmojiTableViewController = segue.source as! AddEditEmojiTableViewController
		guard let emoji = addEditEmojiTableViewController.emoji else {return}
		if let selectedIndexPath = tableView.indexPathForSelectedRow {
			//edit
			emojis[selectedIndexPath.row] = emoji
			tableView.reloadRows(at: [selectedIndexPath], with: .none)
		} else {
			//insert
			let newIndexPath = IndexPath(row: emojis.count, section: 0)
			emojis.append(emoji)
			tableView.insertRows(at: [newIndexPath], with: .automatic)
		}
		
		saveEmojis()
	}
	
	func saveEmojis() {
		let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
		let archiveURL = documentDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
		let propertyListEncoder = PropertyListEncoder()
		let encodedEmojis = try? propertyListEncoder.encode(emojis)
		((try? encodedEmojis?.write(to: archiveURL, options: .noFileProtection)) as ()??)
	}

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return emojis.count
		} else {
			return 0
		}
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
		
		let emoji = emojis[indexPath.row]
		
		cell.update(with: emoji)
		cell.showsReorderControl = true

        return cell
    }

	override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
		return UITableViewCell.EditingStyle.delete
	}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
			emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
			saveEmojis()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
		let emoji = emojis.remove(at: fromIndexPath.row)
		emojis.insert(emoji, at: to.row)
		saveEmojis()
		tableView.reloadData()
    }

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
