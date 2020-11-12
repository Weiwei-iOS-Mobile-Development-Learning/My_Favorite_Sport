//
//  TableViewController.swift
//  MidApp2
//
//  Created by NDHU_CSIE on 2020/11/12.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var sportNames = ["Baseball","Basketball","Football","Other"]
    var sportImages = ["baseball","basketball","football","other"]
    var sportIsChecked = Array(repeating: false, count: 21)
    var sportImages2 = ["baseball_photo","basketball_photo","football_photo","other_photo"]
    
    @IBOutlet var myLabel: UILabel!
    
    func selected(checkedOrNot:Bool, name: String) -> String {
        var ans = ""
        
        if checkedOrNot == true {
            ans += name
        }
        return ans
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         navigationController?.navigationBar.prefersLargeTitles = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sportNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as!TableViewCell
        // Configure the cell...
        cell.nameLabel.text = sportNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: sportImages[indexPath.row])
        
        if sportIsChecked[indexPath.row] {
        cell.accessoryType = .checkmark
        } else {
        cell.accessoryType = .none
        }

        cell.accessoryType = sportIsChecked[indexPath.row] ? .checkmark : .none
        
        return cell
    }
    
   
    
   override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
         
         let likeAction = UIContextualAction(style: .normal, title: "Like") { (action, sourceView, completionHandler) in
            //set the cell of the current row to be selected
            let cell = tableView.cellForRow(at: indexPath)as! TableViewCell
            //get the selected cell
            
            //set the accessoryType of the selected cell to be checked
            cell.accessoryType = .checkmark
            self.sportIsChecked[indexPath.row] = true
            //call a function: self. finalSelection()
            let ans = self.selected(checkedOrNot: self.sportIsChecked[indexPath.row], name: self.sportNames[indexPath.row])
            self.myLabel.text = "My favorite sport is " + ans
             completionHandler(true)
         }
             
         let swipeConfiguration = UISwipeActionsConfiguration(actions: [likeAction])
         
         return swipeConfiguration
     }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
        let dislikeAction = UIContextualAction(style: .normal, title: "Dislike") { (action, sourceView, completionHandler) in
            
            let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
            cell.accessoryType = .none
            self.sportIsChecked[indexPath.row] = false
            
            
            completionHandler(true)
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [dislikeAction])
        
        return swipeConfiguration
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                destinationController.sportImageName = sportImages2[indexPath.row]
            }
        }
    }

}
