//
//  ContainerView.swift
//  iOS9 Layout
//
//  Created by Stephen Anthony on 06/01/2016.
//  Copyright © 2016 Darjeeling Apps. All rights reserved.
//

import UIKit

/// A view class containing two equal sized subviews that are bound to its layout margins
@IBDesignable
class ContainerView: UIView {
    private let topView = UIView()
    private let bottomView = UIView()
    
    /// The colour of the top view
    @IBInspectable var topColour: UIColor? {
        get {
            return topView.backgroundColor
        }
        set {
            topView.backgroundColor = newValue
        }
    }
    
    /// The colour of the bottom view
    @IBInspectable var bottomColour: UIColor? {
        get {
            return bottomView.backgroundColor
        }
        set {
            bottomView.backgroundColor = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        topView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(topView)
        self.addSubview(bottomView)
        
        topView.heightAnchor.constraintEqualToConstant(200).active = true
        
        // Constrain our top view to the container view's top, leading, and anchor layout margins
        topView.topAnchor.constraintEqualToAnchor(self.layoutMarginsGuide.topAnchor).active = true
        topView.leadingAnchor.constraintEqualToAnchor(self.layoutMarginsGuide.leadingAnchor).active = true
        topView.trailingAnchor.constraintEqualToAnchor(self.layoutMarginsGuide.trailingAnchor).active = true
        
        // Layout the top and bottom views to be vertically aligned and of equal size
        bottomView.topAnchor.constraintEqualToAnchor(topView.bottomAnchor, constant: 16.0).active = true
        bottomView.leadingAnchor.constraintEqualToAnchor(topView.leadingAnchor).active = true
        bottomView.widthAnchor.constraintEqualToAnchor(topView.widthAnchor).active = true
        bottomView.heightAnchor.constraintEqualToAnchor(topView.heightAnchor).active = true
    }
}
