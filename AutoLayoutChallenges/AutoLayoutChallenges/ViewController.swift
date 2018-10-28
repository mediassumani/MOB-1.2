//
//  ViewController.swift
//  AutoLayoutChallenges
//
//  Created by Medi Assumani on 10/28/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(blueView)
        view.addSubview(greenView)
        setUpBlueView()
        setUpGreenView()
        
    }
    
    let blueView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let greenView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    private func setUpBlueView(){
        
        blueView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        blueView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setUpGreenView(){
        
        NSLayoutConstraint.activate([greenView.topAnchor.constraint(equalTo: blueView.bottomAnchor),
                                    greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                    greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                    greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                                    ])
    }
}

