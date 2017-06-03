//
//  NewEntryViewController.swift
//  16_Journal_Core
//
//  Created by Admin on 5/26/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit
import CoreData

class NewEntryViewController: UIViewController {

    @IBOutlet weak var enteredTextField: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enteredTextField.delegate = self
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        
        guard let titleText = titleTextField.text,
            let enteredText = enteredTextField.text,
            let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        if titleText.isEmpty{
            showAlert("please Enter Title")
            return
        }
        
        if enteredText.isEmpty || enteredText == "Type your story....." {
            showAlert("Please Enter Description")
            return
        }
        
        let entity = Entry(context: managedContext)
        entity.title = titleText
        entity.details = enteredText
        
        //appDelegate.saveContext()
        do{
            try managedContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension NewEntryViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView){
        if textView.text == "Type your story....."{
            textView.text = nil
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Type your story....."
        }
    }
}

extension NewEntryViewController{
    // MARK:- Alert box
    func showAlert(_ message: String){
        let controller = UIAlertController(title: "New Entry", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        controller.addAction(okAction)
        self.present(controller, animated: true, completion: nil)
    }
}
