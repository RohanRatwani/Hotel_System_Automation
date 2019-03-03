//
//  SelectRoomCollectionViewCell.swift
//  Future Innovators
//
//  Created by Jay Mehta on 02/03/19.
//  Copyright © 2019 Jay Mehta. All rights reserved.
//

import UIKit

class SelectRoomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var facilityOne: UILabel!
    @IBOutlet weak var facilityTwo: UILabel!
    @IBOutlet weak var selectRoomButton: UIButton!
    @IBOutlet weak var roomImage: UIImageView!
    @IBOutlet weak var bgBorderView: UIView!
    
    var myId: Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectRoomButton.layer.cornerRadius = 3
        selectRoomButton.layer.masksToBounds = false
        selectRoomButton.layer.borderColor = selectRoomButton.titleLabel?.textColor.cgColor
        selectRoomButton.layer.borderWidth = 1
        
        bgBorderView.layer.cornerRadius = 3
        bgBorderView.layer.masksToBounds = false
        bgBorderView.layer.borderColor = UIColor.lightGray.cgColor
        bgBorderView.layer.borderWidth = 1
        // Initialization code
    }

}
