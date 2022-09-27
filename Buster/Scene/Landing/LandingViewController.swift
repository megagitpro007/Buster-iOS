//
//  LandingViewController.swift
//  Buster
//
//  Created by iZE Appsynth on 20/9/2565 BE.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import Reusable

class LandingViewController: UIViewController {

    @IBOutlet private var bannerCollectionView: UICollectionView!
    
    var viewModel: LandingIOType!
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCollectionViewCell()
        bindViewModel()
    }
    
    func registerCollectionViewCell() {
        self.bannerCollectionView.rx.setDelegate(self).disposed(by: bag)
        self.bannerCollectionView.register(UINib(nibName: "LandingBannerView", bundle: nil),
                                           forCellWithReuseIdentifier: "LandingBannerCollectionViewCell")
    }
    
    func setupUI() {
        self.navigationController?.isNavigationBarHidden = true
        setGradient()
    }
    
    func bindViewModel() {
        
        //Output
        let dataSource = RxCollectionViewSectionedReloadDataSource<BannerSection>(
            configureCell: { (dataSource, collectionView, indexPath, item: BannerListModel) -> UICollectionViewCell in
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LandingBannerCollectionViewCell.identifier, for: indexPath)
                if let customCell = cell as? LandingBannerCollectionViewCell {
                    customCell.setUp(imageURL: item.image)
                }
                
                return cell
            })
        
        viewModel
            .output
            .bannerSections
            .drive(bannerCollectionView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
        
        //Input
        viewModel.input.viewDidload.accept(())
        
    }
    
    func setGradient() {
        let gradient: CAGradientLayer = CAGradientLayer(
            start: .topCenter,
            end: .bottomCenter,
            colors: [UIColor.busterBGMain.cgColor, UIColor.busterBGsecond.cgColor]
        )
        gradient.frame = self.view.layer.frame
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
}

extension LandingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: bannerCollectionView.bounds.size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
