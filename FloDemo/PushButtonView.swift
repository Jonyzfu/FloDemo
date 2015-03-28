//
//  PushButtonView.swift
//  FloDemo
//
//  Created by Jonyzfu on 3/27/15.
//  Copyright (c) 2015 Jonyzfu. All rights reserved.
//

import UIKit

class PushButtonView: UIButton {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        var path = UIBezierPath(ovalInRect: rect)
        UIColor.greenColor().setFill()
        path.fill()
    }
    
    
    

}
