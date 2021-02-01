//
//  PersonalInfoButtonsTableViewCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 31/01/2021.
//

import UIKit

class DoubleButtonCell: UITableViewCell {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configureForPersonalInfo() {
        firstButton.setTitle(Strings.Title.changePersonalInfo.uppercased(), for: .normal)
        secondButton.setTitle(Strings.Title.changePassword.uppercased(), for: .normal)
    }
    
}
