//
//  LandingBannerCollectionViewCell.swift
//  Buster
//
//  Created by iZE Appsynth on 27/9/2565 BE.
//

import UIKit
import Kingfisher
import Reusable

class LandingBannerCollectionViewCell: UICollectionViewCell, Reusable {
    
    static let identifier = "LandingBannerCollectionViewCell"
    
    @IBOutlet private var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.image.contentMode = .scaleAspectFill
    }
    
    func setUp(imageURL: String) {
        if let url = URL(string: imageURL) {
            self.image.kf.setImage(with: url)
        }
    }
    
}
