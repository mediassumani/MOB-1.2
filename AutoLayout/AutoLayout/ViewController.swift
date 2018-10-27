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
        let imageView = UIImageView(image: UIImage(named: "MakeSchoolLogo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    // creates a text view that contains the a short description
    let schoolDescriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "College designed for the 21st Century"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
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
        makeSchoolImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, constant: 0.5).isActive = true
    }
}

