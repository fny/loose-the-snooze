//
//  ViewController.swift
//  LoseTheSnooze
//
//  Created by Faraz Yashar on 10/18/17.
//  Copyright © 2017 Duke Catalyst. All rights reserved.
//

import UIKit
var imagePicker: UIImagePickerController!

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBAction func takePhoto(sender: UIButton) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imagePicker.dismiss(animated: true, completion: nil)
      //  imagePicker.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        changeButtonColor(sender: (sender as! UIButton))
    }
    
    func changeButtonColor(sender: UIButton) {
        sender.backgroundColor = UIColor(red: 0.1, green: 0.3, blue: 0.7, alpha: 0.8)
    }
}

