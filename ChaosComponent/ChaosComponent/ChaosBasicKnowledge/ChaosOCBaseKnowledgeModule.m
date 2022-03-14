//
//  ChaosOCBaseKnowledgeModule.m
//  ChaosComponent
//
//  Created by jh on 2022/3/9.
//

#import "ChaosOCBaseKnowledgeModule.h"
#import "BeeHive.h"
#import "ChaosOCBaseKnowledgeViewController.h"

@interface ChaosOCBaseKnowledgeModule()<BHModuleProtocol>

@end

@implementation ChaosOCBaseKnowledgeModule
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
    [[BeeHive shareInstance]  registerService:@protocol(ChaosOCServiceProtocol) service:[ChaosOCBaseKnowledgeViewController class]];
    NSLog(@"TradeModule setup");
}

- (void)basicModuleLevel
{
     
}

@end
