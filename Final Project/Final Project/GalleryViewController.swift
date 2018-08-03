//
//  GalleryViewController.swift
//  Final Project
//
//  Created by Spence on 8/1/18.
//  Copyright © 2018 Tenzin Bhuti. All rights reserved.
//

import UIKit
var countImage = 0
class GalleryViewController: UIViewController {
    @IBOutlet weak var SecondImage: UIImageView!
    
   
    @IBAction func Change(_ sender: Any) {
        countImage += 1
        getImage(imageName: "test\(countImage).png")
        
        
    }
    
    @IBAction func previousImage(_ sender: Any) {
        countImage -= 1
        getImage(imageName: "test\(countImage).png")
    }
    func getImage(imageName:String) {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true)[0] as NSString).appendingPathComponent(imageName)
        if fileManager.fileExists(atPath: imagePath)
        { //SecondImage.image = UIImage(contentsOfFile: imagePath)
            let image = UIImage(contentsOfFile: imagePath)
            let newImage = UIImage(cgImage: (image?.cgImage!)!, scale: (image?.scale)!, orientation: .right)
            SecondImage.image = newImage
        } else {
            print("Oh no! No Image!")
        }
    }
    
    

    override func viewDidLoad() {
        getImage(imageName: "test\(countImage).png")
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
