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
        
        view.addSubview(container)
        container.addSubview(blueView)
        setUpContainerView()
        setUpBlueView()
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
    
    let container: UIView = {
        
        let view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setUpContainerView(){
        
        NSLayoutConstraint.activate([container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                                     container.heightAnchor.constraint(equalToConstant: 120),
                                     container.widthAnchor.constraint(equalToConstant: 250)])
    }
    
    private func setUpBlueView(){
        
        
        
        NSLayoutConstraint.activate([blueView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                                     blueView.topAnchor.constraint(equalTo: container.topAnchor),
                                     blueView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
                                     blueView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
                                     blueView.trailingAnchor.constraint(lessThanOrEqualTo: container.trailingAnchor, constant: -50)])

    }
    
    private func setUpGreenView(){
        
        NSLayoutConstraint.activate([greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
                                    greenView.leadingAnchor.constraint(equalToSystemSpacingAfter: blueView.trailingAnchor, multiplier: 10),
                                    greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                    greenView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 100),
                                    greenView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
                                    greenView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2)])
    }
}

