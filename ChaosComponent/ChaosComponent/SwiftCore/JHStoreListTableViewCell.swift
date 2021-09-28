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
        tempTitleLabel.isHidden(true)
        return tempTitleLabel
    }()
    
    lazy var gradeImageView:UIImageView = {   //食品安全等级
        let tempGradeImageViewFrame = CGRect(x:12, y: 12, width:83, height: 83)
        let tempGradeImageView = UIImageView(frame: tempGradeImageViewFrame)
        tempGradeImageView.backgroundColor = UIColor.white
        tempGradeImageView.layer.corner(2)
        tempGradeImageView.layer.masksToBounds = true
        tempGradeImageView.isHidden(true)
        return tempGradeImageView
    }()
    
    lazy var exponentLabel:UILabel = {
        let tempExponentLabel = UILabel()
        tempExponentLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        tempExponentLabel.backgroundColor = UIColor.clear
        tempExponentLabel.textColor = UIColor.hexStringColor(hexString: "#146FD1")
        tempExponentLabel.font = UIFont.jk.textB(13)
        tempExponentLabel.isHidden(true)
        return tempExponentLabel
    }()
    
    lazy var addressLabel:UILabel = {
        let tempAddressLabel = UILabel()
        tempAddressLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        tempAddressLabel.backgroundColor = UIColor.clear
        tempAddressLabel.textColor = UIColor.hexStringColor(hexString: "#999999")
        tempAddressLabel.font = UIFont.jk.textF(13)
        tempAddressLabel.isHidden(true)
        return tempAddressLabel
    }()
    
    lazy var distanceLabel:UILabel = {
        let tempDistanceLabel = UILabel()
        tempDistanceLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        tempDistanceLabel.backgroundColor = UIColor.clear
        tempDistanceLabel.textColor = UIColor.hexStringColor(hexString: "#999999")
        tempDistanceLabel.font = UIFont.jk.textF(13)
        tempDistanceLabel.textAlignment = NSTextAlignment.right
        tempDistanceLabel.isHidden(true)
        return tempDistanceLabel
    }()
    
    lazy var likeButton:UIButton = {
        let tempLikeButton = UIButton()
        tempLikeButton.backgroundColor = UIColor.hexStringColor(hexString: "#FEF4F1")
        tempLikeButton.layer.corner(2)
        tempLikeButton.layer.masksToBounds = true
        let image = UIImage(named: "like")
        tempLikeButton.image(image, UIControl.State.normal)
        tempLikeButton.jk.setImageTitleLayout(.imgLeft, spacing: 5)
        tempLikeButton.setTitleColor(UIColor.hexStringColor(hexString: "#FF6B34"), for: UIControl.State.normal)
        tempLikeButton.font(UIFont.jk.textF(11))
        tempLikeButton.isHidden(true)
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
        tempWatchButton.isHidden(true)
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
        storeBackgroundView.addSubview(gradeImageView)
        storeBackgroundView.addSubview(exponentLabel)
        storeBackgroundView.addSubview(addressLabel)
        storeBackgroundView.addSubview(distanceLabel)
        storeBackgroundView.addSubview(watchButton)
        storeBackgroundView.addSubview(likeButton)
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
        gradeImageView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.width.equalTo(54)
            make.height.equalTo(13)
        }
        exponentLabel.snp.makeConstraints { make in
            make.left.equalTo(gradeImageView.snp.right).offset(10)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
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
            make.right.equalTo(-10)
            make.width.equalTo(70)
            make.height.equalTo(13)
        }
        
        watchButton.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.top.equalTo(addressLabel.snp.bottom).offset(10)
            make.width.equalTo(60)
            make.height.equalTo(17)
        }
        
        likeButton.snp.makeConstraints { make in
            make.left.equalTo(watchButton.snp.right).offset(20)
            make.top.equalTo(addressLabel.snp.bottom).offset(10)
            make.width.equalTo(60)
            make.height.equalTo(17)
        }
        self.layoutIfNeeded()
    }
    
    func updateSubView(_ itemModel:StoreLiveItem,_ itemTypes:[JHStoreShowTypeModel]) {
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
        titleLabel.isHidden(true)
        exponentLabel.isHidden(true)
        distanceLabel.isHidden(true)
        watchButton.isHidden(true)
        addressLabel.isHidden(true)
        gradeImageView.isHidden(true)
        var storeTypeAndArea = ""
        for item:JHStoreShowTypeModel in itemTypes {
            if item.ExValue == "Name" {
                if let name = itemModel.storeName { //可选绑定
                    titleLabel.isHidden(false)
                    titleLabel.text = name
                }
            }else if item.ExValue == "Level"{
                if let level = itemModel.level { //可选绑定
                    let levelTemp = level.replacingOccurrences(of:" ", with: "")
                    if !levelTemp.isEmpty {
                        let image = UIImage(named: "sddd_" + levelTemp)
                        gradeImageView.image = image;
                        gradeImageView.isHidden(false)
                    }
                }
            }else if item.ExValue == "FoodIndex"{  //安康指数
                exponentLabel.isHidden(false)
                if gradeImageView.isHidden {
                    exponentLabel.snp.removeConstraints()
                    exponentLabel.snp.makeConstraints { make in
                        make.left.equalTo(iconImageView.snp.right).offset(10)
                        make.top.equalTo(titleLabel.snp.bottom).offset(10)
                        make.right.equalTo(0)
                        make.height.equalTo(13)
                    }
                }else{
                    exponentLabel.snp.removeConstraints()
                    exponentLabel.snp.makeConstraints { make in
                        make.left.equalTo(gradeImageView.snp.right).offset(10)
                        make.top.equalTo(titleLabel.snp.bottom).offset(10)
                        make.right.equalTo(0)
                        make.height.equalTo(13)
                    }
                }
                //UIlabel的富文本设置
                let attributeString  = NSMutableAttributedString.init(string: "安康指数 " + itemModel.storescore!)
                attributeString.addAttribute(NSAttributedString.Key.font, value:  UIFont.jk.textF(13), range: NSRange.init(location: 0, length: attributeString.length))
                //设置特定位置文字的颜色
                 attributeString.addAttribute(NSMutableAttributedString.Key.foregroundColor, value: UIColor.hexStringColor(hexString: "#146FD1"), range: NSMakeRange(0, attributeString.length))
                exponentLabel.attributedText = attributeString;
            }else if item.ExValue == "Category"{
                if let area = itemModel.area { //可选绑定
                    storeTypeAndArea.append(area)
                }
            }else if item.ExValue == "Address"{
                if let restaurantType = itemModel.restaurantType { //可选绑定
                    storeTypeAndArea.append(restaurantType + " ")
                }
            }
            else if item.ExValue == "Distance"{
                if let distanceStr = itemModel.distance { //可选绑定
                    distanceLabel.isHidden(false)
                    var showDistanceStr:String = ""
                    let distance:Float = Float(distanceStr)!
                    if distance <= 1000.0 {
                        showDistanceStr = distance.jk.int.jk.intToString + "m";
                    }else{
                        let tempfloat:Float = distance/1000.0
                        let tempRoundfloat:Float =  tempfloat.jk.roundTo(places: 2)
                        showDistanceStr = tempRoundfloat.jk.string + "km"
                    }
                    distanceLabel.text = showDistanceStr
                }
            }
            else if item.ExValue == "OpenCount"{
                if let watchNumTempStr = itemModel.watchNum { //可选绑定
                    watchButton.isHidden(false)
                    var watchNumStr:String = ""
                    let watchNum:Float = Float(watchNumTempStr)!
                    if watchNum > 9999 {
                        watchNumStr = String(format: "%.1fw", Int(watchNum/10000))
                    }else{
                        watchNumStr = watchNumTempStr
                    }
                    watchButton.title(watchNumStr, UIControl.State.normal)
                }
            }else if item.ExValue == "ZanCount"{
                if let praiseNumTempStr = itemModel.praiseNum { //可选绑定
                    likeButton.isHidden(false)
                    likeButton.snp.removeConstraints()
                    if watchButton.isHidden {
                        likeButton.snp.makeConstraints { make in
                            make.left.equalTo(iconImageView.snp.right).offset(20)
                            make.top.equalTo(addressLabel.snp.bottom).offset(10)
                            make.width.equalTo(60)
                            make.height.equalTo(17)
                        }
                    }else{
                        likeButton.snp.makeConstraints { make in
                            make.left.equalTo(watchButton.snp.right).offset(20)
                            make.top.equalTo(addressLabel.snp.bottom).offset(10)
                            make.width.equalTo(60)
                            make.height.equalTo(13)
                        }
                    }
                    
                    var praiseNumStr:String = ""
                    let praiseNum:Float = Float(praiseNumTempStr)!
                    if praiseNum > 9999 {
                        praiseNumStr = String(format: "%.1fw", Int(praiseNum/10000))
                    }else{
                        praiseNumStr = praiseNumTempStr
                    }
                    likeButton.title(praiseNumStr, UIControl.State.normal)
                }
            }
        }
        if !storeTypeAndArea.isEmpty { //可选绑定
            addressLabel.isHidden(false)
            addressLabel.text = storeTypeAndArea
        }
    }
}
