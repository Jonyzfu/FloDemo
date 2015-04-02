//
//  CounterView.swift
//  FloDemo
//
//  Created by Jonyzfu on 4/1/15.
//  Copyright (c) 2015 Jonyzfu. All rights reserved.
//

import UIKit

let NoOfGlasses = 8
let π: CGFloat = (CGFloat)(M_PI)

@IBDesignable
class CounterView: UIView {

    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= NoOfGlasses {
                // the view needs to be refreshed
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // define the center point of the view
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        
        // calculate the radius based on the max dimension of the view
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        // define the thickness of the arc
        let arcWidth: CGFloat = 76
        
        // define the start and end angles for the arc
        let startAngle: CGFloat = 3.0 * π / 4.0
        let endAngle: CGFloat = π / 4.0
        
        // Create a path based on the above para
        var path = UIBezierPath(arcCenter: center, radius: bounds.width/2 - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        // Set the line width and color
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        
        // Draw the outline
        // calculate the difference between the two angles
        let angleDifference: CGFloat = 2.0 * π - startAngle + endAngle
        
        // calculate the arc for each single glass
        let arcLengthPerGlass = angleDifference / (CGFloat)(NoOfGlasses)
        
        // multiply out by the actual glasses drunk
        let outlineEndAngle = arcLengthPerGlass * (CGFloat)(counter) + startAngle
        
        // Draw the outer arc
        var outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - 2.5, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        
        // Draw the inner arc
        outlinePath.addArcWithCenter(center, radius: bounds.width/2 - arcWidth + 2.5, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        
        // close the path
        outlinePath.closePath()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
    }
    

}
