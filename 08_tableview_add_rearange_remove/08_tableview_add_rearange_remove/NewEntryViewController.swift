//
//  NewEntryViewController.swift
//  08_tableview_add_rearange_remove
//
//  Created by Admin on 3/20/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class NewEntryViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var todoText: UITextField!
    
    var passedData: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set delegate for textfield
        todoText.delegate = self
    }
    
    // before performing segue, set data into passedData
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        passedData = todoText.text
    }
    
    @IBAction func saveToData(_ sender: UIButton) {
        // passedData = todoText.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
