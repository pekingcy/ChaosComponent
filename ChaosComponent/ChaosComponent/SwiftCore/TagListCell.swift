//
//  TagListCell.swift
//  ChaosComponent
//
//  Created by 柴志勇 on 2022/3/31.
//

import UIKit

class TagListCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
        var tagListCollection: UICollectionView
        var data: [String] = []
        
        fileprivate func setCollectioView() {
            self.setupCollectionnViewLayout()
            
            self.tagListCollection.register(UINib(nibName: "TagListNameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagListNameCollectionViewCell")
            tagListCollection.delegate = self
            tagListCollection.dataSource = self
            
        }
        
        private func setupCollectionnViewLayout() {
            let layout = UserProfileTagsFlowLayout()
            //layout.estimatedItemSize = CGSize.init(width: 50, height: 50)
            layout.scrollDirection = .vertical
            tagListCollection.collectionViewLayout = layout
        }
        
        // MARK: UIView functions
        override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
            
            self.tagListCollection.layoutIfNeeded()
            let size = tagListCollection.collectionViewLayout.collectionViewContentSize
            let newSize = CGSize(width: size.width, height: size.height + 1)
            debugPrint("New Size : \(newSize)")
            return newSize
        }
        
        func setData(data: [String]) {
            self.setCollectioView()
            self.data = data
        }
}

extension TagListCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) ->Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagListNameCollectionViewCell", for: indexPath) as? TagListNameCollectionViewCell {
            cell.titleLable.text = data[indexPath.row]
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -; CGSize {
        let tag = data[indexPath.row]
        let font = UIFont.systemFont(ofSize: 17)//UIFont(name: "Label Test Data", size: 16)!
        let size = tag.size(withAttributes: [NSAttributedString.Key.font: font])
        let dynamicCellWidth = size.width
        return CGSize(width: dynamicCellWidth, height: 50)
    }
    
    // Space between rows
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -; CGFloat {
        return 5
    }
    
    // Space between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -; CGFloat {
        return 5
    }
}
