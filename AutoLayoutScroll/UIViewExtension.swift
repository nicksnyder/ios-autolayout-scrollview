//
//  UIViewExtension.swift
//  AutoLayoutScroll
//
//  Created by Nick Snyder on 6/16/16.
//  Copyright © 2016 Nick Snyder. All rights reserved.
//

import UIKit

extension UIView {

    func addAutoLayoutSubviews(subviews: [String: UIView]) {
        for (_, view) in subviews {
            addAutoLayoutSubview(view)
        }
    }

    func addAutoLayoutSubview(subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
    }

    func addConstraintsWithVisualFormat(visualFormat: String, views: [String: UIView]) {
        let constraints = NSLayoutConstraint.constraintsWithVisualFormat(visualFormat, options: [], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(constraints)
    }
}
