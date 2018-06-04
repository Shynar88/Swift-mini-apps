//
//  ViewController.swift
//  UserDefaults
//
//  Created by Zhanserik on 6/12/17.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    var list: [[String : Any]] = [[:]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        
//        let dataSource = DataSource()
//        self.tableView.dataSource = dataSource
        
        let standard = UserDefaults.standard
        
//        standard.set("Hello", forKey: "key")
//        print(standard.object(forKey: "key"))
        
        let match: [String : Any] = [
            "name" : "Tony",
            "score": 77777
        ]
//
//        standard.set(match, forKey: "game")
//        Singleton.shared         ??????????????????????
//        UIApplication.shared    ???????????????????????????????????
//        print(standard.object(forKey: "game"))        standard.value   difference??????????????????
        
        var leaderboard: [[String : Any]] = [
            ["name" : "John",
            "score": 12312],
            ["name" : "Sara",
             "score": 123],
            ["name" : "Ken",
             "score": 1231123],
            ["name" : "Max",
             "score": 12],
            ["name" : "Stieven",
             "score": 1112],
            ["name" : "Tony",
             "score": 12],
            ["name" : "Tor",
             "score": 112],
        ]
        
//        list.append([
//            "name" : textField.text,
//            "score" : Int(scoreField.text)
//            ])
        
        standard.set(leaderboard, forKey: "leaderboard")
        
        self.list = standard.object(forKey: "leaderboard") as! [[String : Any]]
        
        self.list.sort { (v1, v2) -> Bool in
            return (v1["score"] as! Int) > (v2["score"] as! Int)
        }
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: UITableViewDataSource methods
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
       
        let dict = self.list[indexPath.row]
        
        cell?.textLabel?.text = dict["name"] as? String
        cell?.detailTextLabel?.text = String(describing: dict["score"]!)    //what a syntax???????????????????
        
        return cell!
    }
}


