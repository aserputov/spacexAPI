//
//  ApiFetcher.swift
//  SpaceApp
//
//  Created by Anatoliy Serputov on 2021-11-22.
//

import Foundation
class ApiFetcher: ObservableObject{
    let api = "https://api.spacexdata.com/v4/launches"
    
    
    
    @Published var launchList:[spaceShip] = [spaceShip]()
    
    func fetchData(){
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
                do{
                    let decoder = JSONDecoder()
                    let decodeItem = try decoder.decode([spaceShip].self, from: jsonData)
                    self.launchList = decodeItem
                }catch let error{
                    print("Error")
                }
            }
        }.resume()
    }
    
    private static var shared:ApiFetcher?
    static func getInstance ()-> ApiFetcher {
        if(shared != nil){
            return shared!
    } else {
        shared = ApiFetcher()
        return shared!
    }
}
}
