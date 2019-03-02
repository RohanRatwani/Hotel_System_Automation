//
//  BookingViewController.swift
//  Future Innovators
//
//  Created by Jay Mehta on 02/03/19.
//  Copyright © 2019 Jay Mehta. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {
    
    @IBOutlet weak var checkInTextField: UITextField!
    @IBOutlet weak var checkOutTextField: UITextField!
    @IBOutlet weak var checkInTextFieldBottomViewLabel: UILabel!
    @IBOutlet weak var numberOfRoomsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfChildrensLabel: UILabel!
    @IBOutlet weak var numberOfRoomsStepper: UIStepper!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrensStepper: UIStepper!
    
    let checkInDatePicker: UIDatePicker = UIDatePicker()
    let checkOutDatePicker: UIDatePicker = UIDatePicker()
    
    let tapGesture = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: checkInTextFieldBottomViewLabel.backgroundColor]
        tapGesture.addTarget(self, action: #selector(closeKeyboards))
        view.addGestureRecognizer(tapGesture)
        
        checkInDatePicker.timeZone = NSTimeZone.local
        checkInDatePicker.addTarget(self, action: #selector(self.checkInDatePickerValueChanged(_:)), for: .valueChanged)
        checkInDatePicker.datePickerMode = .dateAndTime
        
        checkOutDatePicker.timeZone = NSTimeZone.local
        checkOutDatePicker.addTarget(self, action: #selector(self.checkOutDatePickerValueChanged(_:)), for: .valueChanged)
        checkOutDatePicker.datePickerMode = .dateAndTime
        
        checkInTextField.inputView = checkInDatePicker
        checkOutTextField.inputView = checkOutDatePicker
        
//        stepper.wraps = true
//        stepper.autorepeat = true
//        stepper.maximumValue = 10
        
        numberOfRoomsStepper.minimumValue = 0
        numberOfAdultsStepper.minimumValue = 0
        numberOfChildrensStepper.minimumValue = 0
    }
    
    @objc func closeKeyboards(){
        checkInTextField.resignFirstResponder()
        checkOutTextField.resignFirstResponder()
    }
    
    @objc func checkInDatePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm"
        
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        checkInTextField.text = selectedDate
    }
    
    @objc func checkOutDatePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm"
        
        // Apply date format
        let selectedDate: String = dateFormatter.string(from: sender.date)
        checkOutTextField.text = selectedDate
    }

    @IBAction func numberOfRoomsStepperClicked(_ sender: UIStepper) {
        numberOfRoomsLabel.text = Int(sender.value).description
    }
    
    @IBAction func numberOfAdultsStepperClicked(_ sender: UIStepper) {
        numberOfAdultsLabel.text = Int(sender.value).description
    }
    
    @IBAction func numberOfChildrensStepperClicked(_ sender: UIStepper) {
        numberOfChildrensLabel.text = Int(sender.value).description
    }
    
    @IBAction func selectRoomButtonClicked(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SelectRoomViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
