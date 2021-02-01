//
//  SingleButtonCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 01/02/2021.
//

import UIKit

class SingleButtonCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configureForOrder() {
        button.setTitle(Strings.Common.order.uppercased(), for: .normal)
    }

}
