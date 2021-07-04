//
//  BasicCollectionCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import UIKit

class BasicCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var subviewsContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    public var userData: UserData?

    public func configure(with product: LightProduct) {
        userData = product.uid
        titleLabel.text = product.name
        subtitleLabel.text = String(product.price) + "$"
        imageView.image = UIImage(named: product.imageName)
        setNeedsLayout()
        layoutIfNeeded()
    }

    private func setLayout() {
        subviewsContainer.layer.borderWidth = 2
        subviewsContainer.layer.borderColor = Assets.Colors.cellBorderColor.color.cgColor
        subviewsContainer.layer.cornerRadius = 10
        subviewsContainer.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
}
