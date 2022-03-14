//
//  ChaosBasicModule.m
//  ChaosComponent
//
//  Created by jh on 2021/3/19.
//

#import "ChaosDataStructureModule.h"
#import "BeeHive.h"
#import "ChaosDataStructureViewController.h"

@interface ChaosDataStructureModule()<BHModuleProtocol>

@end

@implementation ChaosDataStructureModule

+ (void)load
{
    [BeeHive registerDynamicModule:[self class]];
}

- (id)init{
    if (self = [super init])
    {
        NSLog(@"TradeModule init");
    }
    
    return self;
}


-(void)modInit:(BHContext *)context
{
    NSLog(@"模块初始化中");
    NSLog(@"%@",context.moduleConfigName);
}

- (void)modSetUp:(BHContext *)context
{
    [[BeeHive shareInstance]  registerService:@protocol(DataStructureServiceProtocol) service:[ChaosDataStructureViewController class]];
    NSLog(@"TradeModule setup");
    
}

- (void)basicModuleLevel
{
    
}


@end
