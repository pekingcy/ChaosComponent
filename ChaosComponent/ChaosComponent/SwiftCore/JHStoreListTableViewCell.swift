//
//  JHStoreListTableViewCell.swift
//  ChaosComponent
//
//  Created by jh on 2021/9/24.
//

import UIKit
import SnapKit
import Foundation
import JKSwiftExtension

class JHStoreListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    lazy var storeBackgroundView:UIView = {
        let backgroundViewFrame = CGRect(x: 0, y: 0, width:UIScreen.jk.width, height: 80)
        let backgroundView = UIView(frame: backgroundViewFrame)
        backgroundView.backgroundColor = UIColor.red
        return backgroundView
    }()
    
    lazy var iconImageView:UIImageView = {
        let tempIconImageViewFrame = CGRect(x: 0, y: 0, width:83, height: 83)
        let tempIconImageView = UIImageView(frame: tempIconImageViewFrame)
        tempIconImageView.backgroundColor = UIColor.white
        return tempIconImageView
    }()
    
    lazy var titleLabel:UILabel = {
        let tempTitleLabel = UILabel()
        tempTitleLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        tempTitleLabel.backgroundColor = UIColor.white
        return tempTitleLabel
    }()
    
//    lazy var iconImageView:UIImageView = {
//        let tempIconImageViewFrame = CGRect(x: 0, y: 0, width:83, height: 83)
//        let tempIconImageView = UIImageView(frame: tempIconImageViewFrame)
//        tempIconImageView.backgroundColor = UIColor.white
//        return tempIconImageView;
//    }()
//
//    lazy var iconImageView:UIImageView = {
//        let tempIconImageViewFrame = CGRect(x: 0, y: 0, width:83, height: 83)
//        let tempIconImageView = UIImageView(frame: tempIconImageViewFrame)
//        tempIconImageView.backgroundColor = UIColor.white
//        return tempIconImageView;
//    }()
//    lazy var iconImageView:UIImageView = {
//        let tempIconImageViewFrame = CGRect(x: 0, y: 0, width:83, height: 83)
//        let tempIconImageView = UIImageView(frame: tempIconImageViewFrame)
//        tempIconImageView.backgroundColor = UIColor.white
//        return tempIconImageView;
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
        makeSubViewConstraints()
    }
    
    /// 创建控件
    private func initUI() {
        self.contentView.addSubview(storeBackgroundView)
        storeBackgroundView.addSubview(iconImageView)
    }
    /// 添加控件和设置约束
    private func makeSubViewConstraints() {
        storeBackgroundView.snp.makeConstraints { make in
            make.left.top.bottom.right.equalTo(0)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.left.top.equalTo(0)
            make.size.equalTo(CGSize(width: 83, height: 83))
        }
        
        
        self.layoutIfNeeded()
    }
}
