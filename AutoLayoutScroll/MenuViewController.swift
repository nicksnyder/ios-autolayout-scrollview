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
    let factoryBlock: Void -> UIViewController
}

class MenuViewController: UITableViewController {

    private let viewControllers: [ViewControllerData] = [

        ViewControllerData(title: "Horizontal Auto Layout scroll", factoryBlock: { () -> UIViewController in
            HorizontalLabelsLayoutData.autoLayoutScrollViewControllerWithSubviewCount(50)
        }),
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
        return viewControllers.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = viewControllers[indexPath.row].title
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.navigationController?.pushViewController(viewControllers[indexPath.row].factoryBlock(), animated: false)
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
