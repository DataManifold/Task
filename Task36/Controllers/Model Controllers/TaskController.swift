//
//  TaskController.swift
//  Task36
//
//  Created by Shean Bjoralt on 9/16/20.
//  Copyright © 2020 Shean Bjoralt. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let shared = TaskController()
    
    //    var tasks: [Task] = []
    
    //    var mockTasks: [Task] {
    //
    //        let taskOne = Task(name: "Do laundry", isComplete: false)
    //        let taskTwo = Task(name: "Go to Store")
    //        let taskThree =  Task(name: "Make dinner", due: Date())
    //        return [taskOne, taskTwo, taskThree]
    //    }
    
    //MARK: - NSFetchedResultsController
    
    var fetchedResultsController: NSFetchedResultsController<Task>
    
    init() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        let resultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController = resultsController
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    //MARK: - CRUD Functions
    
    func addTaskWith(name: String, notes: String?, due: Date?) {
        _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    
    func updateTaskWith(task: Task, name: String, notes: String?, due: Date?) {
        _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    
    func removeTask(task: Task) {
        if let moc = task.managedObjectContext {
            moc.delete(task)
            saveToPersistentStore()
        }
    }
    
    //MARK: - Persistence
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK: - Helper Functions
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
    }
}


