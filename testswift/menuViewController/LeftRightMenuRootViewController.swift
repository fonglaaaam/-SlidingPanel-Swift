//
//  LeftRightMenuRootViewController.swift
//  special
//
//  Created by 葛枝鑫 on 15/4/17.
//  Copyright (c) 2015年 葛枝鑫. All rights reserved.
//

import UIKit

let CenterViewOffset : CGFloat = 218

class LeftRightMenuRootViewController: UIViewController, UIGestureRecognizerDelegate {

    
    var tapBtn : UIButton!
    var pan : UIPanGestureRecognizer!
    
    var currentCenterViewOffset4Pan : CGFloat = CenterViewOffset
    
    //    左边控制器
    var leftNavigationController : UINavigationController!  {
        willSet(newLNVC){
            if self.leftNavigationController != nil
            {
                self.leftNavigationController.view.removeFromSuperview()
                self.leftNavigationController.removeFromParentViewController()
            }
        }
        didSet{
            if self.leftNavigationController != nil
            {
                if (self.leftNavigationController.view.superview == nil)
                {
                    self.addChildViewController(leftNavigationController)
                    self.view.insertSubview(leftNavigationController.view, atIndex:0)
                }
            }
        }
    }
    //中间控制器
    var centerNavigationController : UINavigationController!
    {
        willSet(newCNVC){
            if self.centerNavigationController != nil
            {
                self.centerNavigationController.view.removeFromSuperview()
                self.centerNavigationController.removeFromParentViewController()
            }
        }
        didSet {
            if self.centerNavigationController != nil
            {
                if (self.centerNavigationController.view.superview == nil)
                {
                    self.addChildViewController(centerNavigationController)
                    self.view.insertSubview(centerNavigationController.view, atIndex:1)
                }
            }
        }
    }
    
    var isLeftViewOpened : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blackColor()
        tapBtn = UIButton(frame: UIScreen.mainScreen().bounds)
        tapBtn.addTarget(self, action: "tapBtnClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        pan = UIPanGestureRecognizer(target: self, action: "pan:")
        pan.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func closeLeftView()
    {
        isLeftViewOpened = false
        tapBtn.removeFromSuperview()
        centerNavigationController.view.removeGestureRecognizer(pan)
        
        var c = self.centerNavigationController.view.frame
        let duration  = NSTimeInterval(c.origin.x / CenterViewOffset * 0.45)
        
        c.origin.x = 0
        UIView.animateWithDuration(duration, delay:0, usingSpringWithDamping:1.0, initialSpringVelocity:1.0, options:UIViewAnimationOptions.AllowUserInteraction,animations:{
                self.centerNavigationController.view.frame = c
            },completion: { (finished: Bool) -> Void in
    
        })
    }

    func openLeftView()
    {
        isLeftViewOpened = true
        centerNavigationController.view.addSubview(tapBtn)
        centerNavigationController.view.addGestureRecognizer(pan)
        
        var c = self.centerNavigationController.view.frame
        let duration   = NSTimeInterval((CenterViewOffset - c.origin.x) / CenterViewOffset * 0.45)
        
        c.origin.x = CenterViewOffset
        
        UIView.animateWithDuration(duration, delay:0, usingSpringWithDamping:0.9, initialSpringVelocity:1.0, options:UIViewAnimationOptions.AllowUserInteraction,animations:{
            self.centerNavigationController.view.frame = c ;
            },completion: { (finished: Bool) -> Void in
                
        })
    }
    
    func menuBtnClicked()
    {
        if isLeftViewOpened
        {
            self.closeLeftView()
        }
        else
        {
            self.openLeftView()
        }
    }
    
    func setCenterViewOffset(offset:CGFloat)
    {
        if offset < 0 || offset > CenterViewOffset
        {
            return
        }
        self.centerNavigationController.view.x = offset
    }

    
    func tapBtnClicked(sender: UIButton)
    {
        closeLeftView()
    }
    
    func pan(panGesture: UIPanGestureRecognizer)
    {
        let point = panGesture.translationInView(centerNavigationController.view)
        setCenterViewOffset(currentCenterViewOffset4Pan + point.x)
        if pan.state == .Ended
        {
            closeLeftView()
        }
    }
    
    //MARK: - Gesture Delegate
    func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool
    {
        currentCenterViewOffset4Pan = centerNavigationController.view.frame.origin.x
        return true
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        return true
    }
}
