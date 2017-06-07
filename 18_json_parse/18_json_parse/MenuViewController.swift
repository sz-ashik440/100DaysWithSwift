//
//  ViewController.swift
//  18_json_parse
//
//  Created by Admin on 6/4/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    
    var foods: [Food] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        foods = Food.getData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FoodTableViewCell
        
        let food = foods[indexPath.row]
        cell.foodTitleLabel.text = food.name
        cell.priceLabel.text = "$\(food.price!)"
        cell.thumnilImage.setImage(from: food.image!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "detailsSegue", sender: foods[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            let controller = segue.destination as! DetailsViewController
            controller.food = sender as? Food
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension UIImageView{
    func setImage(from url: String){
        
        guard let urlRequest = URL(string: url) else {
            print("Something wrong with url")
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("Something wrong with data")
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
