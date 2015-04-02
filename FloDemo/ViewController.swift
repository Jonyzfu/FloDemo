//
//  ViewController.swift
//  FloDemo
//
//  Created by Jonyzfu on 3/27/15.
//  Copyright (c) 2015 Jonyzfu. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
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
            counterView.counter++
        } else {
            if counterView.counter > 0 {
                counterView.counter--
            }
        }
        counterLabel.text = (String)(counterView.counter)
    }
    

    


}

