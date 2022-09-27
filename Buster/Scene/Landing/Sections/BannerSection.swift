//
//  BannerSection.swift
//  Buster
//
//  Created by iZE Appsynth on 27/9/2565 BE.
//

import Foundation
import RxDataSources

struct BannerSection {
    var header: String
    var items: [BannerListModel]
}

extension BannerSection: SectionModelType {
    
    var identity: String {
        return header
    }
    
    init(original: BannerSection, items: [BannerListModel]) {
        self = original
        self.items = items
    }
}
