//
//  SelectRoomViewController.swift
//  Future Innovators
//
//  Created by Jay Mehta on 02/03/19.
//  Copyright © 2019 Jay Mehta. All rights reserved.
//

import UIKit

class SelectRoomViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        return cell
    }

}
