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
        let backgroundViewFrame = CGRect(x: 0, y: 0, width:UIScreen.jk.width, height: 70)
        let backgroundView = UIView(frame: backgroundViewFrame)
        backgroundView.backgroundColor = UIColor.white
        return backgroundView
    }()
    
    lazy var iconImageView:UIImageView = {
        let tempIconImageViewFrame = CGRect(x:12, y: 12, width:83, height: 83)
        let tempIconImageView = UIImageView(frame: tempIconImageViewFrame)
        tempIconImageView.backgroundColor = UIColor.white
        tempIconImageView.layer.corner(2)
        tempIconImageView.layer.masksToBounds = true
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
        let tempExponentLabel = UILabel()
        tempExponentLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        tempExponentLabel.backgroundColor = UIColor.clear
        tempExponentLabel.textColor = UIColor.hexStringColor(hexString: "#146FD1")
        tempExponentLabel.font = UIFont.jk.textB(13)
        return tempExponentLabel
    }()
    
    lazy var addressLabel:UILabel = {
        let tempAddressLabel = UILabel()
        tempAddressLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        tempAddressLabel.backgroundColor = UIColor.clear
        tempAddressLabel.textColor = UIColor.hexStringColor(hexString: "#999999")
        tempAddressLabel.font = UIFont.jk.textB(13)
        return tempAddressLabel
    }()
    
    lazy var distanceLabel:UILabel = {
        let tempDistanceLabel = UILabel()
        tempDistanceLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        tempDistanceLabel.backgroundColor = UIColor.clear
        tempDistanceLabel.textColor = UIColor.hexStringColor(hexString: "#999999")
        tempDistanceLabel.font = UIFont.jk.textB(13)
        return tempDistanceLabel
    }()
    
    lazy var likeButton:UIButton = {
        let tempLikeButton = UIButton.jk.normal()
        tempLikeButton.backgroundColor = UIColor.hexStringColor(hexString: "#FEF4F1")
        tempLikeButton.layer.corner(2)
        tempLikeButton.layer.masksToBounds = true
        let image = UIImage(named: "like")
        tempLikeButton.image(image, UIControl.State.normal)
        tempLikeButton.jk.setImageTitleLayout(.imgLeft, spacing: 5)
        tempLikeButton.setTitleColor(UIColor.hexStringColor(hexString: "#FF6B34"), for: UIControl.State.normal)
        tempLikeButton.font(UIFont.jk.textF(11))
        return tempLikeButton
    }()
    
    lazy var watchButton:UIButton = {
        let tempWatchButton = UIButton()
        tempWatchButton.backgroundColor = UIColor.hexStringColor(hexString: "#FEF4F1")
        tempWatchButton.layer.corner(2)
        tempWatchButton.layer.masksToBounds = true
        let image = UIImage(named: "look11")
        tempWatchButton.setImage(image, for: UIControl.State.normal)
        tempWatchButton.jk.setImageTitleLayout(.imgLeft, spacing: 5)
        tempWatchButton.setTitleColor(UIColor.hexStringColor(hexString: "#FF6B34"), for: UIControl.State.normal)
        tempWatchButton.font(UIFont.jk.textF(11))
       // tempWatchButton.isHidden(true)
        return tempWatchButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
        makeSubViewConstraints()
    }
    /// 创建控件
    private func initUI() {
        self.contentView.backgroundColor = UIColor.hexStringColor(hexString: "#F5F5F5")
        self.contentView.addSubview(storeBackgroundView)
        storeBackgroundView.addSubview(iconImageView)
        storeBackgroundView.addSubview(titleLabel)
        storeBackgroundView.addSubview(exponentLabel)
        storeBackgroundView.addSubview(addressLabel)
        storeBackgroundView.addSubview(distanceLabel)
        //storeBackgroundView.addSubview(likeButton)
        storeBackgroundView.addSubview(watchButton)
    }
    /// 添加控件和设置约束
    private func makeSubViewConstraints() {
        storeBackgroundView.snp.makeConstraints { make in
            make.left.top.right.equalTo(0)
            make.bottom.equalTo(-10)
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
        
        addressLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.top.equalTo(exponentLabel.snp.bottom).offset(10)
            make.right.equalTo(-70)
            make.height.equalTo(13)
        }
        
        distanceLabel.snp.makeConstraints { make in
            make.top.equalTo(exponentLabel.snp.bottom).offset(10)
            make.right.equalTo(0)
            make.width.equalTo(70)
            make.height.equalTo(13)
        }
        
        watchButton.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.top.equalTo(addressLabel.snp.bottom).offset(10)
            make.width.equalTo(60)
            make.height.equalTo(17)
        }
        
//        likeButton.snp.makeConstraints { make in
//            make.top.equalTo(addressLabel.snp.bottom).offset(10)
//            make.right.equalTo(0)
//            make.width.equalTo(70)
//            make.height.equalTo(13)
//        }
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
        //UIlabel的富文本设置
           let attributeString  = NSMutableAttributedString.init(string: "安康指数 " + itemModel.storescore!)
        attributeString.addAttribute(NSAttributedString.Key.font, value:  UIFont.jk.textF(13), range: NSRange.init(location: 0, length: attributeString.length))
        //设置特定位置文字的颜色
         attributeString.addAttribute(NSMutableAttributedString.Key.foregroundColor, value: UIColor.hexStringColor(hexString: "#146FD1"), range: NSMakeRange(0, attributeString.length))
        exponentLabel.attributedText = attributeString;
        
        let storeTypeAndArea = itemModel.restaurantType! + itemModel.area!
        addressLabel.text = storeTypeAndArea
        var showDistanceStr:String = ""
        let distance:Float = Float(itemModel.distance!)!
        if distance <= 1000.0 {
            showDistanceStr = distance.jk.int.jk.intToString + "m";
        }else{
            let tempfloat:Float = distance/1000.0
            let tempRoundfloat:Float =  tempfloat.jk.roundTo(places: 2)
            showDistanceStr = tempRoundfloat.jk.string + "km"
        }
        distanceLabel.text = showDistanceStr
        
        var watchNumStr:String = ""
        let watchNum:Float = Float(itemModel.watchNum!)!
        if watchNum > 9999 {
            watchNumStr = String(format: "%.1fw", Int(watchNum/10000))
        }else{
            watchNumStr = itemModel.watchNum!
        }
        watchButton.title(watchNumStr, UIControl.State.normal)
    }
}
