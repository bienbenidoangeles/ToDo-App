//
//  ToDoDataModel.swift
//  ToDo App
//
//  Created by Bienbenido Angeles on 1/6/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import Foundation

class ToDoObjList {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}

extension ToDoObjList{
    public class func defaultData() -> [ToDoObjList] {
        let ToDoList = [ToDoObjList(title: "My Day"), ToDoObjList(title: "Important"), ToDoObjList(title: "Planned"), ToDoObjList(title: "Tasks")]
        return ToDoList
    }
}

class ToDoObjTasks {
    var taskTitle: String
    var date: String
    var completed: Bool
    
    init(taskTitle: String, date: String?, desc: String?){
        self.taskTitle = taskTitle
        self.date = date ?? String.getISOTimestamp().convertISODate()
        self.completed = false
    }
}
