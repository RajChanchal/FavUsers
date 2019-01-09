//
//  UserTableViewCell.swift
//  FavUsers
//
//  Created by Chanchal Raj on 09/01/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {
    //MARK:- IBOutlets
    @IBOutlet private weak var imgUserProfile: UIImageView!
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var lblEmail: UILabel!
    
    //MARK:- Non-UI Instance Variables
    var viewModel:UserTableViewCellModel?{
        didSet{
            lblName.text = viewModel?.userName
            lblEmail.text = viewModel?.userEmail
            if let url = viewModel?.thumbnailPhoto,let placeHolderImage = UIImage.init(named: "profilePicPlaceholder"){
                imgUserProfile.kf.setImage(with: url, placeholder: placeHolderImage, options: nil, progressBlock: nil, completionHandler: nil)
            }
            
        }
    }

}
