//
//  ChaosFrameModule.m
//  ChaosComponent
//
//  Created by jh on 2021/3/8.
//

#import "ChaosFrameModule.h"
#import "BeeHive.h"
#import "ChaosFrameKnowledgeViewController.h"

@interface ChaosFrameModule()<BHModuleProtocol>

@end

@implementation ChaosFrameModule

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
    
    
    id<FrameServiceProtocol> service = [[BeeHive shareInstance] createService:@protocol(FrameServiceProtocol)];
    
    service.itemId = @"我是单例";
}


- (void)modSetUp:(BHContext *)context
{
    [[BeeHive shareInstance]  registerService:@protocol(FrameServiceProtocol) service:[ChaosFrameKnowledgeViewController class]];
    NSLog(@"TradeModule setup");
}

- (void)basicModuleLevel
{
    
}


@end
