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

    lazy var areaButton:UIButton = {
        let tempAreaButton:UIButton =  UIButton();
        tempAreaButton.backgroundColor = .white
        let image = UIImage(named: "like")
        tempAreaButton.image(image, UIControl.State.normal)
        tempAreaButton.jk.setImageTitleLayout(.imgLeft, spacing: 5)
        return tempAreaButton
    }()
    
    lazy var searchView:JHNavigateSearchView = {
        let tempView:JHNavigateSearchView =  JHNavigateSearchView();
        tempView.backgroundColor = UIColor.hexStringColor(hexString: "#FEF4F1")
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
            make.left.equalTo(30)
            make.top.equalTo(8)
            make.height.equalTo(30)
            make.width.equalTo(80)
        }
        searchView.snp.makeConstraints { make in
            make.left.equalTo(areaButton.snp.right).offset(12)
            make.top.equalTo(8)
            make.right.equalTo(30)
            make.height.equalTo(30)
        }
        self.layoutIfNeeded()
    }
}
