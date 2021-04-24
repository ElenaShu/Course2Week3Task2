//
//  CustomFlowLayout.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewLayout {
    private let numbersOfColumns = 2
    private let cellPadding: CGFloat = 8
    
    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    private var contentHeight: CGFloat = 0
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard cache.isEmpty == true, let collectionView = collectionView else {
            return
        }
        
        let photoWidth = contentWidth / CGFloat (numbersOfColumns)
        
        let xOffset: [CGFloat] = [CGFloat(0), CGFloat( photoWidth )]
        var yOffset = [CGFloat](repeating: CGFloat(0), count: numbersOfColumns)
        
        var column = 0
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let photoHeight = CGFloat(indexPath.item == 0 ? 300 : 200)
            let height = photoHeight + cellPadding * 2
            
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: photoWidth, height: height).insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cache.append(attributes)
            yOffset[column] += height
            column = yOffset[0] < yOffset [1] ? 0 : 1
            contentHeight = yOffset.max()!
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect)
        -> [UICollectionViewLayoutAttributes]? {
            var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
            for attributes in cache {
                if attributes.frame.intersects(rect) {
                    visibleLayoutAttributes.append(attributes)
                }
            }
            return visibleLayoutAttributes
    }

    override func layoutAttributesForItem(at indexPath: IndexPath)
        -> UICollectionViewLayoutAttributes? {
            return cache[indexPath.item]
    }
}
