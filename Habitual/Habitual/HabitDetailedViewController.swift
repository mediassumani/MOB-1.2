//
//  HabitDetailedViewController.swift
//  Habitual
//
//  Created by Medi Assumani on 12/15/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class HabitDetailedViewController: UIViewController {
    
    // MARK: - VARS
    
    var habit: Habit!
    var habitIndex: Int!
    private var persistance = PersistenceLayer()
    
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var labelCurrentStreak: UILabel!
    @IBOutlet weak var labelTotalCompletions: UILabel!
    
    @IBOutlet weak var labelBestStreak: UILabel!
    @IBOutlet weak var labelStartingDate: UILabel!
    @IBOutlet weak var buttonAction: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }


    @IBAction func pressActionButton(_ sender: Any) {
        
        // Line 1
        habit = persistance.markHabitAsCompleted(habitIndex)
        
        // Line 2
        updateUI()
    }
    

    
    private func updateUI() {
        // Group 1
        title = habit.title
        imageViewIcon.image = habit.selectedImage.image
        labelCurrentStreak.text = "\(habit.currentStreak) days"
        labelTotalCompletions.text = String(habit.numberOfCompletions)
        labelBestStreak.text = String(habit.bestStreak)
        labelStartingDate.text = habit.dateCreated.stringValue
        
        // Group 2
        if habit.hasCompletedForToday {
            buttonAction.setTitle("Completed for Today!", for: .normal)
        } else {
            buttonAction.setTitle("Mark as Completed", for: .normal)
        }
    }
    
}
