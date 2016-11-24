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
    fileprivate let topView = UIView()
    fileprivate let bottomView = UIView()
    
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
    
    fileprivate func commonInit() {
        topView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(topView)
        self.addSubview(bottomView)
        
        topView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        // Constrain our top view to the container view's top, leading, and anchor layout margins
        topView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
        
        // Layout the top and bottom views to be vertically aligned and of equal size
        bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 16.0).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
        bottomView.widthAnchor.constraint(equalTo: topView.widthAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: topView.heightAnchor).isActive = true
    }
}
