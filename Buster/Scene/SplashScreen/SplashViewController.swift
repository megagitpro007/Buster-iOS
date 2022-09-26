//
//  SplashViewController.swift
//  Buster
//
//  Created by iZE Appsynth on 26/9/2565 BE.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var logo: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGradient()
        self.prepare()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: { [weak self] in
            if let vc = self?.storyboard?.instantiateViewController(withIdentifier: Scene.landing.name) as? LandingViewController {
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                self?.present(nav, animated: false)
            }
        })
        
    }
    
    func setGradient() {
        let gradient: CAGradientLayer = CAGradientLayer(
            start: .topCenter,
            end: .bottomCenter,
            colors: [UIColor.busterBGMain.cgColor, UIColor.busterBGsecond.cgColor]
        )
        gradient.frame = self.view.layer.frame
        mainView.layer.insertSublayer(gradient, at: 0)
    }
    
    func prepare() {
        self.view.backgroundColor = .busterBGMain
        self.logo.textColor = .white
        self.logo.tintColor = .white
        self.logo.layer.shadowColor = UIColor.green.withAlphaComponent(1.0).cgColor
        self.logo.layer.shadowOffset = .init(width: 3, height: 6)
        self.logo.layer.shadowOpacity = 1
        self.logo.layer.shadowRadius = 20
        
        let loading = LoadingView(frame: .zero)
        self.view.addSubview(loading)
        loading.center = self.view.center
    }
    
}
