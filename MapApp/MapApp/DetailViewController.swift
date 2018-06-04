//
//  DetailViewController.swift
//  MapApp
//
//  Created by Шынар Торехан on 10/07/2017.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Rdescription: UILabel!
    @IBOutlet weak var distance: UILabel!
    var place: Place?
    var delta: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = place?.title
        Rdescription.text = place?.subtitle
        distance.text = "\(delta) meters far away"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
