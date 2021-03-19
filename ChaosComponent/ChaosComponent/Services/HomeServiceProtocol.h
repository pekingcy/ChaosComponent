//
//  HomeServiceProtocol.h
//  ChaosComponent
//
//  Created by jh on 2021/3/8.
//

#import <Foundation/Foundation.h>
#import "BHServiceProtocol.h"

@protocol HomeServiceProtocol <NSObject, BHServiceProtocol>

- (void)setNavigationTitle:(NSString*)title;

-(void)registerViewController:(UIViewController *)vc title:(NSString *)title iconName:(NSString *)iconName;

@end
