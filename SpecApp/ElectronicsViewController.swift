//
//  FirstViewController.swift
//  SpecApp
//
//  Created by Junhao Xie on 11/8/16.
//  Copyright © 2016 Junhao Xie. All rights reserved.
//

import UIKit

class ElectronicsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var brand: UITextField!
    @IBOutlet weak var model: UITextField!
    
    var brandData: [String] = ["Apple", "Google", "Samsung"]
    var modelData: [String] = []
    var brandPicker = UIPickerView()
    var modelPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        brandPicker.delegate = self
        brandPicker.dataSource = self
        modelPicker.delegate = self
        modelPicker.dataSource = self
        
        brand.inputView = brandPicker
        model.inputView = modelPicker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        brand.resignFirstResponder()
        model.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == brandPicker) {
            return brandData.count
        }
        else {
            return modelData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == brandPicker) {
            return brandData[row]
        }
        else {
            return modelData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == brandPicker) {
            let brandText = brandData[row]
            modelData = model(brand: brandText)
            brand.text = brandData[row]
            modelPicker.reloadAllComponents()
        }
        else {
            model.text = modelData[row]
        }
    }
    
    func model(brand: String) -> [String] {
        if brand == "Apple" {
            return ["iPhone 7", "iPhone 7 Plus"]
        }
        else if brand == "Google" {
            return ["Pixel", "Pixel XL"]
        }
        else if brand == "Samsung" {
            return ["Galaxy S7 Edge", "Galaxy Note 7"]
        }
        else {
            return []
        }
    }

}

