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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
