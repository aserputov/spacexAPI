//
//  ViewController.swift
//  SpaceApp
//
//  Created by Anatoliy Serputov on 2021-11-21.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    var index:Int = 0;
    private let apiFetcher = ApiFetcher.getInstance()
    private var cancellables:Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiFetcher.$launchList.receive(on: RunLoop.main).sink { (changedData) in
        print("We saw a change in the api fetcher's launch list")
        print(changedData.count)
            if(changedData.count > 0){
                let firstItem = changedData[self.index]
                self.number.text = "\(firstItem.id)"
                self.name.text = firstItem.flightName
                self.type.text = String(firstItem.success)
                self.desc.text = firstItem.missionDetails
            }
        }.store(in: &cancellables)
    }

    @IBAction func GetData(_ sender: Any) {
        if(index < 136){
        index = index + 1;
        self.apiFetcher.fetchData()
        }else{
            index = 0;
            self.apiFetcher.fetchData()
        }
    }
    
    @IBAction func Back(_ sender: Any) {
        if(index == 0){
            index = 135
            self.apiFetcher.fetchData()
        }else{
            index = index - 1;
            print(index)
            self.apiFetcher.fetchData()
        }
    }
}

