//
//  BannerListModel.swift
//  Buster
//
//  Created by iZE Appsynth on 27/9/2565 BE.
//

import Foundation

public struct BannerListModel: Codable {
    
    var image: String
    
    init(imageURL: String) {
        self.image = imageURL
    }
    
    enum CodingKeys: String, CodingKey {
        case image = "image"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        image = try container.decode(String.self, forKey: .image)
        
    }
    
}
