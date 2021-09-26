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
import Kingfisher
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

    //var model:StoreLiveItem
    
    lazy var storeBackgroundView:UIView = {
        let backgroundViewFrame = CGRect(x: 0, y: 0, width:UIScreen.jk.width, height: 80)
        let backgroundView = UIView(frame: backgroundViewFrame)
        backgroundView.backgroundColor = UIColor.white
        return backgroundView
    }()
    
    lazy var iconImageView:UIImageView = {
        let tempIconImageViewFrame = CGRect(x:12, y: 12, width:83, height: 83)
        let tempIconImageView = UIImageView(frame: tempIconImageViewFrame)
        tempIconImageView.backgroundColor = UIColor.white
        return tempIconImageView
    }()
    
    lazy var titleLabel:UILabel = {
        let tempTitleLabel = UILabel()
        tempTitleLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        tempTitleLabel.backgroundColor = UIColor.clear
        tempTitleLabel.font = UIFont.jk.textB(16)
        return tempTitleLabel
    }()
    
    lazy var exponentLabel:UILabel = {
        let tempTitleLabel = UILabel()
        tempTitleLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        tempTitleLabel.backgroundColor = UIColor.clear
        tempTitleLabel.textColor = UIColor.hexStringColor(hexString: "#146FD1")
        tempTitleLabel.font = UIFont.jk.textB(13)
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
        storeBackgroundView.addSubview(titleLabel)
        storeBackgroundView.addSubview(exponentLabel)
    }
    /// 添加控件和设置约束
    private func makeSubViewConstraints() {
        storeBackgroundView.snp.makeConstraints { make in
            make.left.top.bottom.right.equalTo(0)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.left.top.equalTo(12)
            make.size.equalTo(CGSize(width: 83, height: 83))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.top.equalTo(12)
            make.right.equalTo(0)
            make.height.equalTo(16)
        }
        
        exponentLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.top.equalTo(40)
            make.right.equalTo(0)
            make.height.equalTo(13)
        }
        
        self.layoutIfNeeded()
    }
    
    func updateSubView(_ itemModel:StoreLiveItem) {
        let iconUrl = URL(string: itemModel.storePicUrl!)
        let image = UIImage(named: "store")
        iconImageView.kf.setImage(with: iconUrl,placeholder: image) { result in
                // `result` is either a `.success(RetrieveImageResult)` or a `.failure(KingfisherError)`
                switch result {
                case .success(let value):
                    // The image was set to image view:
                    print(value.image)
                    // From where the image was retrieved:
                    // - .none - Just downloaded.
                    // - .memory - Got from memory cache.
                    // - .disk - Got from disk cache.
                    print(value.cacheType)
                    // The source object which contains information like `url`.
                    print(value.source)
                case .failure(let error):
                    print(error) // The error happens
                }
            }
        
        titleLabel.text = itemModel.storeName
        
        let sttrStyle:NSMutableParagraphStyle = NSMutableParagraphStyle()
        sttrStyle.lineBreakMode = NSLineBreakMode.byWordWrapping
        sttrStyle.alignment = NSTextAlignment.center
        let myAttribute = [NSAttributedString.Key.font: UIFont.jk.textF(13),NSAttributedString.Key.foregroundColor:UIColor.hexStringColor(hexString: "#000000")]
        let attr:NSAttributedString = NSAttributedString(string: "安康指数 " + itemModel.storescore!,attributes: myAttribute)
        exponentLabel.attributedText = attr;
    }
}
