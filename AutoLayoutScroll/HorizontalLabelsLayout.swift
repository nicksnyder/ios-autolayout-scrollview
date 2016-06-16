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
            // This data causes the label to wrap to a second line on iPhone 6
            let cell = HorizontalLabelsLayoutData(leftText: "caaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaab", rightText: "555")
            //            let cell = HorizontalLabelsLayoutData(leftText: "caaaaaaaaaa aaaaaaaaaab", rightText: "555")
            cells.append(cell)
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

//protocol HorizontalLabelsLayout: DataBinder {
//    typealias DataType = HorizontalLabelsLayoutData
//    var rootView: UIView { get }
//    var leftLabel: UILabel! { get }
//    var rightLabel: UILabel! { get }
//}
