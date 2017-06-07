//
//  DetailsViewController.swift
//  18_json_parse
//
//  Created by Admin on 6/5/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodDescriptionLebel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var food: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let recivedFood = food else {
            print("Something wrong with Segue")
            return
        }
        
        foodImage.setImage(from: recivedFood.image!)
        
        foodName.isHidden = false
        foodName.text = recivedFood.name
        
        foodDescriptionLebel.isHidden = false
        foodDescriptionLebel.text = recivedFood.description
        
        calorieLabel.isHidden = false
        calorieLabel.text = "Calories: \(recivedFood.calories!)"
        
        priceLabel.isHidden = false
        priceLabel.text = "Price: $\(recivedFood.price!)"
    }
    
}
