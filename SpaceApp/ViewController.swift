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
        
        
        URLSession.shared.dataTask(with: url) { [self](data, response, error) in
           
            if let err = error {
                    print("Error during fetch")
                    print(err)
                return
            }
            if let jsonData = data{
//                print(jsonData)
                do{
                    let decoder = JSONDecoder()
                    let decodeItem = try decoder.decode(spaceShip.self, from: jsonData)
                    
//                    print(decodeItem)
                    DispatchQueue.main.sync {
                        number.text = "\(decodeItem.id)"
                        self.name.text = decodeItem.flightName
                        type.text = String(decodeItem.success)
                        self.desc.text = decodeItem.missionDetails
                    }
                   
                    
                    
                }catch let error{
                    print("Error")
                }
           
                
            }
            
        }.resume()
        
        
        
        
    }
    
}

