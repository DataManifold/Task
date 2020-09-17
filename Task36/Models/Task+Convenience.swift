//
//  Task+Convenience.swift
//  Task36
//
//  Created by Shean Bjoralt on 9/16/20.
//  Copyright © 2020 Shean Bjoralt. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    convenience init(name: String, notes: String? = nil, isComplete: Bool = false, due: Date? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.name = name
        self.notes = notes
        self.isComplete = isComplete
        self.due = due
    }
}
