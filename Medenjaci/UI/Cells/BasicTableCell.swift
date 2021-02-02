//
//  BasicTableCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 01/02/2021.
//

import UIKit

class BasicTableCell: StyledTableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    var textContent: String? {
        didSet {
            label.text = textContent
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
