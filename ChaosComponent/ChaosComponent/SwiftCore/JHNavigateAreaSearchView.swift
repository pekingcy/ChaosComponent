//
//  JHNavigateAreaSearchView.swift
//  ChaosComponent
//
//  Created by jh on 2021/9/28.
//

import UIKit
import SnapKit
import JKSwiftExtension
class JHNavigateAreaSearchView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    typealias searchBarTextChangeBlock = (_ text: String) -> ()
    
    var searchBarTextChange:searchBarTextChangeBlock?
    
    lazy var areaButton:UIButton = {
        let tempAreaButton:UIButton =  UIButton();
        tempAreaButton.backgroundColor = .white
        let image = UIImage(named: "shop_list_arrow")
        tempAreaButton.image(image, UIControl.State.normal)
        tempAreaButton.jk.setImageTitleLayout(.imgRight, spacing: 5)
        tempAreaButton.title("北京市", UIControl.State.normal)
        tempAreaButton.font(UIFont.jk.textB(14))
        tempAreaButton.textColor(UIColor.hexStringColor(hexString: "#353638"), UIControl.State.normal)
        return tempAreaButton
    }()
    
    lazy var searchView:JHNavigateSearchView = {
        let tempView:JHNavigateSearchView =  JHNavigateSearchView();
        tempView.backgroundColor = UIColor.white
        tempView.searchBarTextChange = {(text) in
            if let block = self.searchBarTextChange{
                block(text)
            }
        }
        return tempView
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
        self.addSubview(areaButton)
        self.addSubview(searchView)
    }
    /// 添加控件和设置约束
    private func makeSubViewConstraints() {
 
        areaButton.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(8)
            make.height.equalTo(30)
            make.width.equalTo(68)
        }
        searchView.snp.makeConstraints { make in
            make.left.equalTo(areaButton.snp.right).offset(6)
            make.top.equalTo(8)
            make.right.equalTo(-10)
            make.height.equalTo(30)
        }
        self.layoutIfNeeded()
    }
}
