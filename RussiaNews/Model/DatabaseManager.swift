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
    static let shared = DatabaseManager()
    
    let newsRef = databaseReferace.child("news")
    
    func appendNews(newsId id: String) {
        newsRef.setValue([id:["count":0]])
    }
    
    func getNumberViewrs(newsId id: String, complition: @escaping (Int)->()) {
        var count = 0
        newsRef.child(id).observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as! NSDictionary
            count = value["count"] as! Int
            complition(count)
        }
    }
    
    func updateNumberViewers(newsId id: String, count: Int) {
        newsRef.child(id).updateChildValues(["count":count])
    }
}
