//
//  DetailViewController.swift
//  URLSessionApp
//
//  Created by Шынар Торехан on 11/07/2017.
//  Copyright © 2017 galymco. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    

    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var bookDescription: UILabel!
    @IBOutlet weak var bigImage: UIImageView!
    var theBook: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = theBook?.title
        releaseDate.text = theBook?.releaseDate
        publisher.text = theBook?.publisher
        author.text = theBook?.authors?[0]
        bookDescription.text = theBook?.bookDescription
        if let imageUrl = theBook?.thumbnail,
            let url = URL(string: imageUrl){
            bigImage.setImage(from: url)
        }
        // Do any additional setup after loading the view.
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

