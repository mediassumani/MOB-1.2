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
        
       
       setUpPurpleView()
       setUpBlue()
        
        
        
    }
    
    // This functions sets up the contraints of
    func setUpPurpleView(){
        
        // Constraints and properties for the purple view
        let purpleView = UIView()
        purpleView.backgroundColor = UIColor.purple
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(purpleView)
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
                                                             multiplier: 0.5,
                                                             constant: 0)
        
        // Top Constraint
        let purpleViewTopConstraint = NSLayoutConstraint(item: purpleView,
                                                         attribute: .top,
                                                         relatedBy: .equal,
                                                         toItem: self.view,
                                                         attribute: .top,
                                                         multiplier: 1,
                                                         constant: 20)
        
        
        // Bottom Constraint
        let purpleViewBottomConstraint = NSLayoutConstraint(item: purpleView,
                                                            attribute: .bottom,
                                                            relatedBy: .equal,
                                                            toItem: self.view,
                                                            attribute: .bottom,
                                                            multiplier: 1,
                                                            constant: -50)
        self.view.addConstraints([purpleViewLeadingConstraint, purpleViewTrailingContraint, purpleViewTopConstraint,purpleViewBottomConstraint])
        
    }
    
    func setUpBlue(){

        let blueView = UIView()
        blueView.backgroundColor = UIColor.cyan
        self.view.addSubview(blueView)

        // Leading Constraint
        let blueLeadingConstraint = NSLayoutConstraint(item: blueView,
                                                       attribute: .leading,
                                                       relatedBy: .equal,
                                                       toItem: self.view,
                                                       attribute: .leading,
                                                       multiplier: 1,
                                                       constant: 1)
        
        // Trailing Constraint
        let blueTrailingConstraint = NSLayoutConstraint(item: blueView,
                                                        attribute: .trailing,
                                                        relatedBy: .equal,
                                                        toItem: self.view,
                                                        attribute: .trailing,
                                                        multiplier: 1,
                                                        constant: 1)
        
        let blueTopConstraint = NSLayoutConstraint(item: blueView,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: self.view,
                                                   attribute: .top,
                                                   multiplier: 1,
                                                   constant: 1)
        
        let blueBottomConstraint = NSLayoutConstraint(item: blueView,
                                                      attribute: .bottom,
                                                      relatedBy: .equal,
                                                      toItem: self.view,
                                                      attribute: .bottom,
                                                      multiplier: 1,
                                                      constant: 1)
        self.view.addConstraints([blueTopConstraint, blueBottomConstraint, blueLeadingConstraint, blueTrailingConstraint])
    }
    
}

