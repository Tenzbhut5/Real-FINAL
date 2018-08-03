//
//  InputViewController.swift
//  Final Project
//
//  Created by Spence on 7/30/18.
//  Copyright © 2018 Tenzin Bhuti. All rights reserved.
//

import UIKit

import CoreData

class InputViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func add(_ sender: Any) {
        
        if (textField.text != "") {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let newTask = Task(context: context)
            newTask.taskName = textField?.text
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            
            textField.resignFirstResponder()
            textField.text = ""
            
            
        }
            
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
