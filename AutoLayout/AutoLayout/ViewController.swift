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
        view.addSubview(schoolDescriptionTextView)
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(makeSchoolImageView)
        layoutSchoolLogo()
        layoutSchoolDescription()
    }
    
    // creates a container that will hold the logo
    let topImageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // creates an image view that holds the school logo
    let makeSchoolImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "old_logo2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    // creates a text view that contains the a short description
    let schoolDescriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "College designed for the 21st Century",
                                                attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nEarn your Bachelor's in Applied Computer Science immersed in a community of makers empowered to shape the world", attributes:
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
             NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    
    private func layoutSchoolDescription(){
        
        schoolDescriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        schoolDescriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        schoolDescriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        schoolDescriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    private func layoutSchoolLogo(){
        
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        makeSchoolImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        makeSchoolImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        makeSchoolImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        makeSchoolImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5).isActive = true

    }
}

