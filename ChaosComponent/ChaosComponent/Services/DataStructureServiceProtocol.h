//
//  BasicServiceProtocol.h
//  ChaosComponent
//
//  Created by jh on 2021/3/19.
//

#ifndef DataStructureServiceProtocol_h
#define DataStructureServiceProtocol_h

#import "BHServiceProtocol.h"
@protocol DataStructureServiceProtocol  <NSObject, BHServiceProtocol>
@property(nonatomic, strong) NSString *naviTitle;

@end

#endif /* BasicServiceProtocol_h */
