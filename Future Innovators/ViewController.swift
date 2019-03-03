//
//  ViewController.swift
//  Future Innovators
//
//  Created by Jay Mehta on 02/03/19.
//  Copyright © 2019 Jay Mehta. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let tapGesture = UITapGestureRecognizer()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let isLoggedIn = UserDefaults.standard.value(forKey: "isLoggedIn") as? Bool{
            if isLoggedIn{
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BookingViewController")
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: loginButton.backgroundColor]
        tapGesture.addTarget(self, action: #selector(closeKeyboards))
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func closeKeyboards(){
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

    @IBAction func loginButton(_ sender: Any) {
        let usersRef = Database.database().reference(withPath: "users")
        usersRef.observeSingleEvent(of: .value, with: { snapshot in
            for i in snapshot.children.allObjects{
                if (((i as! DataSnapshot).value as! NSDictionary)["email"]!) as! String == self.emailTextField.text!{
                    if (((i as! DataSnapshot).value as! NSDictionary)["password"]!) as! String == self.passwordTextField.text!{
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        UserDefaults.standard.set((i as! DataSnapshot).key as! String, forKey: "userID")
                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BookingViewController")
                        self.present(vc, animated: true, completion: nil)
                        return
                    }
                }
            }
            let alert = UIAlertController(title: "Login unsuccessful", message: "No user found with these credentials", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
}

