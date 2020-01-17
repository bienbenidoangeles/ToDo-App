//
//  ViewController.swift
//  ToDo App
//
//  Created by Bienbenido Angeles on 1/6/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addedListToTableView: UITableView!
    
    var rowSelect:Int = 0
    
    private var toDoItems = ToDoObjList.defaultData()
    private var toDoItemsFromOtherLists = [ToDoObjList]()
//    {
//        didSet{
//            tableView.reloadData()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Things to do"
        delegatesAndDataSources()
        shouldTableViewHide()
        //loadLongPress()
    }
    
    func delegatesAndDataSources(){
        tableView.dataSource = self
        tableView.delegate = self
        addedListToTableView.dataSource = self
        addedListToTableView.delegate = self
    }
    
    @IBAction func addToDoItemUI(_ sender: UIButton){
        let alert = UIAlertController(title: "Create a new to do list", message: "Enter a title below", preferredStyle: .alert)

        alert.addTextField(configurationHandler: nil)

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (_) in
            if let title = alert.textFields?[0].text
            {
                self.addToDoItemData(title: title)
            }
        }))

        self.present(alert, animated: true, completion: nil)
    }
    
    private func addToDoItemData(title: String)
    {
        let newIndex = toDoItemsFromOtherLists.count

        toDoItemsFromOtherLists.append(ToDoObjList(title: title))

        addedListToTableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
    }
    
    private func shouldTableViewHide(){
        if toDoItemsFromOtherLists.count > 0{
            addedListToTableView.isHidden = false
        } else {
            addedListToTableView.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MyDay" && rowSelect == 0{
            guard let detailVC = segue.destination as? MyDayViewController else {
                fatalError("faliled to downcast to MyDayViewController")
            }
            
            let selectedTaskList = toDoItems[rowSelect]
            
            detailVC.passedObjFrmTaskList = selectedTaskList
            
            
        } else if segue.identifier == "MyList" && rowSelect > 0{
            guard let detailVC = segue.destination as? DetailTaskListViewController else {
                fatalError("failed to downcast to DetailTaskListController")
            }
        }
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableView{
            let myDayCell = tableView.dequeueReusableCell(withIdentifier: "myDayCell", for: indexPath)
            let importantCell = tableView.dequeueReusableCell(withIdentifier: "importantCell", for: indexPath)
            let plannedCell = tableView.dequeueReusableCell(withIdentifier: "plannedCell", for: indexPath)
            let tasksCell = tableView.dequeueReusableCell(withIdentifier: "tasksCell", for: indexPath)
            let defaultCells = [myDayCell, importantCell, plannedCell, tasksCell]
            for (index, cell) in defaultCells.enumerated(){
                let item = toDoItems[index]
                cell.textLabel?.text = item.listTitle
            }
            
        } else if tableView == addedListToTableView{
            let otherListCell = tableView.dequeueReusableCell(withIdentifier: "newListCell", for: indexPath)
        }
        
       
        
        
        if indexPath.row < todoItemsFromOtherLists.count
        {
            
//            let item = toDoItems[indexPath.row]
//            listCell.textLabel?.text = item.listTitle
            

//            let accessory: UITableViewCell.AccessoryType = item.completed ? .checkmark : .none
//            cell.accessoryType = accessory
        }

        return listCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ViewController: UITableViewDelegate{
    
//    func loadLongPress(){
//         let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
//         tableView.addGestureRecognizer(longPressGesture)
//     }
//
//     @objc func longPress(sender: UILongPressGestureRecognizer) {
//
//         if sender.state == UIGestureRecognizer.State.began {
//             let touchPoint = sender.location(in: tableView)
//             if let indexPath = tableView.indexPathForRow(at: touchPoint) {
//                 // your code here, get the row for the indexPath or do whatever you want
//                if indexPath.row < todoItems.count
//                {
//                    let item = todoItems[indexPath.row]
//                    item.completed = !item.completed
//
//                    tableView.reloadRows(at: [indexPath], with: .automatic)
//                }
//             }
//         }
//
//     }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if indexPath.row < todoItems.count
//        {
//            todoItems.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .top)
//        }
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = self.tableView.indexPathForSelectedRow
        rowSelect = indexPath!.row
    }
}

