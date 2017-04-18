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
        guard counter != nil else {
            self.counter = 1
            counterLabel.text = String(1)
            return
        }
//        self.counter = count + 1
//        counterLabel.text = String(self.counter!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.counter = self.counter!
        // print(counter!)
    }

    @IBAction func toFirstTreeViewOne(_ sender: UIButton) {
        self.performSegue(withIdentifier: "tree_1View_1", sender: self)
    }
    
    @IBAction func toFirstTreeSecondView(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "tree_2_view_1") as! SecondViewController
        controller.counter = self.counter!
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func unwindToRootView(segue: UIStoryboardSegue) {
        
    }
}

