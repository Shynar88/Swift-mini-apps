//
//  ViewController.swift
//  megaApp
//
//  Created by Шынар Торехан on 04/07/2018.
//  Copyright © 2018 Shynar Torekhan. All rights reserved.
//

import UIKit
var cartList = [Item]()
class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var avatarImageView: UIImageView!
    var tappedImageView: UIImageView!
    var citiesList = ["Актау", "Актобе", "Атырау", "Караганда", "Кокшетау", "Костанай"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let thePicker = UIPickerView()
        cityField.inputView = thePicker
        thePicker.delegate = self
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return citiesList.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return citiesList[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityField.text = citiesList[row]
        cityField.resignFirstResponder()
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        tappedImageView = tapGestureRecognizer.view as! UIImageView
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            tappedImageView.image = image
            tappedImageView.clipsToBounds = true
            tappedImageView.layer.cornerRadius = 100
        }
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

