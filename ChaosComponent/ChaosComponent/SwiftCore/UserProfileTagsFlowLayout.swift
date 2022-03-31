//
//  UserProfileTagsFlowLayout.swift
//  ChaosComponent
//
//  Created by 柴志勇 on 2022/3/31.
//

import UIKit

class UserProfileTagsFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
            guard let attributesForElementsInRect = super.layoutAttributesForElements(in: rect) else { return nil }
            guard var newAttributesForElementsInRect = NSArray(array: attributesForElementsInRect, copyItems: true) as? [UICollectionViewLayoutAttributes] else { return nil }
            
            var leftMargin: CGFloat = 0.0;
            
            for attributes in attributesForElementsInRect {
                if (attributes.frame.origin.x == self.sectionInset.left) {
                    leftMargin = self.sectionInset.left
                }
                else {
                    var newLeftAlignedFrame = attributes.frame
                    newLeftAlignedFrame.origin.x = leftMargin
                    attributes.frame = newLeftAlignedFrame
                }
                leftMargin += attributes.frame.size.width + 8 // Makes the space between cells
                newAttributesForElementsInRect.append(attributes)
            }
            
            return newAttributesForElementsInRect
        }
}
