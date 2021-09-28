//
//  JHNavigateSearchView.swift
//  ChaosComponent
//
//  Created by jh on 2021/9/28.
//

import UIKit
import SnapKit
import JKSwiftExtension

class JHNavigateSearchView: UIView, UITextFieldDelegate {
    
    let JHSearchImageInset: CGFloat = 11.0
    let JHSearchBarImageSize: CGFloat = 22.0

    lazy var storeBackgroundView:UIView = {
        let backgroundViewFrame = CGRect(x: 0, y: 0, width:UIScreen.jk.width, height: 70)
        let backgroundView = UIView(frame: backgroundViewFrame)
        backgroundView.backgroundColor = UIColor.white
        backgroundView.layer.corner(15)
        backgroundView.layer.masksToBounds = true
        return backgroundView
    }()
    
    lazy var searchField:UITextField = {
        let tempSearchField:UITextField =  UITextField();
        tempSearchField.backgroundColor = UIColor.hexStringColor(hexString: "#FEF4F1")
        tempSearchField.placeholder = "请输入商品名"
        tempSearchField.keyboardType = .webSearch
        tempSearchField.backgroundColor = UIColor.white
        return tempSearchField
    }()
    
    lazy var searchImage:UIImageView = {
        let tempSearchImage:UIImageView =  UIImageView();
        tempSearchImage.image = UIImage(named: "NavBarIconSearch")
        return tempSearchImage
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
        self.addSubview(storeBackgroundView)
        storeBackgroundView.addSubview(searchImage)
        storeBackgroundView.addSubview(searchField)
    }
    /// 添加控件和设置约束
    private func makeSubViewConstraints() {
        storeBackgroundView.snp.makeConstraints { make in
            make.left.top.right.equalTo(0)
            make.height.equalTo(30)
        }
        
        searchField.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            make.centerY.equalTo(storeBackgroundView.snp.centerY)
            make.height.equalTo(30)
        }
        
        searchImage.snp.makeConstraints { make in
            make.left.equalTo(6)
            make.centerY.equalTo(storeBackgroundView.snp.centerY)
            make.width.height.equalTo(30)
        }
        self.layoutIfNeeded()
    }
}
