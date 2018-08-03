//
//  TakePhoto1ViewController.swift
//  Final Project
//
//  Created by Spence on 8/1/18.
//  Copyright © 2018 Tenzin Bhuti. All rights reserved.
//

import UIKit
var imageCounter = 0

class TakePhoto1ViewController: UIViewController, UINavigationControllerDelegate,
    UIImagePickerControllerDelegate{

    
    @IBOutlet weak var FirstImage1: UIImageView!
    
    @IBAction func takePhoto1(_ sender: Any) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }

    
    @IBAction func savePhoto1(_ sender: Any) {
        saveImage(imageName:"test\(imageCounter).png")
imageCounter += 1
        print (imageCounter)
    }
    
    var imagePickerController: UIImagePickerController!
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)
        FirstImage1.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    func saveImage(imageName:String) {
        
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,
                                                             true)[0] as NSString).appendingPathComponent(imageName)
        
        let image = FirstImage1.image!
        let imageData = UIImagePNGRepresentation(image)
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
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
