//
//  FoodTableViewController.swift
//  megaApp
//
//  Created by Шынар Торехан on 04/07/2018.
//  Copyright © 2018 Shynar Torekhan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class FoodTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var foodTableView: UITableView!
    var foodCompaniesArray = [Company]()
    var id = 0
    var averageRating = 0
    var averageCheck = 0
    var headerImageUrl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        foodCompaniesArray = [Company]()
        Alamofire.request("https://megaapi.herokuapp.com/api/food", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for (_,subJson):(String, JSON) in json["data"] {
                    self.averageCheck = subJson["averageCheck"].int!
                    self.averageRating = subJson["averageRating"].int!
                    let description = subJson["description"]
                    self.id = subJson["id"].int!
                    let logoUrl = subJson["logoUrl"]
                    let name = subJson["name"]
                    self.headerImageUrl = subJson["header"].string!
                    self.foodCompaniesArray.append(Company(averageCheck: self.averageCheck, averageRating: self.averageRating, description: description.string!, id: self.id, logoUrl: logoUrl.string!, name: name.string!, headerImageUrl: self.headerImageUrl))
                    DispatchQueue.main.async {
                        self.foodTableView.reloadData()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FoodTableViewCell
        let url = URL(string: foodCompaniesArray[indexPath.row].logoUrl)
        cell.logoImageView.kf.setImage(with: url)
        cell.companyNameLabel.text = foodCompaniesArray[indexPath.row].name
        cell.companyDescriptionLabel.text = foodCompaniesArray[indexPath.row].description
        cell.companyAverageReceiptLabel.text = "средний чек: "+String(foodCompaniesArray[indexPath.row].averageCheck)+"тг"
        cell.ratingLabel.text = String(foodCompaniesArray[indexPath.row].averageRating)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodCompaniesArray.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 94
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FoodCompanyDetailsViewController{
            let vc = segue.destination as! FoodCompanyDetailsViewController
            vc.id = foodCompaniesArray[(foodTableView.indexPathForSelectedRow?.row)!].id
            vc.averageRating = foodCompaniesArray[(foodTableView.indexPathForSelectedRow?.row)!].averageRating
            vc.averageCheck = foodCompaniesArray[(foodTableView.indexPathForSelectedRow?.row)!].averageCheck
            vc.headerImageUrl = foodCompaniesArray[(foodTableView.indexPathForSelectedRow?.row)!].headerImageUrl
        }
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
