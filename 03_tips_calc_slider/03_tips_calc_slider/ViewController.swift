//
//  ViewController.swift
//  03_tips_calc_slider
//
//  Created by Admin on 3/5/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bill:Double = 0
    var tips:Int = 0
    
    // MARK: Properties
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipsMoneyLabel: UILabel!
    @IBOutlet weak var totalMoneyLabel: UILabel!
    @IBOutlet weak var tipsSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Added toolbar into keyboard
        self.addDoneButtonOnKeyboard()
        // preset tips value while launching app
        self.tips = Int(tipsSlider.value)
    }

    @IBAction func tipSliderChange(_ sender: UISlider) {
        self.tips = Int(sender.value)
        tipLabel.text = "Tip(\(self.tips)%)"
        self.calculateTips()
    }
    
    func addDoneButtonOnKeyboard() {
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        toolbar.barStyle = UIBarStyle.default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(ViewController.doneButtonAction))
        
        var items =  [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        toolbar.items = items
        toolbar.sizeToFit()
        
        self.billText.inputAccessoryView = toolbar
    }
    
    func doneButtonAction() {
        self.billText.resignFirstResponder()
        self.bill = Double(self.billText.text!)!
        billText.text = "$" + String(format: "%.2f", self.bill)
        self.calculateTips()
    }
    
    func calculateTips() {
        let tips: Double = Double(self.tips) * self.bill / 100.00
        tipsMoneyLabel.text = "$" + String(format: "%.2f", tips)
        totalMoneyLabel.text = "$" + String(format: "%.2f", self.bill+tips)
    }

}

