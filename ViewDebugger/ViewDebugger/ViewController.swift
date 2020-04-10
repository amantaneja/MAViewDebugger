//
//  ViewController.swift
//  ViewDebugger
//
//  Created by Aman Taneja on 05/03/20.
//  Copyright © 2020 Aman Taneja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapped(_ sender: Any) {
        _ = FloatingButtonController(view: myButton)

    }
}

