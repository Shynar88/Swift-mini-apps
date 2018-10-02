//
//  CollectionViewController.swift
//  suretGram
//
//  Created by Test on 03/07/2018.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
var account = ""
var imgURLsArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = account
        Alamofire.request("https://apinsta.herokuapp.com/u/" + account, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let postJsons = json["graphql"]["user"]["edge_owner_to_timeline_media"]["edges"]
                for (_,subJson):(String, JSON) in postJsons {
                    self.imgURLsArray.append("\(subJson["node"]["display_url"])")
                    DispatchQueue.main.async {
                        self.collectionView?.reloadData()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imgURLsArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        let url = URL(string: imgURLsArray[indexPath.row])
        cell.cellImageView.contentMode = .scaleAspectFit
        cell.cellImageView.kf.setImage(with: url)
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
