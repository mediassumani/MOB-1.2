//
//  HabitsTableViewController.swift
//  Habitual
//
//  Created by Medi Assumani on 12/4/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class HabitsTableViewController: UITableViewController {

    
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    func setupNavBar() {
        title = "Habitual"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func pressAddHabit(_ sender: UIBarButtonItem) {
//        habits.insert("Hello, World!", at: 0)
//        let topIndexPath = IndexPath(row: 0, section: 0)
//        tableView.insertRows(at: [topIndexPath], with: .automatic)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return habits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        var currentHabit = habits[indexPath.row]
        
        cell.textLabel?.text = currentHabit.title
        
        return cell
    }

}
