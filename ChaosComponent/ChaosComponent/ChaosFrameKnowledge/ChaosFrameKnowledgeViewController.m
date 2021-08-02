//
//  ChaosFrameKnowledgeViewController.m
//  ChaosComponent
//
//  Created by jh on 2021/3/8.
//

#import "ChaosFrameKnowledgeViewController.h"
#import "ChaosComponent-Swift.h"
@interface ChaosFrameKnowledgeViewController ()
@property(copy,  nonatomic)NSArray* resource;
@end

@implementation ChaosFrameKnowledgeViewController

@synthesize naviTitle = _naviTitle;
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    id<HomeServiceProtocol> homeVc =  [[BeeHive shareInstance] createService:@protocol(HomeServiceProtocol)];
    [homeVc setNavigationTitle:self.naviTitle];
}

- (NSArray *)resource{
    if (_resource == nil) {
        _resource = @[ @"数组",@"swift"];
    }
    return _resource;
}

#pragma UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
             
            break;
        case 1:{
            ChaosBaseViewController * vc =  [[ChaosBaseViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
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
