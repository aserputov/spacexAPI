//
//  ViewController.swift
//  SpaceApp
//
//  Created by Anatoliy Serputov on 2021-11-21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func GetData(_ sender: Any) {
        let api = "https://api.spacexdata.com/v4/launches/5eb87d42ffd86e000604b384"
        guard let url = URL(string: api) else {
            print("ok")
            return
        }
        
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            print(data)
        }.resume()
        
    }
    
}

