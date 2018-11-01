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
        container.addSubview(studentNameLabel)
        setUpContainerView()
        setUpProfileImageView()
        setUpStudentNameLabel()

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
    
    let studentNameLabel: UITextView = {
        
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Medi Assumani",
                                                       attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)])
        
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let studentTrackLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Mobile iOS"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let container: UIView = {
        
        let view = UIView()
        view.backgroundColor = .clear
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
    
    private func setUpStudentNameLabel(){
        
        NSLayoutConstraint.activate([studentNameLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                                     studentNameLabel.topAnchor.constraint(equalTo: container.topAnchor),
                                     studentNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
                                     //studentNameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 1)
                                     ])
    }
    
    private func setUpStudentTrackLabel(){
        
    }
}

