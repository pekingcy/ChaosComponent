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

+ (BOOL)singleton{
    return YES;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.registerViewControllers = [[NSMutableArray alloc] initWithCapacity:1];
        
        id<BasicServiceProtocol> v1 = [[BeeHive shareInstance] createService:@protocol(BasicServiceProtocol)];
        if ([v1 isKindOfClass:[UIViewController class]]) {
            v1.naviTitle = @"基础知识";
            [self registerViewController:(UIViewController *)v1 title:@"基础知识" iconName:nil];
        }
        
        id<FrameServiceProtocol> v4 = [[BeeHive shareInstance] createService:@protocol(FrameServiceProtocol)];
        if ([v4 isKindOfClass:[UIViewController class]]) {
            v4.naviTitle = @"架构";
            [self registerViewController:(UIViewController *)v4 title:@"架构" iconName:nil];
        }
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setNavigationTitle:(NSString*)title{
    self.title = title;
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
        [self.navigationController pushViewController:(UIViewController *)obj animated:YES];
    }
}

@end
