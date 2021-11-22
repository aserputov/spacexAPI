//
//  ViewController.swift
//  SpaceApp
//
//  Created by Anatoliy Serputov on 2021-11-21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    private let apiFetcher = ApiFetcher.getInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func GetData(_ sender: Any) {
//        let api = "https://api.spacexdata.com/v4/launches/5eb87d42ffd86e000604b384"
//        DispatchQueue.main.sync {
//            number.text = "\(decodeItem.id)"
//            self.name.text = decodeItem.flightName
//            type.text = String(decodeItem.success)
//            self.desc.text = decodeItem.missionDetails
//        }

        self.apiFetcher.fetchData()

    }
    
}

