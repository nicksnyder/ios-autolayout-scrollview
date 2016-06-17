//
//  HorizontalLabelsLayout.swift
//  AutoLayoutScroll
//
//  Created by Nick Snyder on 6/16/16.
//  Copyright © 2016 Nick Snyder. All rights reserved.
//

import UIKit

struct HorizontalLabelsLayoutData: Equatable {
    let leftText: String
    let rightText: String

    static func generate(count count: Int) -> [HorizontalLabelsLayoutData] {
        var cells = [HorizontalLabelsLayoutData]()
        for _ in 0..<count {
            let width = UIScreen.mainScreen().bounds.width
            switch width {
            case 375:
                // This data causes the label to wrap to a second line on an iPhone 6 in portrait.
                cells.append(HorizontalLabelsLayoutData(leftText: "caaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaab", rightText: "555"))
            case 320:
                // This data causes the label to wrap to a second line on an iPhone 5 in portrait.
                cells.append(HorizontalLabelsLayoutData(leftText: "caaaaaaaaaaaaaaaaaa aaaaaaaaaaaab", rightText: "555"))
            default:
                NSLog("the test data will not produce a performance problem for this width: \(width)")
                cells.append(HorizontalLabelsLayoutData(leftText: "caaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaab", rightText: "555"))
            }
        }
        return cells
    }

    static func autoLayoutScrollViewControllerWithSubviewCount(subviewCount: Int) -> ScrollViewController<VerticalAutoLayoutView> {
        let subviews = HorizontalLabelsLayoutData.generate(count: subviewCount).map { (data) -> HorizontalLabelsAutoLayoutView in
            let v = HorizontalLabelsAutoLayoutView()
            v.setData(data)
            return v
        }
        return ScrollViewController<VerticalAutoLayoutView>(configureBlock: { (v: VerticalAutoLayoutView) -> Void in
            v.setArrangedSubviews(subviews)
        })
    }
}

func ==(lhs: HorizontalLabelsLayoutData, rhs: HorizontalLabelsLayoutData) -> Bool {
    return lhs.leftText == rhs.leftText && lhs.rightText == rhs.rightText
}
