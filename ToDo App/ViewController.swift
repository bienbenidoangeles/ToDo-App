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
    
    private var todoItems = [ToDoObj](){
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Things to do"
        delegatesAndDataSources()
        loadLongPress()
    }
    
    func delegatesAndDataSources(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func addToDoItemUI(_ sender: UIBarButtonItem){
        let alert = UIAlertController(title: "Create a new to do item", message: "Enter a title below", preferredStyle: .alert)

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
        let newIndex = todoItems.count

        todoItems.append(ToDoObj(title: title, date: nil, desc: nil))

        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)], with: .top)
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath)

        if indexPath.row < todoItems.count
        {
            let item = todoItems[indexPath.row]
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = "\(item.date) \(item.desc)"

            let accessory: UITableViewCell.AccessoryType = item.completed ? .checkmark : .none
            cell.accessoryType = accessory
        }

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ViewController: UITableViewDelegate{
    
    func loadLongPress(){
         let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
         tableView.addGestureRecognizer(longPressGesture)
     }
     
     @objc func longPress(sender: UILongPressGestureRecognizer) {

         if sender.state == UIGestureRecognizer.State.began {
             let touchPoint = sender.location(in: tableView)
             if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                 // your code here, get the row for the indexPath or do whatever you want
                if indexPath.row < todoItems.count
                {
                    let item = todoItems[indexPath.row]
                    item.completed = !item.completed

                    tableView.reloadRows(at: [indexPath], with: .automatic)
                }
             }
         }

     }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if indexPath.row < todoItems.count
        {
            todoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
}
