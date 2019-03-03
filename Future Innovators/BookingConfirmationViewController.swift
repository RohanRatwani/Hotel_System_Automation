//
//  BookingConfirmationViewController.swift
//  Future Innovators
//
//  Created by Jay Mehta on 03/03/19.
//  Copyright © 2019 Jay Mehta. All rights reserved.
//

import UIKit

class BookingConfirmationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func okButtonPressed(_ sender: Any) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 4], animated: true)
    }
    
}
