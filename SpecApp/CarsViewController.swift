//
//  SecondViewController.swift
//  SpecApp
//
//  Created by Junhao Xie on 11/8/16.
//  Copyright © 2016 Junhao Xie. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CarsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var brand: UITextField!
    @IBOutlet weak var model: UITextField!
    
    var brandData: [String] = []
    var modelData: [String] = []
    var brandPicker = UIPickerView()
    var modelPicker = UIPickerView()
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        brandPicker.delegate = self
        brandPicker.dataSource = self
        modelPicker.delegate = self
        modelPicker.dataSource = self
        
        brand.inputView = brandPicker
        model.inputView = modelPicker
        
        ref = FIRDatabase.database().reference()
        
        ref.child("Cars").observe(.value, with: {
            snapshot in
            for child in snapshot.children {
                self.brandData.append((child as! FIRDataSnapshot).key)
            }
        })
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
            ref.child("Cars").child(brandText).observe(.value, with: {
                snapshot in
                self.modelData = []
                for child in snapshot.children {
                    self.modelData.append((child as! FIRDataSnapshot).key)
                }
            })
            brand.text = brandData[row]
            model.text = ""
            modelPicker.reloadAllComponents()
        }
        else {
            model.text = modelData[row]
        }
    }
}

