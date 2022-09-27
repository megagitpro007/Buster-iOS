//
//  LandingViewModel.swift
//  Buster
//
//  Created by iZE Appsynth on 27/9/2565 BE.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

protocol LandingIOType {
    var input: LandingInput { get }
    var output: LandingOutput { get }
}

protocol LandingInput {
    var viewDidload: PublishRelay<Void> { get }
}

protocol LandingOutput {
    //DataSource
    var bannerSections: Driver<[BannerSection]> { get }
}

final class LandingViewModel: LandingIOType, LandingInput, LandingOutput {
    
    // IO
    var input: LandingInput { return self }
    var output: LandingOutput { return self }
    
    // Input
    var viewDidload: PublishRelay<Void> = .init()
    
    // Output
    var bannerSections: Driver<[BannerSection]> {
        return _bannerSections
                    .map{ [BannerSection(header: "LandingBanner", items: $0 )] }
                    .asDriver(onErrorDriveWith: .never())
    }
    
    // Properties
    let _bannerSections: PublishRelay<[BannerListModel]> = .init()
    let bag = DisposeBag()
    
    init() {
        
        viewDidload.subscribe(onNext: { [weak self] in
            guard let self = self else { return }
            let banners = [BannerListModel(imageURL: "https://i.ytimg.com/vi/7ZCOpMpLEn4/maxresdefault.jpg"),
                           BannerListModel(imageURL: "https://images.wallpapersden.com/image/download/avatar-2-the-way-of-water-banner_bGlpa2eUmZqaraWkpJRmbmdlrWZlbWU.jpg"),
                           BannerListModel(imageURL: "https://images.droidsans.com/wp-content/uploads/2012/01/Dead-Space-banner-550x269.jpg")]
            self._bannerSections.accept(banners)
        }).disposed(by: bag)
        
    }
    
}
