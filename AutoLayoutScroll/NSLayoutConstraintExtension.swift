//
//  NSLayoutConstraintExtension.swift
//  AutoLayoutScroll
//
//  Created by Nick Snyder on 6/16/16.
//  Copyright © 2016 Nick Snyder. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    static func equal(item: AnyObject, toItem: AnyObject, attribute: NSLayoutAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .Equal, toItem: toItem, attribute: attribute, multiplier: 1, constant: constant)
    }
}
