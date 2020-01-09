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
    var storedTasksAsList: [ToDoObjTasksAsList]?
    
    init(title: String, storedTasksAsList: [ToDoObjTasksAsList]? = nil) {
        self.listTitle = title
        self.storedTasksAsList = storedTasksAsList
    }
}

extension ToDoObjList{
    public class func defaultData() -> [ToDoObjList] {
        let toDoList = [ToDoObjList(title: "My Day"), ToDoObjList(title: "Important"), ToDoObjList(title: "Planned"), ToDoObjList(title: "Tasks")]
        return toDoList
    }
}

class ToDoObjTasksAsList {
    var taskTitle: String
    var date: String?
    var completed: Bool
    var favorited: Bool
    var storedToDoObjTaskData: ToDoObjTaskData?
    
    init(taskTitle: String, date: String? = nil, completed: Bool, favorited: Bool, storedToDoObjTaskData: ToDoObjTaskData? = nil){
        
        self.taskTitle = taskTitle
        self.date = date ?? String.getISOTimestamp().convertISODate()
        self.completed = false
        self.favorited = false
        self.storedToDoObjTaskData = storedToDoObjTaskData
    }
}

class ToDoObjTaskData {
    var toDoObjTasksAsListPreExtended: ToDoObjTasksAsList
    var addedToMyDay: Bool
    var remindMe: String?
    var rEpeat: String?
    var file: String?
    var note: String?
    
    init(addedToMyDay: Bool, remindMe: String? = nil, toDoObjTasksAsList: ToDoObjTasksAsList, rEpeat: String? = nil, file: String? = nil, note: String? = nil){
        
        self.toDoObjTasksAsListPreExtended = toDoObjTasksAsList
        self.addedToMyDay = addedToMyDay
        self.remindMe = remindMe
        self.rEpeat = rEpeat
        self.file = file
        self.note = note
    }
    
}
