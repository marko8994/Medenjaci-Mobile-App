//
//  SingleButtonCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 01/02/2021.
//

import UIKit

class SingleButtonCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    
    var buttonAction: (() -> Void)?
    
    var buttonTitle: String? {
        didSet {
            button.setTitle(buttonTitle?.uppercased(), for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    }

    @objc private func buttonTap() {
        buttonAction?()
    }

}
