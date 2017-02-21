//
//  ViewController.swift
//  01_Tappy
//
//  Created by Admin on 2/21/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    
    // MARK: Properties
    @IBOutlet weak var CounterLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func tapAction(_ sender: UIButton) {
        counter += 1
        CounterLabel.text = "\(counter)"
        //print("Counter: \(counter)")
    }
}

