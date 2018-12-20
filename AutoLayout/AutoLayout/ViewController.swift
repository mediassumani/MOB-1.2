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
    }
    
    // creates a container that will hold the logo
//    let topImageContainerView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .clear
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//
//    // creates an image view that holds the school logo
//    let makeSchoolImageView: UIImageView = {
//        let imageView = UIImageView(image: UIImage(named: "new_logo"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
    
    
    // creates a text view that contains the a short description
//    let schoolDescriptionTextView: UITextView = {
//        let textView = UITextView()
//        let attributedText = NSMutableAttributedString(string: "College designed for the 21st Century",
//                                                       attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18)])
//
//        attributedText.append(NSAttributedString(string: "\n\n\nEarn your Bachelor's in Applied Computer Science in a community of makers empowered to shape the world.", attributes:
//            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
//             NSAttributedString.Key.foregroundColor: UIColor.gray]))
//
//        textView.attributedText = attributedText
//        textView.textAlignment = .center
//        textView.isEditable = false
//        textView.isScrollEnabled = false
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        return textView
//    }()
    
    // creates and styles the button to go backward
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    // creates and styles the button to go foward
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gloomyBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // creates and lays out the page controller
    let pageControll: UIPageControl = {
        let pageController = UIPageControl()
        pageController.currentPage = 0
        pageController.numberOfPages = 4
        pageController.currentPageIndicatorTintColor = .gloomyBlue
        pageController.pageIndicatorTintColor = .gray
        return pageController
    }()
}

