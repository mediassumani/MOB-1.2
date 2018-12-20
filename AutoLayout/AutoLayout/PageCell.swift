//
//  PageCell.swift
//  AutoLayout
//
//  Created by Medi Assumani on 12/19/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell{
    
    // creates an image view that holds the school logo
    let makeSchoolImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "new_logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let schoolDescriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "College designed for the 21st Century",
                                                       attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nEarn your Bachelor's in Applied Computer Science in a community of makers empowered to shape the world.", attributes:
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
             NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        layoutElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Function to constraint the school logo
    private func layoutElements(){
        
        let topImageContainerView = UIView()
        
        addSubview(makeSchoolImageView)
        addSubview(topImageContainerView)
        addSubview(schoolDescriptionTextView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        
        makeSchoolImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        makeSchoolImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        makeSchoolImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        makeSchoolImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5).isActive = true
        
        schoolDescriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        schoolDescriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        schoolDescriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        schoolDescriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        
    }
}
