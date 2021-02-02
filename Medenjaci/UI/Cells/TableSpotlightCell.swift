//
//  TableSpotlightCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 01/02/2021.
//

import UIKit

class TableSpotlightCell: UITableViewCell {

    @IBOutlet weak var spotlightImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with imageName: String) {
        spotlightImage?.image = UIImage(named: imageName)
    }

}
