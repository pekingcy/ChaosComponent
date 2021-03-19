//
//  ChaosBasicKnowledgeViewController.m
//  ChaosComponent
//
//  Created by jh on 2021/3/8.
//

#import "ChaosBasicKnowledgeViewController.h"
#include "MArray.cpp"

using namespace std;

@interface ChaosBasicKnowledgeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView* tableView;
@property(strong,nonatomic)NSArray* resource;
@end

@implementation ChaosBasicKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    MArray<int> array = *new MArray<int>;
//    array.init();
//    array.add(1);
//    array.insert(1,2);
//    array.objectAt(1);
//    array.clear();
//    int value = array.objectAt(0);
//    array.display();
    
    id<HomeServiceProtocol> homeVc = [[BeeHive shareInstance] createService:@protocol(HomeServiceProtocol)];
    if ([homeVc isKindOfClass:[UIViewController class]]) {
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:(UIViewController*)homeVc];
        navCtrl.title = self.naviTitle;
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
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
