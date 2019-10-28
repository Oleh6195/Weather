//
//  Wind.swift
//  Weather
//
//  Created by Олег on 24.10.2019.
//  Copyright © 2019 Олег. All rights reserved.
//

import Foundation


struct Wind {
    var speed:Float
    var deg:Float
    
    enum CodingKeys: String, CodingKey {
        case speed
        case deg
    }
}

extension Wind: Decodable{
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.speed = try container.decode(Float.self, forKey: .speed)
        self.deg = try container.decode(Float.self, forKey: .deg)
        
    }
}
