//
//  SignUpViewController.swift
//  Future Innovators
//
//  Created by Jay Mehta on 02/03/19.
//  Copyright © 2019 Jay Mehta. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    let datePicker: UIDatePicker = UIDatePicker()
    let tapGesture = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: signupButton.backgroundColor]
        tapGesture.addTarget(self, action: #selector(closeKeyboards))
        view.addGestureRecognizer(tapGesture)
        
        datePicker.timeZone = NSTimeZone.local
        //datePicker.backgroundColor = UIColor.white
        datePicker.addTarget(self, action: #selector(self.datePickerValueChanged(_:)), for: .valueChanged)
        datePicker.datePickerMode = .date
        dateOfBirthTextField.inputView = datePicker
        
    }
    
    @objc func closeKeyboards(){
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        phoneNumber.resignFirstResponder()
        dateOfBirthTextField.resignFirstResponder()
        fullNameTextField.resignFirstResponder()
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        dateOfBirthTextField.text = selectedDate
    }
}
