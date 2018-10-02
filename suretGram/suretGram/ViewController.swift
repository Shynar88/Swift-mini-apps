//
//  ViewController.swift
//  suretGram
//
//  Created by Test on 03/07/2018.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var account: String = ""
    @IBOutlet weak var nameField: UITextField!
    @IBAction func buttonPressed(_ sender: UIButton) {
        account = nameField.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CollectionViewController{
            let vc = segue.destination as! CollectionViewController
            vc.account = account
        }
    }
}

