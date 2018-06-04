//
//  AddViewController.swift
//  ToDoList
//
//  Created by Шынар Торехан on 01/07/2017.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    //var name = ""
    //var date = ""
    var image = ""
    var firstVCDelegate: TaskListUpdtable?
    
    @IBOutlet weak var deadline: UIDatePicker!
    @IBOutlet weak var taskInput: UITextField!
    @IBOutlet weak var planeCat: UIButton!
    @IBOutlet weak var cartCat: UIButton!
    @IBOutlet weak var phoneCat: UIButton!
    @IBOutlet weak var kidsCat: UIButton!
    var arrButtons = [UIButton]()
    
    @IBAction func dueDateDidChoose(_ sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd"
        //date = timeFormatter.string(from: deadline.date)
        //print(date)
    }
    
    
//    func duedate(sender: UIDatePicker) {
//        //deadline.datePickerMode = UIDatePickerMode.date
//        
//        let timeFormatter = DateFormatter()
//        timeFormatter.dateFormat = "yyyy-MM-dd"
//        
//        date = timeFormatter.string(from: deadline.date)
//    }
//    myDatePicker.datePickerMode = UIDatePickerMode.Date
//    var dateFormatter = NSDateFormatter()
//    dateFormatter.dateFormat = "dd MMM yyyy"
//    var selectedDate = dateFormatter.stringFromDate(myDatePicker.date)
//    println(selectedDate)

    @IBAction func kidsCat(_ sender: UIButton) {
        for item in arrButtons{
            item.isSelected = false
        }
        image = "kids"
        kidsCat.isSelected = true
        //kidsCat.setBackgroundImage(#imageLiteral(resourceName: "kids"), for: .normal)
    }
    @IBAction func phoneCat(_ sender: UIButton) {
        for item in arrButtons{
            item.isSelected = false
        }
        image = "phone"
        phoneCat.isSelected = true
        //phoneCat.setBackgroundImage(#imageLiteral(resourceName: "phone"), for: .normal)
    }
    
    @IBAction func cart(_ sender: UIButton) {
        for item in arrButtons{
            item.isSelected = false
        }
        image = "cart"
        cartCat.isSelected = true
        //cartCat.setBackgroundImage(#imageLiteral(resourceName: "cart"), for: .normal)
    }
    
    @IBAction func plane(_ sender: UIButton) {
        for item in arrButtons{
            item.isSelected = false
        }
        image = "plane"
        planeCat.isSelected = true
        //planeCat.setBackgroundImage(#imageLiteral(resourceName: "plane"), for: .normal)
    }

    @IBAction func doneButton(_ sender: UIButton) {
        let name = taskInput.text!
        //let date = deadline.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: deadline.date)
        let task = Tasks(name: name, date: date, image: image)
        firstVCDelegate?.addTask(newTask: task)
        self.navigationController?.popViewController(animated: true)
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            arrButtons = [planeCat, cartCat, phoneCat, kidsCat]
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "ToDo List", style: .plain, target: nil, action: nil)
            planeCat.clipsToBounds = true
            planeCat.layer.cornerRadius = 40
            kidsCat.clipsToBounds = true
            kidsCat.layer.cornerRadius = 40
            cartCat.clipsToBounds = true
            cartCat.layer.cornerRadius = 40
            phoneCat.clipsToBounds = true
            phoneCat.layer.cornerRadius = 40
        }

}
