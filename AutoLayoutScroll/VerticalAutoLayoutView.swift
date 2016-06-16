//
//  VerticalAutoLayoutView.swift
//  AutoLayoutScroll
//
//  Created by Nick Snyder on 6/16/16.
//  Copyright © 2016 Nick Snyder. All rights reserved.
//

import UIKit

class VerticalAutoLayoutView: UIView {

    func setArrangedSubviews(arrangedSubviews: [UIView]) {
        for subview in subviews {
            subview.removeFromSuperview()
        }
        for arrangedSubview in arrangedSubviews {
            arrangedSubview.translatesAutoresizingMaskIntoConstraints = false
            addSubview(arrangedSubview)
        }
        let constraints = autolayoutConstraintsForViews(subviews, superview: self)
        addConstraints(constraints)
    }

    private func autolayoutConstraintsForViews(views: [UIView], superview: UIView) -> [NSLayoutConstraint] {
        var previousView: UIView? = nil
        var constraints = [NSLayoutConstraint]()
        let metrics = ["vmargin": 8, "hmargin": 0]
        for view in views {
            constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|-(hmargin)-[v]-(hmargin)-|", options: [], metrics: metrics, views: ["v": view]))
            if let previousView = previousView {
                constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:[pv]-(vmargin)-[v]", options: [], metrics: metrics, views: ["v": view, "pv": previousView]))
            } else {
                constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|-(vmargin)-[v]", options: [], metrics: metrics, views: ["v": view]))
            }
            previousView = view
        }
        if let previousView = previousView {
            constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:[pv]-(vmargin)-|", options: [], metrics: metrics, views: ["pv": previousView]))
        }
        return constraints
    }
}

