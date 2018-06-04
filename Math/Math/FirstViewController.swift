//
//  FirstViewController.swift
//  Math
//
//  Created by Шынар Торехан on 30/06/2017.
//  Copyright © 2017 Шынар Торехан. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var bestPlayer: UILabel!
    @IBOutlet weak var bestScore: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    let userDefaults = UserDefaults.standard
    var arrOfArrOfMapsOfPlayerAndScore = [[String: Any]]()
    var difficulty = [0, 0]

    @IBAction func firstLevel(_ sender: UIButton) {
        firstButton.backgroundColor = UIColor.orange
        difficulty = [9, 1]
        userDefaults.set(difficulty, forKey: "difficulty")
    }
    
    @IBAction func secondLevel(_ sender: UIButton) {
        secondButton.backgroundColor = UIColor.orange
        difficulty = [99, 10]
        userDefaults.set(difficulty, forKey: "difficulty")
    }
    
    @IBAction func thirdLevel(_ sender: UIButton) {
        thirdButton.backgroundColor = UIColor.orange
        difficulty = [999, 100]
        userDefaults.set(difficulty, forKey: "difficulty")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

//        let sortedList = userDefaults.object(forKey: "sortedList") as? [(Int, String)]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstButton.backgroundColor = UIColor.blue
        secondButton.backgroundColor = UIColor.blue
        thirdButton.backgroundColor = UIColor.blue
        arrOfArrOfMapsOfPlayerAndScore = userDefaults.object(forKey: "PS") as? [[String : Any]] ?? [["name":"Best Player", "score": "0"]]
        self.arrOfArrOfMapsOfPlayerAndScore.sort { (v1, v2) -> Bool in
            return (v1["score"] as! Int) > (v2["score"] as! Int)
        
        }
        
        bestPlayer.text = arrOfArrOfMapsOfPlayerAndScore[0]["name"] as? String ?? "No nameee"
        bestScore.text = "\(String(describing: arrOfArrOfMapsOfPlayerAndScore[0]["score"]!))"
    }
}
