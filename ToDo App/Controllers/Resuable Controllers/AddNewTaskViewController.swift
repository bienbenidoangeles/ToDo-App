//
//  AddNewTaskViewController.swift
//  ToDo App
//
//  Created by Bienbenido Angeles on 1/9/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit

class AddNewTaskViewController: UIViewController {
    
    @IBOutlet weak var completedImageView: UIImageView!
    @IBOutlet weak var addTaskTextField: UITextField!
    @IBOutlet weak var enterTaskButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func enterTaskButtonClicked(_ sender: UIButton){
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
