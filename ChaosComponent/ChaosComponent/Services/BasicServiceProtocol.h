//
//  BasicServiceProtocol.h
//  ChaosComponent
//
//  Created by jh on 2021/3/19.
//

#ifndef BasicServiceProtocol_h
#define BasicServiceProtocol_h

#import "BHServiceProtocol.h"
@protocol BasicServiceProtocol  <NSObject, BHServiceProtocol>
@property(nonatomic, strong) NSString *naviTitle;

@end

#endif /* BasicServiceProtocol_h */
