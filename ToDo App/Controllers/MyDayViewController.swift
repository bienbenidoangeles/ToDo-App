//
//  MyDayViewController.swift
//  ToDo App
//
//  Created by Bienbenido Angeles on 1/9/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit

class MyDayViewController: UIViewController {
    
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var dailyImageView: UIImageView!
    
    var passedObjFrmTaskList: ToDoObjList?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addEvent(_ sender: UIButton){
        
    }

}
