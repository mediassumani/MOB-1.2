//
//  PersistenceLayer.swift
//  Habitual
//
//  Created by Medi Assumani on 12/14/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import Foundation

struct PersistenceLayer {

    private(set) var habits: [Habit] = []
    
    private static let userDefaultsHabitsKeyValue = "HABITS_ARRAY"
    
    init(){
    
        
        self.loadHabits()
    }
    
    private mutating func loadHabits() {
        
        let userDefaults = UserDefaults.standard
        
        guard
            let habitData = userDefaults.data(forKey: PersistenceLayer.userDefaultsHabitsKeyValue),
            let habits = try? JSONDecoder().decode([Habit].self, from: habitData) else {
                return
        }
        
        self.habits = habits
    }
    
    
    // create habit
    @discardableResult
    mutating func createNewHabit(name: String, image: Habit.Images) -> Habit {
        
        let newHabit = Habit(title: name, image: image)
        self.habits.insert(newHabit, at: 0) // Prepend the habits to the array
        self.saveHabits()
        
        return newHabit
    }
    
    // save habit
    private func saveHabits() {
      
        guard let habitsData = try? JSONEncoder().encode(self.habits) else {
            fatalError("could not encode list of habits")
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(habitsData, forKey: PersistenceLayer.userDefaultsHabitsKeyValue)
    }
    
    // delete habit
    mutating func delete(_ habitIndex: Int) {
        self.habits.remove(at: habitIndex)
        self.saveHabits()
    }
    
    // Mark Habit Complete
    
    // Line 1
    mutating func markHabitAsCompleted(_ habitIndex: Int) -> Habit {
        
        // Line 2
        var updatedHabit = self.habits[habitIndex]
        
        // Line 3
        guard updatedHabit.hasCompletedForToday == false else { return updatedHabit }
        
        // Line 4
        updatedHabit.numberOfCompletions += 1
        
        // Line 5
        if let lastCompletionDate = updatedHabit.lastCompletionDate, lastCompletionDate.isYesterday {
            updatedHabit.currentStreak += 1
        } else {
            updatedHabit.currentStreak = 1
        }
        
        // Line 6
        if updatedHabit.currentStreak > updatedHabit.bestStreak {
            updatedHabit.bestStreak = updatedHabit.currentStreak
        }
        
        // Line 7
        let now = Date()
        updatedHabit.lastCompletionDate = now
        
        // Line 8
        self.habits[habitIndex] = updatedHabit
        self.saveHabits()
        
        return updatedHabit
    }
    
    // Line 1
    mutating func swapHabits(habitIndex: Int, destinationIndex: Int) {
        let habitToSwap = self.habits[habitIndex]
        self.habits.remove(at: habitIndex)
        self.habits.insert(habitToSwap, at: destinationIndex)
        self.saveHabits()
    }
    
    // Line 2
    mutating func setNeedsToReloadHabits() {
        self.loadHabits()
    }
    
}
