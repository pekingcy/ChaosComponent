//
//  ChaosBaseViewController.swift
//  ChaosComponent
//
//  Created by jh on 2021/8/2.
//

import UIKit
import SwiftyJSON
import ObjectMapper
import SnapKit

//https://github.com/Lafree317/Swift-MJrefresh/blob/master/README.md
class ChaosBaseViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    //数据
    var dataList:[StoreLiveItem]? = [];
    var typeList:[JHStoreShowTypeModel]? = [];

    lazy var searchView:JHNavigateAreaSearchView = {
        let tempSearchView:JHNavigateAreaSearchView =  JHNavigateAreaSearchView();
        tempSearchView.backgroundColor = UIColor.white
        tempSearchView.searchBarTextChange = {(text) in
            print(text)
        }
        return tempSearchView
    }()
    lazy var storeTypeSelectedView: JHStoreTypeSelectedView = {
        let tempStoreTypeSelectedView: JHStoreTypeSelectedView =  JHStoreTypeSelectedView();
        tempStoreTypeSelectedView.backgroundColor = UIColor.white
//        tempSearchView.searchBarTextChange = {(text) in
//            print(text)
//        }
        return tempStoreTypeSelectedView
    }()
    
    lazy var listTableView:UITableView = {
        let tableViewFrame = CGRect(x:0,y:0,width:view.bounds.width,height:view.bounds.height)
        let tableView = UITableView(frame:tableViewFrame,style:.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(JHStoreListTableViewCell.self, forCellReuseIdentifier: "cellID")
        return tableView;
    }()

    // 顶部刷新
    let header = MJRefreshNormalHeader()
        // 底部刷新
    let footer = MJRefreshAutoNormalFooter()

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建tableView
        view.addSubview(searchView)
        searchView.snp.makeConstraints({(make) in
            make.top.equalTo(88)
            make.left.right.equalTo(0)
            make.height.equalTo(44)
        })
        
        view.addSubview(storeTypeSelectedView)
        storeTypeSelectedView.snp.makeConstraints({(make) in
            make.top.equalTo(searchView.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.height.equalTo(44)
        })
        
        view.addSubview(listTableView)
        listTableView.snp.makeConstraints({(make) in
            make.top.equalTo(storeTypeSelectedView.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
        })
        // 下拉刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(self.headerRefresh))
        // 现在的版本要用mj_header
        self.listTableView.mj_header = header
        // 上拉刷新
        footer.setRefreshingTarget(self, refreshingAction: #selector(self.footerRefresh))
        self.listTableView.mj_footer = footer
        requestStoreModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func requestResource(){
        ChaosNetworkManager<StoreLiveModel>().request(target: SimpleApi.GetFssStoreList) { (result) in
            guard let data = result.data  else {
                /// error
                print(result.message ?? "")
                return
            }
            self.dataList = result.data?.storeList;
            self.listTableView.reloadData()
            /// success
            print(data)
            self.header.endRefreshing();
            self.footer.endRefreshing();
            let count:Int! = result.data?.storeList?.count
            if  count >= 0 {
                self.footer.endRefreshingWithNoMoreData()
            }
        }
    }
    
    func requestStoreModel() {
        ChaosNetworkManager<JHStoreShowModel>().request(target: SimpleApi.GetBookExhibitByAppId) { (result) in
            guard let data = result.data  else {
                /// error
                print(result.message ?? "")
                return
            }
            self.typeList = result.data?.Data;
            self.requestResource()
        }
    }
    // 顶部刷新
    @objc func headerRefresh(){
           print("下拉刷新")
           // 结束刷新
        self.listTableView.mj_header?.endRefreshing()
       }
       // 底部刷新
       var index = 0
    @objc func footerRefresh(){
           print("上拉刷新")
           self.listTableView.mj_footer?.endRefreshing()
           // 2次后模拟没有更多数据
           index = index + 1
           if index > 2 {
               footer.endRefreshingWithNoMoreData()
           }
    }
    //MARK: - 返回多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:JHStoreListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as!JHStoreListTableViewCell
        if let model:StoreLiveItem = self.dataList?[indexPath.row]{
            cell.updateSubView(model,self.typeList!);
        }
        return cell
    }

    //MARK: - 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    //MARK: - 点击cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //MARK: - 使cell的分割线与屏幕两端对齐
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            cell.separatorInset = .zero
        }
        if cell.responds(to: #selector(setter: UITableViewCell.layoutMargins)) {
            cell.layoutMargins = .zero
        }
    }
    
    //MARK: - 设置编辑样式
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        //删除
        return .delete
    }
    
    //MARK: - 删除单元格
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           // print("要删除\(dataList[indexPath.row])")
            
            //提示
//            let alertC = UIAlertController.init(title: "温馨提示", message: "确定要删除\(dataList[indexPath.row])？", preferredStyle: .alert)
//            alertC.addAction(UIAlertAction.init(title: "确定", style: .destructive, handler: { (UIAlertAction) in
//               // self.dataList.removeObject(at: indexPath.row)
//                tableView.reloadData()
//            }))
//
//            alertC.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: nil))
//
//            present(alertC, animated: true, completion: nil)
        }
        
        if editingStyle == .insert {
            print("增加")
        }
    }
    
    //MARK: - 允许排序
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //MARK: - 排序
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
      //  dataList.exchangeObject(at: sourceIndexPath.row, withObjectAt: destinationIndexPath.row)
        tableView.reloadData()
    }
    
}
