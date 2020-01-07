//
//  ToDoDataModel.swift
//  ToDo App
//
//  Created by Bienbenido Angeles on 1/6/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import Foundation

class ToDoObj {
    var title: String
    var date: String
    var desc: String
    var completed: Bool
    
    init(title: String, date: String?, desc: String?) {
        self.title = title
        self.date = date ?? String.getISOTimestamp().convertISODate()
        self.desc = desc ?? ""
        self.completed = false
    }
}

extension ToDoObj{
    public class func mockData() -> [ToDoObj] {
        let ToDoList = [ToDoObj(title: "Pizza", date: nil, desc: nil), ToDoObj(title: "Derp", date: nil, desc: nil)]
        return ToDoList
    }
}
