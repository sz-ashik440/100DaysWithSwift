//
//  ViewController.swift
//  11_Play_Local_video
//
//  Created by Admin on 3/26/17.
//  Copyright © 2017 c4idiots. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK:- Properties
    @IBOutlet weak var movieTable: UITableView!
    
    let playerController = AVPlayerViewController()
    var player = AVPlayer()
    
    var movieList: [Movie] = []
    
    // MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTable.delegate = self
        movieTable.dataSource = self
        
        self.movieList = [
            Movie(title: "Assasins Creed", imageSource: "assassins_creed", videoSource: "Assassins_creed"),
            Movie(title: "Ghost In The Shell", imageSource: "gits", videoSource: "GITS"),
            Movie(title: "Justice League", imageSource: "jl", videoSource: "JL"),
            Movie(title: "Pirates Of The Caribbean", imageSource: "pirates", videoSource: "Pirates"),
            Movie(title: "Thor: Ragnarok", imageSource: "thor", videoSource: "Thor"),
            Movie(title: "Transformers: The Last Knight", imageSource: "transformer", videoSource: "Transformer"),
        ]
    }
    
    // MARK:- tableview delegets
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MovieTableViewCell
        
        let movie = self.movieList[indexPath.row]
        cell.backgroundImage.image = UIImage(named: movie.imageSource)
        cell.titleLabel.text = movie.title.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = self.movieList[indexPath.row]
        self.playvideo(video: movie.videoSource)
    }
    
    // MARK:- Playing video
    private func playvideo(video name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp4") else {
            print("mp4 file didn't found")
            return
        }
        
        self.player = AVPlayer(url: URL(fileURLWithPath: path))
        self.playerController.player = player
        present(self.playerController, animated: true, completion: {
            self.player.play()
        })
    }
}

