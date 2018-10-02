//
//  FoodCompanyDetailCollectionViewCell.swift
//  megaApp
//
//  Created by Шынар Торехан on 05/07/2018.
//  Copyright © 2018 Shynar Torekhan. All rights reserved.
//

import UIKit

class FoodCompanyDetailCollectionViewCell: UICollectionViewCell {
    var fromViewController : UIViewController?
    var item: Item!
    @IBOutlet weak var foodItemImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBAction func orderButtonPressed(_ sender: UIButton) {
        showAlert()
    }
    @IBAction func stepperPressed(_ sender: UIStepper) {
        quantityLabel.text = String(Int(sender.value))
    }
    func showAlert(){
        let ac = UIAlertController(title: "Выбор произведен успешно", message: "Выбор добавлен в корзину", preferredStyle: .alert)
        let acAction = UIAlertAction(title: "OK", style: .default, handler:{ (action) in
            cartList.append(self.item)
            ac.dismiss(animated: true, completion: nil)
        })
        ac.addAction(acAction)
        fromViewController?.present(ac, animated: true, completion: nil)
    }
}


