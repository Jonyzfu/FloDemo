//
//  ViewController.swift
//  FloDemo
//
//  Created by Jonyzfu on 3/27/15.
//  Copyright (c) 2015 Jonyzfu. All rights reserved.
//

import UIKit

var isGraphViewShowing = false

class ViewController: UIViewController {

    @IBOutlet var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPushButton(sender: PushButtonView) {
        if sender.isAddButton {
            if counterView.counter < 8 {
                counterView.counter++
            }
        } else {
            if counterView.counter > 0 {
                counterView.counter--
            }
        }
        counterLabel.text = (String)(counterView.counter)
        if (isGraphViewShowing) {
            // counterViewTap(nil)
        }
    }
    

    @IBAction func counterViewTap(sender: UITapGestureRecognizer) {
        if (isGraphViewShowing) {
            // hide graph
            UIView.transitionFromView(graphView,
                toView: counterView,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromLeft
                | UIViewAnimationOptions.ShowHideTransitionViews,
                completion: nil)
        } else {
            // show graph
            UIView.transitionFromView(counterView,
                toView: graphView,
                duration: 1.0,
                options: UIViewAnimationOptions.TransitionFlipFromRight
                    | UIViewAnimationOptions.ShowHideTransitionViews,
                completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
    }
    


}

