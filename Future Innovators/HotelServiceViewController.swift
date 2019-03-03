//
//  HotelServiceViewController.swift
//  Future Innovators
//
//  Created by Jay Mehta on 03/03/19.
//  Copyright © 2019 Jay Mehta. All rights reserved.
//

import UIKit

class HotelServiceViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var laundryPendingCall: UILabel!
    @IBOutlet weak var pendingLaundryButton: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var setWakupCallButton: UIButton!
    @IBOutlet weak var laundryServiceButton: UIButton!
    @IBOutlet weak var requestServiceButton: UIButton!
    @IBOutlet weak var pendingLabel: UILabel!
    
    let baseURL = "http://192.168.43.179/setleds?"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestServiceButton.layer.cornerRadius = 3
        requestServiceButton.layer.masksToBounds = false
        requestServiceButton.layer.borderColor = requestServiceButton.titleLabel?.textColor.cgColor
        requestServiceButton.layer.borderWidth = 1
        
        laundryServiceButton.layer.cornerRadius = 3
        laundryServiceButton.layer.masksToBounds = false
        laundryServiceButton.layer.borderColor = requestServiceButton.titleLabel?.textColor.cgColor
        laundryServiceButton.layer.borderWidth = 1
        
        setWakupCallButton.layer.cornerRadius = 3
        setWakupCallButton.layer.masksToBounds = false
        setWakupCallButton.layer.borderColor = requestServiceButton.titleLabel?.textColor.cgColor
        setWakupCallButton.layer.borderWidth = 1
        
        callButton.layer.cornerRadius = 3
        callButton.layer.masksToBounds = false
        callButton.layer.borderColor = requestServiceButton.titleLabel?.textColor.cgColor
        callButton.layer.borderWidth = 1
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: requestServiceButton.titleLabel?.textColor]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func roomCleaningRequest(_ sender: UIButton) {
        pendingLabel.text = (sender.titleLabel?.text == "REQUEST") ? "pending" : ""
        let state = (sender.titleLabel?.text == "REQUEST") ? "OFF" : "ON"
        sender.setTitle((sender.titleLabel?.text == "REQUEST") ? "CANCEL" : "REQUEST", for: .normal)
        performLightTask(LED: "1", state: state)
    }
    
    @IBAction func laundryServiceRequest(_ sender: UIButton) {
        pendingLaundryButton.text = (sender.titleLabel?.text == "REQUEST") ? "pending" : ""
        let state = (sender.titleLabel?.text == "REQUEST") ? "OFF" : "ON"
        sender.setTitle((sender.titleLabel?.text == "REQUEST") ? "CANCEL" : "REQUEST", for: .normal)
        performLightTask(LED: "2", state: state)
    }
    
    @IBAction func setWakeUpCallRequest(_ sender: UIButton) {
        laundryPendingCall.text = (sender.titleLabel?.text == "REQUEST") ? "pending" : ""
        let state = (sender.titleLabel?.text == "REQUEST") ? "OFF" : "ON"
        sender.setTitle((sender.titleLabel?.text == "REQUEST") ? "CANCEL" : "REQUEST", for: .normal)
        performLightTask(LED: "3", state: state)
    }
    
    @IBAction func callPressed(_ sender: Any) {
        guard let number = URL(string: "tel://09724999243") else { return }
        UIApplication.shared.openURL(number)
    }
    
    func performLightTask(LED: String,state: String){
        let endURL = "led\(LED)=\(state)"
        let requestURL = NSURL(string: baseURL + endURL)
        let request = NSURLRequest(url: requestURL! as URL)
        webView.loadRequest(request as URLRequest)
    }
    
    @IBAction func logout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
    }
    
    
    
}
