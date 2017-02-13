//
//  CollectionViewCell.swift
//  TSwfit
//
//  Created by Hunk on 14/11/24.
//  Copyright (c) 2014年 Hunk. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell
{
    var imageView   :UIImageView?
    var textLabel   :UILabel?
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        // Image view
        self.imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 90.0, height: 90.0))
        self.contentView.addSubview(self.imageView!)
        
        // Text
        self.textLabel = UILabel(frame: CGRect(x: 0.0, y: 90.0, width: 95.0, height: 20.0))
        self.textLabel?.textColor = UIColor.red;
        self.textLabel?.textAlignment = NSTextAlignment.center;
        self.contentView.addSubview(self.textLabel!)
    }
}
