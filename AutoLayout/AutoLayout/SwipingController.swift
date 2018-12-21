//
//  SwipingController.swift
//  AutoLayout
//
//  Created by Medi Assumani on 11/3/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let pages = [
        Page(imageName: "old_logo2", headerText: "College designed for the 21st Century", description: "Earn your Bachelor's in Applied Computer Science immersed in a community of makers empowered to shape the world"),
        Page(imageName: "student_showcasing_app", headerText: "Learn software development by building.", description: "You'll primarily learn by doing, applying your coursework to building software products that solve real world problems."),
        Page(imageName: "Make_School_Demo_Night", headerText: "Our diverse community empowers leaders and makers", description: "Students attending Make School are poised to be Silicon Valley's next generation of leaders and thinkers."),
        Page(imageName: "student_at_event", headerText: "We aim to instill the maker mentality in our students", description: "We crafted our education around modern research backed pedagogy, blending broad based and computing education")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        setUpButtonControls()
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        
        let x = targetContentOffset.pointee.x
        pageControll.currentPage = Int(x / view.frame.width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCell
        let page = pages[indexPath.row]
        cell.page = page
        
        return cell
    }
    
    // creates and styles the button to go backward
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrevSwipe), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // creates and styles the button to go foward
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gloomyBlue, for: .normal)
        button.addTarget(self, action: #selector(handleNextSwipe), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // creates and lays out the page controller
    lazy var pageControll: UIPageControl = {
        let pageController = UIPageControl()
        pageController.currentPage = 0
        pageController.numberOfPages = pages.count
        pageController.currentPageIndicatorTintColor = .gloomyBlue
        pageController.pageIndicatorTintColor = .gray
        return pageController
    }()
    
    
    @objc private func handleNextSwipe(){
        
        let nextIndex = min(pageControll.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControll.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    @objc private func handlePrevSwipe(){
        
        let nextIndex = min(pageControll.currentPage - 1, pages.count + 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControll.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    /// Function to layout up the next and previous button
    private func setUpButtonControls(){
        
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControll, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.axis = .horizontal
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return  0
    }
}

