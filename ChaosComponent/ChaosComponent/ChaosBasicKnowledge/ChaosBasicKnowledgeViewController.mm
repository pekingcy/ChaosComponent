//
//  ChaosBasicKnowledgeViewController.m
//  ChaosComponent
//
//  Created by jh on 2021/3/8.
//

#import "ChaosBasicKnowledgeViewController.h"
#include "MArray.cpp"
#include "LinkedList.cpp"

using namespace std;

@interface ChaosBasicKnowledgeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView* tableView;
@property(copy,  nonatomic)NSArray* resource;

@end

@implementation ChaosBasicKnowledgeViewController

@synthesize naviTitle = _naviTitle;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    LinkedList<int> *list = new LinkedList<int>;
    list->add(10);
    list->add(11);
    list->add(13);
    list->add(15);
    list->add(17);
    list->add(19);
    cout << list->toString()<<endl;
    list->remove(0);
    cout << list->toString()<<endl;
    list->remove(3);
    cout << list->toString()<<endl;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated{
    id<HomeServiceProtocol> homeVc =  [[BeeHive shareInstance] createService:@protocol(HomeServiceProtocol)];
    [homeVc setNavigationTitle:self.naviTitle];
}

- (NSArray *)resource{
    if (_resource == nil) {
        _resource = @[ @"数组", @"字典"];
    }
    return _resource;
}

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    }
    return _tableView;
}

#pragma UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
             
            break;
            
        default:
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellIdentifier"];
    }
    cell.textLabel.text = self.resource[indexPath.row];
    return cell;
}

@end
