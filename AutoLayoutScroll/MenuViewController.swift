//
//  MenuViewController.swift
//  AutoLayoutScroll
//
//  Created by Nick Snyder on 6/15/16.
//  Copyright © 2016 Nick Snyder. All rights reserved.
//

import UIKit


struct ViewControllerData {
    let title: String
    let description: String
    let factoryBlock: Void -> UIViewController
}

class MenuViewController: UITableViewController {

    private let viewControllers: [ViewControllerData] = [

        ViewControllerData(
            title: "Slow UIScrollView using Auto Layout",
            description: "This UIScrollView is slow to load and slow to scroll when it is run on a physical device with the width of an iPhone 6.\n\nNote that it is not slow to load or scroll in landscape mode on iPhone 6.",
            factoryBlock: { () -> UIViewController in
                HorizontalLabelsLayoutData.autoLayoutScrollViewControllerWithSubviewCount(50)
            }
        ),
    ]

    convenience init() {
        self.init(style: UITableViewStyle.Grouped)
        title = "Menu"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(BasicTableCell.self, forCellReuseIdentifier: "cell")
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return viewControllers.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = viewControllers[indexPath.section].title
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        navigationController?.pushViewController(viewControllers[indexPath.section].factoryBlock(), animated: false)
    }

    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return viewControllers[section].description
    }
}

class BasicTableCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
