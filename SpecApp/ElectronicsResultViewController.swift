//
//  ElectronicsResultViewController.swift
//  SpecApp
//
//  Created by Junhao Xie on 11/17/16.
//  Copyright © 2016 Junhao Xie. All rights reserved.
//

import UIKit

class ElectronicsResultViewController: UIViewController {

    @IBOutlet weak var cpu: UILabel!
    @IBOutlet weak var gpu: UILabel!
    @IBOutlet weak var ram: UILabel!
    @IBOutlet weak var rom: UILabel!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var resolution: UILabel!
    
    var cpuPassed: String!
    var gpuPassed: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(cpuPassed)
        cpu.text = cpuPassed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
