//
//  ScrollView.swift
//  AutoLayoutScroll
//
//  Created by Nick Snyder on 6/16/16.
//  Copyright © 2016 Nick Snyder. All rights reserved.
//

import UIKit

class ScrollView<T: UIView>: UIScrollView {

//    private var widthConstraint: NSLayoutConstraint
    let contentView: T = T()

    init() {
//        widthConstraint = NSLayoutConstraint(item: contentView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 0)
        super.init(frame: CGRectZero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        let views = ["cv": contentView]
        NSLayoutConstraint.activateConstraints([
        ])
        addConstraintsWithVisualFormat("V:|-0-[cv]-0-|", views: views)
        addConstraintsWithVisualFormat("H:|-0-[cv]-0-|", views: views)
//        contentView.addConstraint(widthConstraint)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    override func layoutSubviews() {
//        if widthConstraint.constant != frame.width {
//            widthConstraint.constant = frame.width
//        }
//        super.layoutSubviews()
//    }
}