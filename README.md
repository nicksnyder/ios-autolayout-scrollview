# Slow performance of UIScrollView

This project demonstrates severe performance degration of UIScrollView during initial layout as well as scrolling (dropped frames).

The degradation happens when two UILabels are positioned next to each other using Auto Layout with the following properties:
- The right UILabel has contentCompressionResistance == UILayoutPriorityRequired
- The right UILabel has contentHuggingPriority == UILayoutPriorityRequired
- The right UILabel has a small amount (one line) of text.
- The left UILabel has default contentCompressionResistance and contentCompressionPriority so it should take up the space not used by the right UILabel.
- The left UILabel has enough text such that it wraps to two lines, but that it would only be one line of text if the right UILabel did not exist.

This project is configured to demonstrate this degradation on screens of width 375px (e.g. iPhone 6) or 320px (e.g. iPhone 5).

You can see that that there is no performance degradation when you rotate these devices to landscape.

The performance degradation can also be eliminted by setting an explicit width constraint on the right label (see commented out code in HorizontalLabelsAutoLayoutView.swift).

Reproducible on:
- iPhone 6 running iOS 9.3.2.
- iPhone 6 simulator running iOS 9.3.
- iPhone 5 simulator running iOS 9.3.

Not reproducible on:
- iPhone 5 running iOS 8.4.1.
- iPhone 5 simulator running iOS 8.4
- iPhone 6 simulator running iOS 8.4

This appears to be a performance regression in iOS 9.

Bug report: 26856318
