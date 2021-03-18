//
//  ChaosViewController.m
//  ChaosComponent
//
//  Created by jh on 2021/3/8.
//

#import "ChaosViewController.h"
#import "BeeHive.h"
#import "BHService.h"
#import "ChaosBasicKnowledgeViewController.h"
@BeeHiveService(HomeServiceProtocol,ChaosViewController)
@interface ChaosViewController ()<HomeServiceProtocol>
@property(nonatomic,strong) NSMutableArray *registerViewControllers;
@end

@implementation ChaosViewController

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.registerViewControllers = [[NSMutableArray alloc] initWithCapacity:1];
        
        ChaosBasicKnowledgeViewController *v1 = [[ChaosBasicKnowledgeViewController alloc] init];
        if ([v1 isKindOfClass:[UIViewController class]]) {
            [self registerViewController:v1 title:@"基础知识" iconName:nil];
        }
        
        id<FrameServiceProtocol> v4 = [[BeeHive shareInstance] createService:@protocol(FrameServiceProtocol)];
        if ([v4 isKindOfClass:[UIViewController class]]) {
            [self registerViewController:(UIViewController *)v4 title:@"架构" iconName:nil];
        }
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)registerViewController:(UIViewController *)vc title:(NSString *)title iconName:(NSString *)iconName
{
    vc.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"Home.bundle/%@", iconName]];
    vc.tabBarItem.title = title;
    
    [self.registerViewControllers addObject:vc];
    
    self.viewControllers = self.registerViewControllers;
}


-(void)click:(UIButton *)btn
{
    id<FrameServiceProtocol> obj = [[BeeHive shareInstance] createService:@protocol(FrameServiceProtocol)];
    if ([obj isKindOfClass:[UIViewController class]]) {
        obj.itemId = @"12313231231";
        [self.navigationController pushViewController:(UIViewController *)obj animated:YES];
    }
}

@end
