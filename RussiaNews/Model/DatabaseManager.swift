//
//  DatabaseManager.swift
//  RussiaNews
//
//  Created by Astemir Shibzuhov on 31.01.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation
import Firebase


let databaseReferace = Database.database().reference()

class DatabaseManager {
    let shared = DatabaseManager()
    
    let newsRef = databaseReferace.child("news")
}
