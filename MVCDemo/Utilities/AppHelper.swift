//
//  AppHelper.swift
//  MVCDemo
//
//  Created by Muazam on 27/01/2022.
//  Copyright © 2022 Abhilash Mathur. All rights reserved.
//

import UIKit

class AppHelper {
    
    static let instance = AppHelper()
    
    let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
    
    
    
}

