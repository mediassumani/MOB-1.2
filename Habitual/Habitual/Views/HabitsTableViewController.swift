//
//  HabitsTableViewController.swift
//  Habitual
//
//  Created by Medi Assumani on 12/4/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {

    private var persistance = PersistenceLayer()
    var habits: [Habit] = [
        Habit(title: "Go to bed before 10p", image: Habit.Images.book),
        Habit(title: "Drink 8 Glasses of Water", image: Habit.Images.book),
        Habit(title: "Commit Today", image: Habit.Images.book),
        Habit(title: "Stand up every Hour", image: Habit.Images.book)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.reloadData()
        setupNavBar()
        tableView.register(HabitTableViewCell.nib, forCellReuseIdentifier: HabitTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        persistance.setNeedsToReloadHabits()
        tableView.reloadData()
    }
    
    
    func setupNavBar() {
        title = "Habitual"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        navigationItem.rightBarButtonItem = addButton
    }
    

    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
        let addHabitVc = AddHabitViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: addHabitVc)
        present(navigationController, animated: true, completion: nil)
        
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return persistance.habits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HabitTableViewCell.identifier, for: indexPath) as! HabitTableViewCell
        let habit = persistance.habits[indexPath.row]
        
        cell.configure(Habit)
        
        return cell
    }

}
