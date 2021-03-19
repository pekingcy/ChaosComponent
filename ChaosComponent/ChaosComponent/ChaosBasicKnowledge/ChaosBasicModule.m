//
//  ChaosBasicModule.m
//  ChaosComponent
//
//  Created by jh on 2021/3/19.
//

#import "ChaosBasicModule.h"
#import "BeeHive.h"
#import "ChaosBasicKnowledgeViewController.h"

@interface ChaosBasicModule()<BHModuleProtocol>

@end

@implementation ChaosBasicModule

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
    id<BasicServiceProtocol> service = [[BeeHive shareInstance] createService:@protocol(BasicServiceProtocol)];
    service.naviTitle = @"我是单例";
}


- (void)modSetUp:(BHContext *)context
{
    [[BeeHive shareInstance]  registerService:@protocol(BasicServiceProtocol) service:[ChaosBasicKnowledgeViewController class]];
    NSLog(@"TradeModule setup");
}

- (void)basicModuleLevel
{
    
}


@end
