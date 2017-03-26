//
//  ViewController.swift
//  10_Segue_Mapping
//
//  Created by Admin on 3/24/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    var counter: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        counter = 1
        counterLabel.text = String(counter!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.counter = counter!
        // print(counter!)
    }

    @IBAction func toFirstTreeViewOne(_ sender: UIButton) {
        self.performSegue(withIdentifier: "tree_1View_1", sender: self)
    }
    
    @IBAction func toFirstTreeSecondView(_ sender: UIButton) {
        self.performSegue(withIdentifier: "tree_2View_1", sender: self)
    }
    
    @IBAction func unwindToRootView(segue: UIStoryboardSegue) {
        
    }
}

