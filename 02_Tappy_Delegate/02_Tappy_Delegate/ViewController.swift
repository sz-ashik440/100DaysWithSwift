//
//  ViewController.swift
//  02_Tappy_Delegate
//
//  Created by Admin on 2/23/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    var counter: Int = 0
    
    // MARK: properties
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    
    @IBAction func buttonDown(_ sender: UIButton) {
        fire()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
    }
    
    @IBAction func buttonUp(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        counter = 0
        countLabel.text = "0"
    }
    func fire() {
        counter += 1
        countLabel.text = String(counter)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //tapButton.addTarget(self, action: #selector(buttonDown(_:)), for: .touchDown)
        //tapButton.addTarget(self, action: #selector(buttonUp(_:)), for: [.touchUpInside, .touchUpOutside])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    


}

