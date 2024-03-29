//
//  JHStoreTypeSelectedView.swift
//  ChaosComponent
//
//  Created by jh on 2021/9/29.
//

import UIKit

class JHStoreTypeSelectedView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {

    typealias JHStoreTypeSelectedIndexBlock = (_ index: Int) -> ()
    
    var selectedIndexBlock:JHStoreTypeSelectedIndexBlock?
    
    var seletedRow:Int = 0
        
    lazy var listCollectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: floor(UIScreen.jk.width/3.0), height: 30)
        layout.minimumLineSpacing=0;
        layout.minimumInteritemSpacing=0
        
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(JHStoreTypeSelectedCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        return collectionView;
    }()
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        initUI()
        makeSubViewConstraints()
    }
    
    private func initUI() {
        self.backgroundColor = UIColor.hexStringColor(hexString: "#F5F5F5")
        self.addSubview(listCollectionView)
    }
    
    private func makeSubViewConstraints() {
        listCollectionView.snp.makeConstraints({(make) in
            make.top.left.bottom.right.equalTo(0)
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        seletedRow = indexPath.row
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)->UICollectionViewCell{
        let cell:JHStoreTypeSelectedCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as!JHStoreTypeSelectedCollectionViewCell
        if seletedRow == indexPath.row{
            cell.didSeleted(true)
        }else{
            cell.didSeleted(false)
        }
        return cell
    }
    
}
