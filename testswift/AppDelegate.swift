//
//  AppDelegate.swift
//  testswift
//
//  Created by dz on 15/9/24.
//  Copyright © 2015年 dingzai. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootLRMViewController : LeftRightMenuRootViewController!


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()

        let leftVC = ViewController();
        let homeVC = DetailViewController()
        homeVC.title = "UILabel"
        let homeNVC = UINavigationController(rootViewController: homeVC)
        let leftNVC = UINavigationController(rootViewController: leftVC)
//
        let importentVC = DetailViewController()
        importentVC.title = "UIButton"
        let importentNVC = UINavigationController(rootViewController: importentVC)
        importentNVC.view.x = CenterViewOffset
        
        let favouriteVC = DetailViewController()
        favouriteVC.title = "UIImageView"
        let favouriteNCV = UINavigationController(rootViewController: favouriteVC)
        favouriteNCV.view.x = CenterViewOffset
//
        leftVC.centerNavController = homeNVC
        leftVC.secondNavController = favouriteNCV
        leftVC.thirdNavController = importentNVC
//
//        //设置分界线样式(layer边缘阴影）
        self.setViewBoundary(homeNVC)
        self.setViewBoundary(favouriteNCV)
        self.setViewBoundary(importentNVC)

        let rootVC = LeftRightMenuRootViewController()
        rootVC.leftNavigationController = leftNVC
        rootVC.centerNavigationController = homeNVC
        rootLRMViewController = rootVC
        
        self.window!.rootViewController = rootVC
        self.window!.makeKeyAndVisible()
        
        return true
    }

    func setViewBoundary(nvc: UINavigationController)
    {
        
        nvc.view.layer.shadowOffset = CGSizeMake(0,0);
        nvc.view.layer.shadowOpacity = 0.5;
        nvc.view.layer.shadowRadius = 7.0;
        nvc.view.layer.shadowColor = UIColor.blackColor().CGColor
        
        let shadowPath = UIBezierPath(rect:nvc.view.bounds)
        nvc.view.layer.shadowPath = shadowPath.CGPath;
    }
    
    
    
    
    func testFunc(){
//        var myVariable = 4.2
//        myVariable = 5.0
//        let myConstant = 42
//        
//        let pi = myVariable + Double(myConstant)
//        print(myConstant)
//        print(myVariable)
//        print(pi)
//        
//        
//        let little = Int(pi)
//        print(little)
//        
//        var welcomeMessage: String
//        welcomeMessage = "hello"
//        welcomeMessage.appendContentsOf(" everyone!")
//        print(welcomeMessage)
//        
//        let fake = "somethings"
//        if fake.isEmpty{
//            print("nothing")
//        }else{
//            print((fake))
//        }
//        
//        let http404Error = (404, "Not Found")
//        print(http404Error)
//        
//        let (status,message) = http404Error
//        print(message)
//        print(status)
//        
//        let(code,_) = http404Error
//        print(code)
//        print(http404Error.1)
//        
//        let http200Status = (statusCode: 200, description: "OK")
//        print("The status code is \(http200Status.statusCode)")
//        print("The status message is \(http200Status.description)")
//        
//        var http404 = (statusCode: 404, messageDetail:"error")
//        http404.0 = 234
//        http404.1 = "hahahaha"
//        http404.statusCode = 404
//        http404.messageDetail = "404erroRRRR"
//        print(http404)
//        
//        let str = "123"
//        print("\(str) >>>> ")
//        let numberFromStr = Int(str)
//        print("\(numberFromStr)  >>>>>>")
//        
//        let nstring :NSString = "i am a nsstring~"
//        
//        print("\(nstring) 's length is >>>\(nstring.length)\n\(str)'s length is \(str.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)))")
//     
//        let vegetable = "red pepper"
//        switch vegetable {
//        case "celery":
//            print("Add some raisins and make ants on a log.")
//        case "cucumber", "watercress":
//            print("That would make a good tea sandwich.")
//        case let x where x.hasSuffix("pepper"):
//            print("Is it a spicy \(x)?")
//        default:
//            print("Everything tastes good in soup.")
//        }

//        let interestingNumbers = [
//            "Prime": [2, 3, 5, 7, 11, 13],
//            "Fibonacci": [1, 1, 2, 3, 5, 8],
//            "Square": [1, 4, 9, 16, 25],
//        ]
//        var largest = 0
//        var finalName = ""
//        for (kind, numbers) in interestingNumbers {
//            for number in numbers {
//                if number > largest {
//                    largest = number
//                    finalName = kind
//                }
//            }
//        }
//        print("\(largest) in \(finalName) is largest num")
//        
//        for (name,nums) in interestingNumbers{
//            for num in nums{
//                if num < largest{
//                    largest = num
//                    finalName = name
//                }
//            }
//        }
//        print("least num is >>\(largest) of \(finalName)")
//
//        var n = 2
//        while n < 100 {
//            n = n * 2
//        }
//        print(n)
//        
//        var m = 2
//        repeat {
//            m = m * 2
//        } while m < 100
//        print(m)
//        
//        var firstForLoop = 0
//        for i in 0..<4 {
//            firstForLoop += i
//        }
//        print(firstForLoop)
//        
//        var secondForLoop = 0
//        for var i = 0; i < 4; ++i {
//            secondForLoop += i
//        }
//        print(secondForLoop)
//        
//        
//        func greet(name: String, day: String) -> String {
//            return "Hello \(name), today is \(day)."
//        }
//        let greeting = greet("Bob", day: "Tuesday")
//        print(greeting)
//        
        
//        func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
//            var min = scores[0]
//            var max = scores[0]
//            var sum = 0
//            
//            for score in scores {
//                if score > max {
//                    max = score
//                } else if score < min {
//                    min = score
//                }
//                sum += score
//            }
//            
//            return (min, max, sum)
//        }
//        let statistics = calculateStatistics([5, 3, 100, 3, 9])
//        print(statistics.sum)
//        print(statistics.2)
//    
       
//        func sumOf(numbers: [Int]) -> Int {
//            var sum = 0
//            for number in numbers {
//                sum += number
//            }
//            return sum
//        }
//        
//        func calculateAverage(numlists: [Int]) -> Double {
//            return Double(sumOf(numlists)) / Double(numlists.count)
//        }
//        print(calculateAverage([1,2]))
//        
//        let answer : Double = (1+2)/2
//        print(answer)

        func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
            for item in list {
                if condition(item) {
                    return true
                }
            }
            return false
        }
        func lessThanTen(number: Int) -> Bool {
            return number < 10
        }
        let numbers = [20, 19, 7, 12]
        hasAnyMatches(numbers, condition: lessThanTen)
        
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

