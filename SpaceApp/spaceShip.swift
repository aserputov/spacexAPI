//
//  spaceShip.swift
//  SpaceApp
//
//  Created by Anatoliy Serputov on 2021-11-21.
//

import Foundation
struct spaceShip: Codable {
    var id:Int = 0;
    var flightName:String = ""
    var missionDetails:String = ""
    var success:Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id = "flight_number"
        case flightName = "name"
        case missionDetails = "details"
        case success = "success"
    }
    
    init(from decoder:Decoder) throws {
            // 1. try to take the api response and convert it to data we can use
        let response = try decoder.container(keyedBy: CodingKeys.self)
            // 2. extract the relevant keys from that api response
        self.id = try response.decodeIfPresent(Int.self, forKey: CodingKeys.id) ?? 0
        self.flightName = try response.decodeIfPresent(String.self, forKey: CodingKeys.flightName) ?? "No flightName provided"
        self.missionDetails = try response.decodeIfPresent(String.self, forKey: CodingKeys.missionDetails) ?? "No missionDetails provided"
        self.success = try response.decodeIfPresent(Bool.self, forKey: CodingKeys.success) ?? false
        }

    
    func encode(to encoder:Encoder) throws {
            // do nothing
        }

    
}
