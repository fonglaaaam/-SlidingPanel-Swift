//
//  ViewController.swift
//  testswift
//
//  Created by dz on 15/9/24.
//  Copyright © 2015年 dingzai. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource
{
    var tableView   : UITableView?
    var items       : NSArray?
    
    
    var centerNavController : UINavigationController!
    var secondNavController : UINavigationController!
    var thirdNavController : UINavigationController!
    
    var rootViewController: LeftRightMenuRootViewController!

    
    
    override func viewDidLoad()
    {
        self.items = ["爱饭", "列表", "宫格", "果岭裙下转"]
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.hidden = true
        self.tableView = UITableView(frame:self.view.frame, style:UITableViewStyle.Plain)
        self.tableView!.y = 120
        
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.tableView!)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        rootViewController = appDelegate.rootLRMViewController

    }
    
    // UITableViewDataSource Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = self.items?.objectAtIndex(indexPath.row) as! String!
        
        return cell
    }
    
    // UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
//        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
//        
//        let detailViewController = DetailViewController()
//        detailViewController.title = self.items?.objectAtIndex(indexPath.row)  as! String!
//        self.navigationController!.pushViewController(detailViewController, animated:true)
       
        switch indexPath.row
        {
        case 0:
            self.homePageClicked()
            break
        case 1:
            self.thirdNavControllerClicked()
            break
        case 2:
            self.secondNavControllerClicked()
            break
        case 3:
            self.aboutClicked()
            break
        case 4:
            self.settingClicked()
            break
        default:
            break
        }
        self.menuClicked()
    }
    
    //
    override func didReceiveMemoryWarning()
    {}
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 50
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.tableView!.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: false, scrollPosition: UITableViewScrollPosition.Top)
    }

    func menuClicked()
    {
        if(rootViewController != nil)
        {
            rootViewController.menuBtnClicked()
        }
    }
    
    func homePageClicked()
    {
        self.rootViewController.centerNavigationController = self.centerNavController
    }
    
    func thirdNavControllerClicked()
    {
        self.rootViewController.centerNavigationController = self.thirdNavController
    }
    
    func secondNavControllerClicked()
    {
        self.rootViewController.centerNavigationController = self.secondNavController
    }
    
    func aboutClicked()
    {
        
    }
    
    func settingClicked()
    {
        
    }
}




