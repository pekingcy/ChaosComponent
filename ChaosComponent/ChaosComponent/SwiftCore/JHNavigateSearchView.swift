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
    
    typealias searchBarTextChangeBlock = (_ text: String) -> ()
    var searchBarTextChange:searchBarTextChangeBlock?
    
    let JHSearchImageInset: CGFloat = 11.0
    let JHSearchBarImageSize: CGFloat = 22.0

    lazy var storeBackgroundView:UIView = {
        let backgroundViewFrame = CGRect(x: 0, y: 0, width:UIScreen.jk.width, height: 30)
        let backgroundView = UIView(frame: backgroundViewFrame)
        backgroundView.backgroundColor = UIColor.hexStringColor(hexString: "#F4F4F4")
        backgroundView.layer.corner(15)
        backgroundView.layer.masksToBounds = true
        return backgroundView
    }()
    
    lazy var searchField:UITextField = {
        let tempSearchField:UITextField =  UITextField();
        tempSearchField.backgroundColor = UIColor.hexStringColor(hexString: "#F4F4F4")
        tempSearchField.placeholder = "输入商家名、品类或者商圈"
        tempSearchField.font(UIFont.jk.textF(14))
        tempSearchField.keyboardType = .webSearch
        tempSearchField.delegate = self
        return tempSearchField
    }()
    
    lazy var searchImage:UIImageView = {
        let tempSearchImage:UIImageView =  UIImageView();
        tempSearchImage.image = UIImage(named: "shop_list_search")
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
            make.left.top.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(30)
        }
        searchField.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.right.equalTo(-10)
            make.centerY.equalTo(storeBackgroundView.snp.centerY)
            make.height.equalTo(30)
        }
        searchImage.snp.makeConstraints { make in
            make.left.equalTo(6)
            make.centerY.equalTo(storeBackgroundView.snp.centerY)
            make.width.height.equalTo(16)
        }
        self.layoutIfNeeded()
    }
    //UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let block = searchBarTextChange {
            block(textField.text!)
        }
        return true
    }
}

