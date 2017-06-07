//
//  Food.swift
//  18_json_parse
//
//  Created by Admin on 6/5/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import Foundation

enum SerializationError: Error {
    case missingData(String)
}

class Food{
    
    var name: String?
    var price: Double?
    var description: String?
    var image: String?
    var calories: Int?
    
    static func getData() -> [Food]{
        var foodsReturn: [Food] = []
        
        let path = Bundle.main.url(forResource: "simple", withExtension: "json")
        
        do {
            let data = try JSONSerialization.jsonObject(with: Data(contentsOf: path!)) as! [String: Any]
            
            guard let menu = data["menu"] as? [String: Any] else {
                throw SerializationError.missingData("Menu")
            }
            
            guard let foods = menu["food"] as? [[String: String]] else {
                throw SerializationError.missingData("food")
            }
            
            for food in foods{
                let temp = Food()
                
                guard let fName = food["name"] else {
                    throw SerializationError.missingData("Food name")
                }
                guard let fPrice = food["price"] else {
                    throw SerializationError.missingData("Price")
                }
                guard let fDescription = food["description"] else {
                    throw SerializationError.missingData("Description")
                }
                guard let fImage = food["image"] else {
                    throw SerializationError.missingData("Image")
                }
                guard let fCalories = food["calories"] else {
                    throw SerializationError.missingData("Calories")
                }
                
                temp.name = fName
                
                temp.price = Double(fPrice.components(separatedBy: "$").last!)
                temp.description = fDescription
                temp.image = fImage
                temp.calories = Int(fCalories)
                
                foodsReturn.append(temp)
            }
            
        } catch{
            print(error.localizedDescription)
        }
        
        return foodsReturn
    }
}


