//
//  ViewController.swift
//  testswift
//
//  Created by dz on 15/9/24.
//  Copyright © 2015年 dingzai. All rights reserved.
//

import UIKit


class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource
{
    var tableView   : UITableView?
    var items       : NSArray?
    
    
    var centerNavController : UINavigationController!
    var secondNavController : UINavigationController!
    var thirdNavController : UINavigationController!
    var forthNavController : UINavigationController!

    var rootViewController: LeftRightMenuRootViewController!

     let buttons :Array = ["UISlider","UIWebView","UISegmentedControl","UISwitch","UITextField","UIScrollView","UISearchBar","UIPageControl","UIDatePicker","UIPickerView","UIProgressView","UITextView","UIToolbar","UIActionSheet","UIActivityIndicatorView","UICollectionView"]
    
    override func viewDidLoad()
    {
        self.items = ["UILable", "UIButton", "UIImageView", "UIView"]
        self.view.backgroundColor = UIColor.white
        self.navigationController!.navigationBar.isHidden = true
        self.tableView = UITableView(frame:self.view.frame, style:UITableViewStyle.plain)
        self.tableView!.y = 120
        
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.tableView!)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        rootViewController = appDelegate.rootLRMViewController

    }
    
    // UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = self.items?.object(at: indexPath.row) as! String!
        
        return cell
    }
    
    // UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
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
            self.menuClicked()
            break
        case 1:
            self.secondNavControllerClicked()
            self.menuClicked()
            break 
        case 2:
            self.thirdNavControllerClicked()
            self.menuClicked()
            break
        case 3:
            self.forthNavControllerClicked()
            break
        default:
            break
        }
//        self.menuClicked()
    }
    
    //
    override func didReceiveMemoryWarning()
    {}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tableView!.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: UITableViewScrollPosition.top)
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
    
    func secondNavControllerClicked()
    {
        self.rootViewController.centerNavigationController = self.secondNavController
    }
    
    func thirdNavControllerClicked()
    {
        self.rootViewController.centerNavigationController = self.thirdNavController
    }
    
    func forthNavControllerClicked()
    {

        
        let alert = UIAlertController(title: "PLZ Select one UIView", message:nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        for button:String in buttons {
            alert.addAction(UIAlertAction.init(title: button, style: UIAlertActionStyle.default, handler: { (action) in
                self.forthNavController.visibleViewController?.title = button
                if let vc:DetailViewController = self.forthNavController.visibleViewController as? DetailViewController{
                    if let view = vc.subView{
                        view .removeFromSuperview()
                    }
                }
                self.rootViewController.centerNavigationController = self.forthNavController
                self.menuClicked()
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func settingClicked()
    {
        
    }
}



