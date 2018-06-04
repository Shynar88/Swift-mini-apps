//
//  ViewController.swift
//  Stopwatch
//
//  Created by Шынар Торехан on 30/06/2017.
//  Copyright © 2017 Шынар Торехан. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var mainTime: UILabel!
    @IBOutlet weak var lapTime: UILabel!
    @IBOutlet weak var lapButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    var timerMainSeconds = Timer()
    var timerMainMSeconds = Timer()
    var timerLapsSeconds = Timer()
    var timerLapsMSeconds = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func lapButton(_ sender: UIButton) {
        if sender.title(for: .normal) == "Lap"{
            timeSecLap = 0
            timeMSecLap = 0
            guard let currentLap = mainTime.text  else { return }
            myLaps.append(currentLap)
            tableView.reloadData()
        } else{
            myLaps.removeAll()
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myLaps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = myLaps[indexPath.row]
        return cell
    }
    
    @IBAction func start(_ sender: UIButton) {
        if sender.title(for: .normal) == "Start"{
            lapButton.setTitle("Lap", for: .normal)
            timerMainSeconds = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateMainTimeSec), userInfo: nil, repeats: true)
            timerMainMSeconds = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateMainTimeMSec), userInfo: nil, repeats: true)
            startButton.setTitle("Stop", for: .normal)
            startButton.setTitleColor(UIColor.red, for: .normal)
        } else {
            lapButton.setTitle("Reset", for: .normal)
            startButton.setTitle("Start", for: .normal)
            startButton.setTitleColor(UIColor.green, for: .normal)
            timerMainSeconds.invalidate()
            timerMainMSeconds.invalidate()
            timerLapsSeconds.invalidate()
            timerLapsMSeconds.invalidate()
        }
    }
    
    var timeSecMain = 0
    var timeMSecMain = 0
    var timeSecLap = 0
    var timeMSecLap = 0
    var laps = 0
    var lapsArr = [(Int(), Int())]
    
    var myLaps = [String]()
    
    func updateMainTimeSec() {
        mainTime.text = String.init(format: "00:%02d.%02d", timeSecMain, timeMSecMain )
        lapTime.text = String.init(format: "00:%02d.%02d", timeSecLap, timeMSecLap )
        timeSecMain += 1
        timeSecLap += 1
    }
    
    func updateMainTimeMSec() {
        mainTime.text = String.init(format: "00:%02d.%02d", timeSecMain, timeMSecMain )
        lapTime.text = String.init(format: "00:%02d.%02d", timeSecLap, timeMSecLap )
        (timeMSecMain == 99) ? (timeMSecMain = 0) : (timeMSecMain += 1)
        (timeMSecLap == 99) ? (timeMSecLap = 0) : (timeMSecLap += 1)
    }
   
}

