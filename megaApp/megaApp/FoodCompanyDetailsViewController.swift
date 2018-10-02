//
//  FoodCompanyDetailsViewController.swift
//  megaApp
//
//  Created by Шынар Торехан on 05/07/2018.
//  Copyright © 2018 Shynar Torekhan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class FoodCompanyDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var id = 0
    var averageRating = 0
    var averageCheck = 0
    var headerImageUrl = ""
    var foodList = [Item]()
    @IBOutlet weak var foodCollectionView: UICollectionView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var averageReceiptLabel: UILabel!
    @IBOutlet weak var averageRatingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: headerImageUrl)
        logoImageView.kf.setImage(with: url)
        averageRatingLabel.text = String(averageRating)
        averageReceiptLabel.text = "средний чек: "+String(averageCheck)+"тг"
        Alamofire.request("https://megaapi.herokuapp.com/api/food/id/"+"\(id)", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for (_,subJson):(String, JSON) in json["data"] {
                    let logoUrl = subJson["logoUrl"].string!
                    let name = subJson["name"].string!
                    let price = subJson["price"].int!
                    let type = subJson["type"].string!
                    self.foodList.append(Item(logoUrl: logoUrl, name: name, price: price, type: type))
                    DispatchQueue.main.async {
                        self.foodCollectionView.reloadData()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FoodCompanyDetailCollectionViewCell
        let url = URL(string: foodList[indexPath.row].logoUrl)
        cell.foodItemImageView.kf.setImage(with: url)
        cell.foodNameLabel.text = foodList[indexPath.row].name
        cell.foodPriceLabel.text = String(foodList[indexPath.row].price)
        cell.fromViewController = self
        cell.item = foodList[indexPath.row]
        return cell
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
