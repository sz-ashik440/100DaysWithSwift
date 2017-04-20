//
//  ViewController.swift
//  12_Slot_Machine
//
//  Created by Admin on 4/20/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK:- Properties
    @IBOutlet weak var slotPicker: UIPickerView!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    let emojiData = ["💩", "👻", "🤖", "💀", "💰", "🤑", "❤️", "🍒", "⚡️", "😩"]
    var slotRow1:[Int] = []
    var slotRow2:[Int] = []
    var slotRow3:[Int] = []
    
    // MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting delgates for UIPickerviews
        slotPicker.delegate = self
        // setting datasorce for UIPickerview
        slotPicker.dataSource = self
        
        // caching emojiData's index for reference which will be used to check when rolling finished
        for _ in 0..<100{
            slotRow1.append(Int(arc4random() % 10))
            slotRow2.append(Int(arc4random() % 10))
            slotRow3.append(Int(arc4random() % 10))
        }
    }
    
    // MARK:- pikerview data source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    // MARK:- pickerview delegate
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.00
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.00
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        // setting custom label for UIPickerview
        let rollLabel = UILabel()
        
        // putting values into pickers components
        if component == 0 {
            rollLabel.text = emojiData[slotRow1[row]]
        } else if component == 1 {
            rollLabel.text = emojiData[slotRow2[row]]
        } else {
            rollLabel.text = emojiData[slotRow3[row]]
        }
        
        // changing fonts of label
        rollLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        rollLabel.textAlignment = .center
        
        return rollLabel
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return emojiData[Int(arc4random()%10)]
//    }
    
    // MARK:- Actions
    @IBAction func rollAction(_ sender: UIButton) {
        // spin the UIPickerView
        for i in 0..<3{
            slotPicker.selectRow(Int(arc4random() % 80 + 3), inComponent: i, animated: true)
        }
        
        // check if it hit's jackpot
        let component1 = slotPicker.selectedRow(inComponent: 0)
        let component2 = slotPicker.selectedRow(inComponent: 1)
        let component3 = slotPicker.selectedRow(inComponent: 2)
        
        if (slotRow1[component1] == slotRow2[component2]) && (slotRow2[component2] == slotRow3[component3]) {
            resultLabel.textColor = UIColor.yellow
            resultLabel.text = "💲Bingo!!💲"
        } else {
            resultLabel.text = "💔"
        }
    }
}

