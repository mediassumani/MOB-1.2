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
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cell")
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
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return  0
    }

}

