//
//  GeneralExtensions.swift
//  MVCDemo
//
//  Created by Muazam on 27/01/22.
//

import UIKit

extension UIApplication {
    
    class func topViewController(controller: UIViewController? = AppHelper.instance.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
}

extension UIViewController {
    func showLoader(activityLoader : UIActivityIndicatorView) {
        DispatchQueue.main.async {
            activityLoader.isHidden = false
            activityLoader.startAnimating()
        }
    }
    
    func hideLoader(activityLoader : UIActivityIndicatorView) {
        DispatchQueue.main.async {
            activityLoader.isHidden = true
            activityLoader.stopAnimating()
        }
    }
}
