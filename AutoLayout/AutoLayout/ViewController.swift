//
//  ViewController.swift
//  AutoLayout
//
//  Created by Medi Assumani on 10/25/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    fileprivate func setUpView(){
        
        let purpleView = UIView()
        let blueView = UIView()
        
        
        // Constraints and properties for the purple view
        
        purpleView.backgroundColor = UIColor.purple
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        // Leading constraint
        let purpleViewLeadingConstraint = NSLayoutConstraint(item: purpleView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self.view,
                                                   attribute: .leading,
                                                   multiplier: 1,
                                                   constant: 20)
        
        // Trailing constraint
        let purpleViewTrailingContraint = NSLayoutConstraint(item: purpleView,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: self.view,
                                                    attribute: .trailing,
                                                    multiplier: 1,
                                                    constant: 20)
        
        // Top Constraint
        let purpleViewTopConstraint = NSLayoutConstraint(item: purpleView,
                                                         attribute: .top,
                                                         relatedBy: .equal,
                                                         toItem: self.view,
                                                         attribute: .top,
                                                         multiplier: 1,
                                                         constant: 20)
        
        
        // Bottom Constraint
     
        self.view.addSubview(purpleView)
        self.view.addSubview(blueView)
    }
    
}

