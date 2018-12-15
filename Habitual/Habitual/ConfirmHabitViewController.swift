//
//  ConfirmHabitViewController.swift
//  Habitual
//
//  Created by Medi Assumani on 12/15/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class ConfirmHabitViewController: UIViewController {

    @IBOutlet weak var habitImageView: UIImageView!
    @IBOutlet weak var habitNameInputField: UITextField!
    var habitImage: Habit.Images!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }


    
    @IBAction func createHabitButtonPressed(_ sender: Any) {
        
        var persistenceLayer = PersistenceLayer()
        guard let habitText = habitNameInputField.text else { return }
        persistenceLayer.createNewHabit(name: habitText, image: habitImage)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    private func updateUI() {
        title = "New Habit"
        habitImageView.image = habitImage.image
    }
}
