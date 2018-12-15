//
//  AddHabitViewController.swift
//  Habitual
//
//  Created by Medi Assumani on 12/15/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class AddHabitViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let habitImages = Habit.Images.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        collectionView.allowsMultipleSelection = false
        
        collectionView.register(HabitImageCollectionViewCell.nib, forCellWithReuseIdentifier: HabitImageCollectionViewCell.identifier)
    }


    @IBAction func pickPhotoButtonPressed(_ sender: Any) {
        
        guard let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first else {return}
        let confirmHabitVC = ConfirmHabitViewController.instantiate()
        confirmHabitVC.habitImage = habitImages[selectedIndexPath.row]
        navigationController?.pushViewController(confirmHabitVC, animated: true)
    }
    
    @objc func cancelAddHabit(_ sender: UIBarButtonItem) {
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    func setupNavBar() {
        title = "Select Image"
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAddHabit(_:)))
        navigationItem.leftBarButtonItem = cancelButton
        
    }
    
}
