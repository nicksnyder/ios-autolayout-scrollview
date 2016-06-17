//
//  HorizontalLabelsAutoLayoutView.swift
//  AutoLayoutScroll
//
//  Created by Nick Snyder on 6/16/16.
//  Copyright © 2016 Nick Snyder. All rights reserved.
//

import UIKit

/**
 A view that positions two labels next to each other horizontally using Auto Layout.
 
 The right label is configured to take of exactly the horizontal space that it needs for its text and
 the left label takes up the rest of the horizontal space.
 */
class HorizontalLabelsAutoLayoutView: UIView {

    let leftLabel: UILabel! = {
        let l = HelveticaLabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 2
        l.backgroundColor = UIColor.blueColor()
        return l
    }()

    let rightLabel: UILabel! = {
        let l = HelveticaLabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.setContentCompressionResistancePriority(UILayoutPriorityRequired, forAxis: .Horizontal)
        l.setContentHuggingPriority(UILayoutPriorityRequired, forAxis: .Horizontal)
        l.numberOfLines = 1
        l.textAlignment = .Right
        l.backgroundColor = UIColor.purpleColor()
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.greenColor()
        addSubview(leftLabel)
        addSubview(rightLabel)

        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint.equal(leftLabel, toItem: self, attribute: .Top, constant: 0),
            NSLayoutConstraint.equal(leftLabel, toItem: self, attribute: .Leading, constant: 0),
            NSLayoutConstraint.equal(leftLabel, toItem: self, attribute: .Bottom, constant: 0),
            NSLayoutConstraint(item: leftLabel, attribute: .Trailing, relatedBy: .Equal, toItem: rightLabel, attribute: .Leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.equal(rightLabel, toItem: self, attribute: .Trailing, constant: 0),
            NSLayoutConstraint.equal(rightLabel, toItem: self, attribute: .CenterY, constant: 0),
            ])


        // Performance problem disappears if we explicity set the width of the right label.
//        NSLayoutConstraint.activateConstraints([
//            NSLayoutConstraint(item: rightLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 100)
//            ])
    }

    func setData(data: HorizontalLabelsLayoutData) {
        leftLabel.text = data.leftText
        rightLabel.text = data.rightText
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

