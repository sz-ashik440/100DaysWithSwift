//
//  ViewController.swift
//  05_Table_view
//
//  Created by Admin on 3/11/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let fruites = ["Apple", "Pineapple", "Orange", "Blackberry", "Banana", "Pear", "Kiwi", "Strawberry", "Mango", "Walnut", "Apricot", "Tomato", "Almond", "Date", "Melon", "Water Melon", "Lemon", "Coconut", "Fig", "Passionfruit", "Star Fruit", "Clementin", "Citron", "Cherry", "Cranberry"]
    
    var alphabetizedFruites: [Character: [String]] = [:]
    var sortedFruitKeys: [Character] = []
    
    // MARK: Define number of row in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sortedFruitKeys[section]
        
        if let fruit = alphabetizedFruites[key] {
            return fruit.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
        
        let key = sortedFruitKeys[indexPath.section]
        
        if let fruite = alphabetizedFruites[key] {
            cell.textLabel?.text = fruite[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(sortedFruitKeys[section])
    }
    
    // MARK: Define number of sections in table
    func numberOfSections(in tabelView: UITableView) -> Int {
        return alphabetizedFruites.keys.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        alphabetizedFruites = alphabetizedArray(array: fruites)
        sortedFruitKeys = alphabetizedFruites.keys.sorted(by: {(a,b) -> Bool in a<b})
    }
    
    // MARK: Make dicionary from array for making it easy to sectionize
    func alphabetizedArray(array: [String]) -> [Character: [String]] {
        var result: [Character: [String]] = [:]
        
        for item in array {
            let firstLetter = item[item.startIndex]
            if result.keys.contains(firstLetter) {
                result[firstLetter]!.append(item)
            } else {
                result[firstLetter] = [item]
            }
        }
        for (key, value) in result {
            result[key] = value.sorted(by: {(a,b) -> Bool in a.lowercased() < b.lowercased()})
        }
        return result
    }
}
