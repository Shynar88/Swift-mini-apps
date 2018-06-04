//
//  ViewController.swift
//  Math
//
//  Created by Шынар Торехан on 29/06/2017.
//  Copyright © 2017 Шынар Торехан. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var border: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    let userDefaults = UserDefaults.standard
    var timer1: Timer?
    var timer2: Timer?
    var x = 0
    var y = 0
    var time = 10
    var score = 0
    var speed = 0.2
    //var playerName = ""
    
    
    @IBAction func submitButton(_ sender: UIButton) {
        if (x*y) == Int(textInput.text!){
            score += 1
            speed /= 2
            scoreLabel.text = "Score: \(score)"
            newQuestion()
            timer2?.invalidate()
            timer2 = Timer.scheduledTimer(timeInterval: speed, target: self, selector: #selector(moveQuestionLabel), userInfo: nil, repeats: true)
        }
        else{
            score -= 1
            speed *= 2
            scoreLabel.text = "Score: \(score)"
            timer2?.invalidate()
            timer2 = Timer.scheduledTimer(timeInterval: speed, target: self, selector: #selector(moveQuestionLabel), userInfo: nil, repeats: true)
        }
        textInput.text = nil
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)

        
        timer2 = Timer.scheduledTimer(timeInterval: speed, target: self, selector: #selector(moveQuestionLabel), userInfo: nil, repeats: true)
        
        newQuestion()
        textInput.layer.borderColor = UIColor.black.cgColor
        textInput.layer.borderWidth = 1.0
    }
    
    func updateTime(){
        time -= 1
        timer.text = "Time left: \(time) seconds"
        if time == 0 {
            timer1!.invalidate()
            timer2!.invalidate()
            questionLabel.text = nil
            let ac = UIAlertController(title: "Game is over!", message: "Your score is: \(score)", preferredStyle: .alert)
            ac.addTextField(configurationHandler: { (textField) in
                textField.placeholder = "Enter your name"
                //self.playerName = textField.text!
            })
            let acAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
                var arrOfArrOfMapsOfPlayerAndScore = self.userDefaults.array(forKey: "PS") as? [[String: Any]] ?? [[String: Any]]()
              
                
                
                
                let playerName = ac.textFields?[0].text ?? "Best Player"
                
                arrOfArrOfMapsOfPlayerAndScore.append(["name": playerName, "score": self.score])
                self.userDefaults.set(arrOfArrOfMapsOfPlayerAndScore, forKey: "PS")
                
                //var retrievedDic = self.userDefaults.value(forKey: "playersAndScores") as? [String: Int]
//                var mapOfPandS = [String: Int]()
//                mapOfPandS[self.playerName] = self.score
//                
//                self.userDefaults.set(mapOfPandS, forKey: "playersAndScores")
                self.navigationController?.popViewController(animated: true) //navigcontr??? how to go back twice
                //self.performSegue(withIdentifier: "detail", sender: nil)
                //self.navigationController?.popToRootViewController(animated: true)
            })
            
            
            
            
            ac.addAction(acAction)
            present(ac, animated: true, completion: nil)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//
//        if segue.identifier == "detail" {
//            let table = segue.destination as! TableViewController
//            table.players = playersList
//            table.scores = scoresList
//        }
//    }

    
    func moveQuestionLabel() {
        if(questionLabel.center.y >= border.center.y) {
            newQuestion()
            score -= 1
            speed *= 2
            timer2?.invalidate()
            timer2 = Timer.scheduledTimer(timeInterval: speed, target: self, selector: #selector(moveQuestionLabel), userInfo: nil, repeats: true)
            scoreLabel.text = "Score: \(score)"
            
        }
        UIView.animate(withDuration: 0.2) {
            self.questionLabel.center.y += CGFloat(5)
        }
    }
    
    
    func newQuestion() {
        let arrofDiff = userDefaults.object(forKey: "difficulty") as? [Int]
        
        print(arrofDiff![0])
        
        x = Int(arc4random_uniform(UInt32(arrofDiff![0]))) + arrofDiff![1]
        y = Int(arc4random_uniform(9)) + 1
        questionLabel.text = "\(x) x \(y) ="
        questionLabel.center.y = 50
    }


}

