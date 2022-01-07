//
//  JHStoreTypeSelectedCollectionViewCell.swift
//  ChaosComponent
//
//  Created by jh on 2021/9/29.
//

import UIKit

class JHStoreTypeSelectedCollectionViewCell: UICollectionViewCell {
    
    lazy var itemButton:UIButton = {
        let tempItemButton:UIButton =  UIButton();
        tempItemButton.backgroundColor = .white
        let image = UIImage(named: "shop_list_arrow")
        tempItemButton.image(image, UIControl.State.normal)
        tempItemButton.jk.setImageTitleLayout(.imgRight, spacing: 5)
        tempItemButton.title("北京", UIControl.State.normal)
        tempItemButton.font(UIFont.jk.textB(14))
        tempItemButton.textColor(UIColor.hexStringColor(hexString: "#353638"), UIControl.State.normal)
        tempItemButton.isUserInteractionEnabled = false
        return tempItemButton
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
        makeSubViewConstraints()
    }
    
    func initUI() {
        self.addSubview(itemButton)
    }
    
    func makeSubViewConstraints() {
        itemButton.snp.makeConstraints { make in
            make.center.equalTo(self.snp.center)
            make.height.equalTo(30)
            make.width.equalTo(60)
        }
    }
    
  //  updateSubView
    func updateSubView(_ text : String){
        itemButton.title(text, UIControl.State.normal)
    }
    
    func didSeleted(_ status : Bool){
        if status {
            itemButton.textColor(UIColor.hexStringColor(hexString: "#04A174"), UIControl.State.normal)
        }else{
            itemButton.textColor(UIColor.hexStringColor(hexString: "#353638"), UIControl.State.normal)
        }
    }
}
