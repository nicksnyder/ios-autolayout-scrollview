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
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        let views = ["scrollView": scrollView]
        view.addConstraintsWithVisualFormat("V:|[scrollView]|", views: views)
        view.addConstraintsWithVisualFormat("H:|[scrollView]|", views: views)

        configureBlock(scrollView.contentView)
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: view, attribute: .Width, relatedBy: .Equal, toItem: scrollView.contentView, attribute: .Width, multiplier: 1, constant: 0)
        ])

    }
}