//
//  RoomControlViewController.swift
//  Future Innovators
//
//  Created by Jay Mehta on 03/03/19.
//  Copyright © 2019 Jay Mehta. All rights reserved.
//

import UIKit

class RoomControlViewController: UIViewController {

    @IBOutlet weak var doorLabel: UILabel!
    
    @IBOutlet weak var doorStatusLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    let baseURL = "http://192.168.43.179/setleds?"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: doorLabel.textColor]
        // Do any additional setup after loading the view.
    }

    @IBAction func doorSwitchChanged(_ sender: Any) {
        doorStatusLabel.text = !(sender as! UISwitch).isOn ? "Unlocked" : "Locked"
        let endURL = !(sender as! UISwitch).isOn ? "led1=ON" : "led1=OFF"
        let requestURL = NSURL(string: baseURL + endURL)
        let request = NSURLRequest(url: requestURL! as URL)
        webView.loadRequest(request as URLRequest)
    }
    
    @IBAction func lightsSwitchChanged(_ sender: Any) {
        let endURL = !(sender as! UISwitch).isOn ? "led2=ON" : "led2=OFF"
        let requestURL = NSURL(string: baseURL + endURL)
        let request = NSURLRequest(url: requestURL! as URL)
        webView.loadRequest(request as URLRequest)
    }
    
    @IBAction func acSwitchedChanged(_ sender: Any) {
        let endURL = !(sender as! UISwitch).isOn ? "led3=ON" : "led3=OFF"
        let requestURL = NSURL(string: baseURL + endURL)
        let request = NSURLRequest(url: requestURL! as URL)
        webView.loadRequest(request as URLRequest)
    }
    
    @IBAction func fanSwitchChanged(_ sender: Any) {
        let endURL = !(sender as! UISwitch).isOn ? "led4=ON" : "led4=OFF"
        let requestURL = NSURL(string: baseURL + endURL)
        let request = NSURLRequest(url: requestURL! as URL)
        webView.loadRequest(request as URLRequest)
    }
    
}
