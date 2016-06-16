//
//  ScrollViewController.swift
//  AutoLayoutScroll
//
//  Created by Nick Snyder on 6/16/16.
//  Copyright © 2016 Nick Snyder. All rights reserved.
//

import UIKit

class ScrollViewController<T: UIView>: UIViewController {

    private let configureBlock: T -> Void

    init(configureBlock: T -> Void) {
        self.configureBlock = configureBlock
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        let scrollView = ScrollView<T>()
        scrollView.frame = view.bounds
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        view.addSubview(scrollView)
        configureBlock(scrollView.contentView)
        view.addConstraint(NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: scrollView.contentView, attribute: .Width, multiplier: 1, constant: 0))
    }
}