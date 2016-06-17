# Slow performance of UIScrollView

This project demonstrates severe performance degration of UIScrollView during initial layout as well as scrolling (dropped frames).

The degradation happens as when we have two UILabel positioned next to each other using Auto Layout with the following properties:
* The right UILabel has contentCompressionResistance == UILayoutPriorityRequired
* The right UILabel has contentHuggingPriority == UILayoutPriorityRequired
* The right UILabel has a small amount (one line) of text.
* The left UILabel has default contentCompressionResistance and contentCompressionPriority so it should take up the space not used by the right UILabel.
* The left UILabel has enough text such that it wraps to two lines, but that it would only be one line of text if the right UILabel did not exist.

The project is configured to demonstrate this degradation on _physical devices_ that have the same width as an iPhone 6 in portrait mode.

You can see that that there is no performance degradation when you rotate these devices to landscape.

The performance degradation can also be eliminted by setting an explicit width constraint on the right label (see commented out code in HorizontalLabelsAutoLayoutView.swift).

Reproduced on a iPhone 6 running iOS 9.3.2.
Unable to reproduce on a iPhone 5 running iOS 8.4.1

This appears to be a performance regression in iOS 9.
