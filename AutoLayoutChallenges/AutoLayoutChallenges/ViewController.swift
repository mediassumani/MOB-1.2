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
        container.addSubview(profileImageView)
        setUpContainerView()
        setUpProfileImageView()

    }
    
    let profileImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.shadowRadius = 1
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let greenView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let container: UIView = {
        
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setUpContainerView(){
        
        NSLayoutConstraint.activate([container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                                     container.heightAnchor.constraint(equalToConstant: 120),
                                     container.widthAnchor.constraint(equalToConstant: 300)])
    }
    
    private func setUpProfileImageView(){
        
        NSLayoutConstraint.activate([profileImageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                                    profileImageView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 1),
                                    profileImageView.widthAnchor.constraint(equalTo: container.heightAnchor, multiplier: 1)
            ])
    }
    
    private func setUpGreenView(){
        
        NSLayoutConstraint.activate([greenView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                                     greenView.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 1),
                                     greenView.widthAnchor.constraint(equalTo: container.heightAnchor, multiplier: 1),
                                     greenView.trailingAnchor.constraint(equalTo: container.trailingAnchor)
                                     ])
    }
}

