//
//  CarsResultViewController.swift
//  SpecApp
//
//  Created by Junhao Xie on 11/17/16.
//  Copyright © 2016 Junhao Xie. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CarsResultViewController: UIViewController {
    
    @IBOutlet weak var horsepower: UILabel!
    @IBOutlet weak var torque: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var engine: UILabel!
    @IBOutlet weak var zeroTo60: UILabel!
    @IBOutlet weak var topspeed: UILabel!
    
    var brandPassed: String!
    var modelPassed: String!
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        horsepower.text = ""
        torque.text = ""
        weight.text = ""
        engine.text = ""
        zeroTo60.text = ""
        topspeed.text = ""
        
        ref.child("Cars").child(brandPassed).child(modelPassed).observe(.value, with: {
            snapshot in
            for child in snapshot.children {
                if (child as! FIRDataSnapshot).key == "Horsepower" {
                    self.horsepower.text = ((child as! FIRDataSnapshot).value as! String)
                }
                else if (child as! FIRDataSnapshot).key == "Torque" {
                    self.torque.text = ((child as! FIRDataSnapshot).value as! String)
                }
                else if (child as! FIRDataSnapshot).key == "Weight" {
                    self.weight.text = ((child as! FIRDataSnapshot).value as! String)
                }
                else if (child as! FIRDataSnapshot).key == "Engine" {
                    self.engine.text = ((child as! FIRDataSnapshot).value as! String)
                }
                else if (child as! FIRDataSnapshot).key == "0-60 MPH" {
                    self.zeroTo60.text = ((child as! FIRDataSnapshot).value as! String)
                }
                else if (child as! FIRDataSnapshot).key == "Top Speed" {
                    self.topspeed.text = ((child as! FIRDataSnapshot).value as! String)
                }
            }
        })
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
