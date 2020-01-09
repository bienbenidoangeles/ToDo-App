//
//  ToDoDataModel.swift
//  ToDo App
//
//  Created by Bienbenido Angeles on 1/6/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import Foundation

class ToDoObjList {
    var listTitle: String
    
    init(title: String) {
        self.listTitle = title
    }
}

extension ToDoObjList{
    public class func defaultData() -> [ToDoObjList] {
        let ToDoList = [ToDoObjList(title: "My Day"), ToDoObjList(title: "Important"), ToDoObjList(title: "Planned"), ToDoObjList(title: "Tasks")]
        return ToDoList
    }
}

class ToDoObjTasksAsList {
    var taskTitle: String
    var date: String?
    var completed: Bool
    var favorited: Bool
    
    init(taskTitle: String, date: String? = nil, completed: Bool, favorited: Bool){
        
        self.taskTitle = taskTitle
        self.date = date ?? String.getISOTimestamp().convertISODate()
        self.completed = false
        self.favorited = false
    }
}

class ToDoObjTaskData {
    var completed: Bool
    var taskTitle: String
    var favorited: Bool
    var addedToMyDay: Bool
    var remindMe: Date?
    var dueDate: String?
    var rEpeat: String?
    var file: String?
    var note: String?
    
    init(completed: Bool, taskTitle: String, favorited: Bool, addedToMyDay: Bool, remindMe: Date? = nil, dueDate: String? = nil, rEpeat: String? = nil, file: String? = nil, note: String? = nil){
        
        self.completed = completed
        self.taskTitle = taskTitle
        self.favorited = favorited
        self.addedToMyDay = addedToMyDay
        self.remindMe = remindMe
        self.dueDate = dueDate
        self.rEpeat = rEpeat
        self.file = file
        self.note = note
    }
    
}
