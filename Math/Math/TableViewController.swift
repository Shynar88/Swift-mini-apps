//
//  TableViewController.swift
//  Math
//
//  Created by Шынар Торехан on 30/06/2017.
//  Copyright © 2017 Шынар Торехан. All rights reserved.
//

import UIKit




class TableViewController: UITableViewController {
    
    let userDefaults = UserDefaults.standard
    var arrOfArrOfMapsOfPlayerAndScore = [[String: Any]]()
    //var players = [(Int, String)]()
    override func viewDidLoad() {
        super.viewDidLoad()
        arrOfArrOfMapsOfPlayerAndScore = userDefaults.object(forKey: "PS") as! [[String : Any]]
        self.arrOfArrOfMapsOfPlayerAndScore.sort { (v1, v2) -> Bool in
            return (v1["score"] as! Int) > (v2["score"] as! Int)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//        let retrievedDic = userDefaults.value(forKey: "playersAndScores") as? [String: Int]
//
//        for (key, value) in retrievedDic! {
//            players.append((value, key))
//        }
//        players.sort { (a, b) -> Bool in return a.0 < b.0 }
//        
//        userDefaults.set(players, forKey: "sortedList")
        
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(String(describing: arrOfArrOfMapsOfPlayerAndScore[indexPath.row]["score"]!))" + " " + "\(String(describing: arrOfArrOfMapsOfPlayerAndScore[indexPath.row]["name"]!))" //name isn't shown
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfArrOfMapsOfPlayerAndScore.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


}
