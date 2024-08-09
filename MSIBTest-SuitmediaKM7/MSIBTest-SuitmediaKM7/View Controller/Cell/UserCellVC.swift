//
//  UserCellVC.swift
//  MSIBTest-SuitmediaKM7
//
//  Created by rifqi triginandri on 09/08/24.
//

import Foundation
import UIKit

class UserCellVC: UITableViewCell{
    
    @IBOutlet weak var label_username: UILabel!
    @IBOutlet weak var label_email: UILabel!
        
    @IBOutlet weak var image_avatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        image_avatar.layer.cornerRadius = image_avatar.frame.size.width / 2
        image_avatar.clipsToBounds = true
    }
}
