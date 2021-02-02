//
//  CollectionContainerTableViewCell.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import UIKit

import UIKit

public typealias UserData = Any

public protocol CollectionContainerActionDelegate: class {
    func cell(_ cell: CollectionContainerTableViewCell,
              collectionItemSelectedWithUserData userData: UserData?)
}

public class CollectionContainerTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    public var collectionDataSource: CollectionDataSource!
    public var collectionViewHeight: CGFloat? {
        didSet {
            if let collectionViewHeight = collectionViewHeight,
                let constraintCollectionViewHeight = collectionViewHeightConstraint,
                constraintCollectionViewHeight.constant != collectionViewHeight {
                constraintCollectionViewHeight.constant = collectionViewHeight
                setNeedsLayout()
            }
        }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        if let collectionViewHeight = collectionViewHeight {
            collectionViewHeightConstraint.constant = collectionViewHeight
        }
    }

    public func configure(items: [LightProduct],
                          actionDelegate: CollectionContainerActionDelegate? = nil) {
        collectionDataSource = CollectionDataSource(containerCell: self,
                                                    collectionView: collectionView,
                                                    items: items,
                                                    actionDelegate: actionDelegate)
        self.collectionView.delegate = collectionDataSource
        self.collectionView.dataSource = collectionDataSource
        self.collectionView.reloadData()
    }
}
