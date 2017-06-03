//
//  EditEntryViewController.swift
//  16_Journal_Core
//
//  Created by Admin on 6/3/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class EditEntryViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailsTextview: UITextView!
    
    var storyJournal: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let story = storyJournal else {
            print("Could not recieved from There")
            return
        }
        
        titleTextField.text = story.title
        detailsTextview.text = story.details
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
        guard let titleText = titleTextField.text,
            let detailsText = detailsTextview.text,
            let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        if titleText.isEmpty {
            showAlert("Title Can't be empty")
            return
        }
        
        if detailsText.isEmpty {
            showAlert("Details can't be empty")
            return
        }
        
        if let story = storyJournal{
            story.title = titleText
            story.details = detailsText
            appDelegate.saveContext()
            dismiss(animated: true, completion: nil)
        }
    }
}

extension EditEntryViewController: UITextViewDelegate{
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

extension EditEntryViewController{
    func showAlert(_ message: String){
        let controller = UIAlertController(title: "New Entry", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        controller.addAction(okAction)
        self.present(controller, animated: true, completion: nil)
    }
}

