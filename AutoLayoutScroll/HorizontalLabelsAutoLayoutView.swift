//
//  HorizontalLabelsAutoLayoutView.swift
//  AutoLayoutScroll
//
//  Created by Nick Snyder on 6/16/16.
//  Copyright © 2016 Nick Snyder. All rights reserved.
//

import UIKit

class HorizontalLabelsAutoLayoutView: UIView {

    lazy var rootView: UIView = {
        return self
    }()

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

        let constraints: [NSLayoutConstraint] = [
            NSLayoutConstraint.equal(leftLabel, toItem: self, attribute: .Top, constant: 0),
            NSLayoutConstraint.equal(leftLabel, toItem: self, attribute: .Leading, constant: 0),
            NSLayoutConstraint.equal(leftLabel, toItem: self, attribute: .Bottom, constant: 0),
            NSLayoutConstraint(item: leftLabel, attribute: .Trailing, relatedBy: .Equal, toItem: rightLabel, attribute: .Leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.equal(rightLabel, toItem: self, attribute: .Trailing, constant: 0),
            NSLayoutConstraint.equal(rightLabel, toItem: self, attribute: .CenterY, constant: 0),
            ]
        addConstraints(constraints)
    }

    func setData(data: HorizontalLabelsLayoutData) {
        leftLabel.text = data.leftText
        rightLabel.text = data.rightText
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

