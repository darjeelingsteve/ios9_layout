//
//  ViewController.swift
//  iOS9 Layout
//
//  Created by Stephen Anthony on 05/01/2016.
//  Copyright © 2016 Darjeeling Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // The view that will contain our top and bottom views and whose layout margins will be manipulated
    @IBOutlet private weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the top and bottom views
        let topView = UIView()
        let bottomView = UIView()
        topView.backgroundColor = UIColor.redColor()
        bottomView.backgroundColor = UIColor.blueColor()
        topView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(topView)
        containerView.addSubview(bottomView)
        
        // Constrain the top view's height to be 200
        topView.heightAnchor.constraintEqualToConstant(200).active = true
        
        // Constrain our top view to the container view's top, leading, and anchor layout margins
        topView.topAnchor.constraintEqualToAnchor(containerView.layoutMarginsGuide.topAnchor).active = true
        topView.leadingAnchor.constraintEqualToAnchor(containerView.layoutMarginsGuide.leadingAnchor).active = true
        topView.trailingAnchor.constraintEqualToAnchor(containerView.layoutMarginsGuide.trailingAnchor).active = true
        
        // Layout the top and bottom views to be vertically aligned and of equal size
        bottomView.topAnchor.constraintEqualToAnchor(topView.bottomAnchor, constant: 16.0).active = true
        bottomView.leadingAnchor.constraintEqualToAnchor(topView.leadingAnchor).active = true
        bottomView.widthAnchor.constraintEqualToAnchor(topView.widthAnchor).active = true
        bottomView.heightAnchor.constraintEqualToAnchor(topView.heightAnchor).active = true
    }
    
    @IBAction func sliderValueDidChange(slider: UISlider) {
        let newInset: CGFloat = CGFloat(slider.value)
        containerView.layoutMargins = UIEdgeInsets(top: newInset, left: newInset, bottom: newInset, right: newInset)
    }
}

