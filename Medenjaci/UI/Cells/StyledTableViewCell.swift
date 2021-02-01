//
//  SubtitleStyleTableViewCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 31/01/2021.
//

import UIKit

public class StyledTableViewCell: UITableViewCell {

    public override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = Assets.Colors.styledCellBackgroundColor.color
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 2, left: 15, bottom: 2 , right: 15))
    }

}
