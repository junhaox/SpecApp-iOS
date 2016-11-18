//
//  ElectronicsResultViewController.swift
//  SpecApp
//
//  Created by Junhao Xie on 11/17/16.
//  Copyright © 2016 Junhao Xie. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ElectronicsResultViewController: UIViewController {

    @IBOutlet weak var cpu: UILabel!
    @IBOutlet weak var gpu: UILabel!
    @IBOutlet weak var ram: UILabel!
    @IBOutlet weak var rom: UILabel!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var resolution: UILabel!
    
    var brandPassed: String!
    var modelPassed: String!
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cpu.text = ""
        gpu.text = ""
        ram.text = ""
        rom.text = ""
        display.text = ""
        resolution.text = ""

        // Do any additional setup after loading the view.
        
        ref.child("Electronics").child(brandPassed).child(modelPassed).observe(.value, with: {
            snapshot in
            for child in snapshot.children {
                if (child as! FIRDataSnapshot).key == "CPU" {
                    self.cpu.text = ((child as! FIRDataSnapshot).value as! String)
                }
                else if (child as! FIRDataSnapshot).key == "GPU" {
                    self.gpu.text = ((child as! FIRDataSnapshot).value as! String)
                }
                else if (child as! FIRDataSnapshot).key == "RAM" {
                    self.ram.text = ((child as! FIRDataSnapshot).value as! String)
                }
                else if (child as! FIRDataSnapshot).key == "ROM" {
                    self.rom.text = ((child as! FIRDataSnapshot).value as! String)
                }
                else if (child as! FIRDataSnapshot).key == "Display" {
                    self.display.text = ((child as! FIRDataSnapshot).value as! String)
                }
                else if (child as! FIRDataSnapshot).key == "Resolution" {
                    self.resolution.text = ((child as! FIRDataSnapshot).value as! String)
                }
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
