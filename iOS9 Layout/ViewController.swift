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
    
    @IBAction func sliderValueDidChange(slider: UISlider) {
        let newInset: CGFloat = CGFloat(slider.value)
        containerView.layoutMargins = UIEdgeInsets(top: newInset, left: newInset, bottom: newInset, right: newInset)
    }
}
