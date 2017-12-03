//
//  SetTimeVC.swift
//  LoseTheSnooze
//
//  Created by Vicki Lu on 11/11/17.
//  Copyright © 2017 Duke Catalyst. All rights reserved.
//

import UIKit

class SetTimeVC: UIViewController {

    @IBOutlet weak var timePickerTxt: UITextField!
    
    let picker = UIDatePicker()
   
    struct GlobalVariable{
        static var myString = String()
        static var myTime = Date()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTimePicker()
    }

    func createTimePicker(){
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button item (done button)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        timePickerTxt.inputAccessoryView = toolbar
        
        //assigning time picker to text field
        timePickerTxt.inputView = picker
        
        //format picker for time
        picker.datePickerMode = .time
    }

    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        let timeString = formatter.string(from: picker.date)

        timePickerTxt.text = "\(timeString)"
        GlobalVariable.myString = "\(timeString)"
        GlobalVariable.myTime = picker.date
        self.view.endEditing(true)
    }

}
