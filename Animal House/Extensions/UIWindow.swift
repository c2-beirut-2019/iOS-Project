//
//  UIWindow.swift
//  Animal House
//
//  Created by Roy Geagea on 8/29/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

extension UIWindow {
    func setRootView<rootView: View>(rootView: rootView) {
        guard let rootViewController = self.rootViewController else { return }
        let rootVC = UIHostingController(rootView: rootView)
        rootVC.view.frame = rootViewController.view.frame
        rootVC.view.layoutIfNeeded()
        self.makeKeyAndVisible()
        UIView.transition(with: self, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            self.rootViewController = rootVC
        }, completion: nil)
    }
}
