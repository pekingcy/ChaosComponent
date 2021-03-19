//
//  ChaosFrameKnowledgeViewController.m
//  ChaosComponent
//
//  Created by jh on 2021/3/8.
//

#import "ChaosFrameKnowledgeViewController.h"

@interface ChaosFrameKnowledgeViewController ()
@end

@implementation ChaosFrameKnowledgeViewController
@synthesize itemId=_itemId;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    id<HomeServiceProtocol> homeVc = [[BeeHive shareInstance] createService:@protocol(HomeServiceProtocol)];
    if ([homeVc isKindOfClass:[UIViewController class]]) {
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:(UIViewController*)homeVc];
        navCtrl.title = self.naviTitle;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* UITableViewCellIdentifier = @"cellIdentifier";
    UITableViewCell*cell =  [tableView dequeueReusableCellWithIdentifier:UITableViewCellIdentifier];
    if(cell == nil){
        
    }
    return cell;
}

@end
