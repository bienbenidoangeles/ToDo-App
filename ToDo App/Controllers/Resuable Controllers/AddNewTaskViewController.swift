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
    
    let accessory: UIView = {
        let maxWidth = UIScreen.main.bounds.width
        let maxHeight = UIScreen.main.bounds.height
        let accessoryViewHeight = maxHeight * 0.2
        
        let accessoryView = UIView(frame: CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: maxWidth, height: accessoryViewHeight))
        
        accessoryView.backgroundColor = .lightGray
        accessoryView.alpha = 0.6
        return accessoryView
    }()
    
    let enterButton: UIButton = {
        let enterButton = UIButton(type: UIButton.ButtonType.custom)
        enterButton.setImage(UIImage(systemName: "arrow.up.square.fill"), for: .normal)
        enterButton.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
        enterButton.isEnabled = true
        return enterButton
    }()
    
    let setDueDateButton: UIButton = {
        let setDueDateButton = UIButton(type: UIButton.ButtonType.custom)
        setDueDateButton.setImage(UIImage(systemName: "calendar"), for: .normal)
        setDueDateButton.setTitle("Set due date", for: .normal)
        setDueDateButton.addTarget(self, action: #selector(setDueDateButtonPressed), for: .touchUpInside)
        setDueDateButton.isEnabled = true
        return setDueDateButton
    }()
    
    let remindMeButton: UIButton = {
        let remindMeButton = UIButton(type: UIButton.ButtonType.custom)
        remindMeButton.setImage(UIImage(systemName: "alarm"), for: .normal)
        remindMeButton.setTitle("Remind Me", for: .normal)
        remindMeButton.addTarget(self, action: #selector(remindMeButtonPressed), for: .touchUpInside)
        remindMeButton.isEnabled = true
        return remindMeButton
    }()
    
    
    
    @objc
    func enterButtonPressed(){
        
    }
    
    @objc
    func setDueDateButtonPressed(){
        
    }
    
    @objc
    func remindMeButtonPressed(){
        
    }
}
