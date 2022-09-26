//
//  UIViewController+Extensions.swift
//  Buster
//
//  Created by iZE Appsynth on 26/9/2565 BE.
//

import Foundation
import UIKit

enum Storyboard {
    case main
    var instance: UIStoryboard {
        switch self {
        case .main: return UIStoryboard(name: "Main", bundle: nil)
        }
    }
}

enum Scene {
    case landing
    
    var name: String {
        switch self {
            case .landing:
                return "LandingViewController"
        }
    }
}

extension UIViewController {
    func replaceRoot(vc: UIViewController) {
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
