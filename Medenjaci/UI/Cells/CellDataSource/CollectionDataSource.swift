//
//  CollectionDataSource.swift
//  Medenjaci
//
//  Created by Marko Mladenovic on 30/01/2021.
//

import Foundation
import UIKit

public class CollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    private weak var containerCell: CollectionContainerTableCell?
    private weak var collectionView: UICollectionView!
    private var items: [LightProduct]
    public weak var actionDelegate: CollectionContainerActionDelegate?

    init(containerCell: CollectionContainerTableCell,
         collectionView: UICollectionView,
         items: [LightProduct],
         actionDelegate: CollectionContainerActionDelegate? = nil) {
        self.containerCell = containerCell
        self.collectionView = collectionView
        self.items = items
        self.actionDelegate = actionDelegate
    }

    // MARK: UICollectionViewDataSource methods

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            let reuseIdentifier = "basicCollectionCell"
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                             for: indexPath) as? BasicCollectionCell {
                let item = items[indexPath.row]
                cell.configure(with: item)
                return cell
            }
            fatalError("No cell with reuse identifier: \(reuseIdentifier) for row: \(indexPath.row)")
    }

    // MARK: UICollectionViewDelegate methods

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        if let containerCell = containerCell {
            actionDelegate?.cell(containerCell, collectionItemSelectedWithUserData: item.uid)
        }
    }

}
