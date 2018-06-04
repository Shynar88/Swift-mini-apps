//
//  ViewController.swift
//  Colours
//
//  Created by Шынар Торехан on 29/06/2017.
//  Copyright © 2017 Шынар Торехан. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var colourscreen: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var stopwatch: UILabel!
    
    let coloursList = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.black.cgColor, UIColor.white.cgColor, UIColor.blue.cgColor, UIColor.brown.cgColor, UIColor.gray.cgColor]
    var score = 0
    let coloursNames = ["red", "green", "black", "white", "blue", "brown", "gray"]
    var randomWord = 0
    var randomColour = 0
    var time = 10
    var timer = Timer()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        trueButton.layer.cornerRadius = 10
        falseButton.layer.cornerRadius = 10
        colourscreen.layer.backgroundColor = UIColor.red.cgColor
        // Do any additional setup after loading the view, typically from a nib.
        generateQuestion()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        time -= 1
        stopwatch.text = "\(time)"
        checkTheTimeLimit()
    }
    
    func checkTheTimeLimit() {
        if time == 0 {
            timer.invalidate()
            let ac = UIAlertController(title: "Game is over!", message: "Your score is: \(score)", preferredStyle: .alert)
            //let acAction = UIAlertAction(title: "Play again", style: .default, handler: nil)
            let acAction = UIAlertAction(title: "Play again", style: .default, handler: { _ in
                self.time = 10
                self.score = 0
                self.scoreLabel.text = "0"
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
            })
            ac.addAction(acAction)
            present(ac, animated: true, completion: nil)
            
        }
    }
    
    
    @IBAction func trueButton(_ sender: UIButton) {
        randomWord == randomColour ? (score += 1) : (score -= 1)
        //score += randomWord == randomColour ? 1 : -1
        scoreLabel.text = "Score: \(score)"
        generateQuestion()
    }
    
    @IBAction func falseButton(_ sender: UIButton) {
        randomWord != randomColour ? (score += 1) : (score -= 1)
        scoreLabel.text = "Score: \(score)"
        generateQuestion()
    }
    
    func generateQuestion() {
        randomWord = Int(arc4random_uniform(7))
        randomColour = Int(arc4random_uniform(7))
        colourscreen.text = coloursNames[randomWord]
        colourscreen.layer.backgroundColor = coloursList[randomColour]
        
        
    }
    
}

