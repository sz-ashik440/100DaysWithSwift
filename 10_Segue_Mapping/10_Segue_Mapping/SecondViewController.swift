//
//  SecondViewController.swift
//  10_Segue_Mapping
//
//  Created by Admin on 3/25/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    
    var counter: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let countInstance = counter else {
            print("Data is not passed")
            return
        }
        
        counter = countInstance + 1
        counterLabel.text = String(counter!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.counter = counter!
    }
    
    @IBAction func toFourthView(_ sender: UIButton) {
        performSegue(withIdentifier: "tree_1View_2", sender: self)
    }
    
    @IBAction func toFifthView(_ sender: Any) {
        print("Third view")
    }
    
    @IBAction func gotoRootView(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToRoot", sender: self)
    }
    
    
    @IBAction func unwindToSecondView(segue: UIStoryboardSegue) {
        
    }
}
