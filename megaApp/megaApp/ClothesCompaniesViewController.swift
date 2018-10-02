//
//  ClothesCompaniesViewController.swift
//  megaApp
//
//  Created by Шынар Торехан on 06/07/2018.
//  Copyright © 2018 Shynar Torekhan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ClothesCompaniesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var companiesCollectionView: UICollectionView!
    var clothesCompaniesList = [ClothesCompany]()
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://megaapi.herokuapp.com/api/cloth", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for (_,subJson):(String, JSON) in json["data"] {
                    let description = subJson["description"].string!
                    let id = subJson["id"].int!
                    let logoUrl = subJson["logoUrl"].string!
                    let name = subJson["name"].string!
                    self.clothesCompaniesList.append(ClothesCompany(description: description, id: id, logoUrl: logoUrl, name: name))
                    DispatchQueue.main.async {
                        self.companiesCollectionView.reloadData()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return clothesCompaniesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ClothesCompanyCollectionViewCell
        let url = URL(string: clothesCompaniesList[indexPath.row].logoUrl)
        cell.companyLogoImageView.kf.setImage(with: url)
        return cell
    }
}
