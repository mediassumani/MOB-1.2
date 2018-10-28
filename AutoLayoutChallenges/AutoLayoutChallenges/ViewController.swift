//
//  ViewController.swift
//  AutoLayoutChallenges
//
//  Created by Medi Assumani on 10/28/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let blueView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let greenView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        view.addSubview(blueView)
        view.addSubview(greenView)
        
    }
    
    
    private func setUpBlueView(){
        
    }
    
    private func setUpRedView(){
        
    }

}

