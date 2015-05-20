//
//  ViewController.swift
//  VisualStepper
//
//  Created by Ben on 15/5/16.
//  Copyright (c) 2015年 X-Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stepper: XTStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stepperValueChanged(sender: AnyObject) {
        NSLog("stepper value %d", stepper.value)
    }
}

