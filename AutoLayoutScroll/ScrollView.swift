//
//  ScrollView.swift
//  AutoLayoutScroll
//
//  Created by Nick Snyder on 6/16/16.
//  Copyright © 2016 Nick Snyder. All rights reserved.
//

import UIKit

class ScrollView<T: UIView>: UIScrollView {

    private var widthConstraint: NSLayoutConstraint?
    let contentView: T = T()

    init() {
        super.init(frame: CGRectZero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        let views = ["cv": contentView]
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[cv]-0-|", options: [], metrics: nil, views:views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[cv]-0-|", options: [], metrics: nil, views: views))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}