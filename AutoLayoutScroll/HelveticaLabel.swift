//
//  HelveticaLabel.swift
//  AutoLayoutScroll
//
//  Created by Nick Snyder on 6/16/16.
//  Copyright © 2016 Nick Snyder. All rights reserved.
//

import UIKit

/// A label that uses Helvetica font.
public class HelveticaLabel: UILabel {
    private static let defaultFontSize: CGFloat = 17

    public init(text: String? = nil, fontSize: CGFloat = HelveticaLabel.defaultFontSize) {
        super.init(frame: CGRectZero)
        self.text = text
        self.font = UIFont(name: "Helvetica", size: fontSize)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.font = UIFont(name: "Helvetica", size: self.font?.pointSize ?? HelveticaLabel.defaultFontSize)
    }
}