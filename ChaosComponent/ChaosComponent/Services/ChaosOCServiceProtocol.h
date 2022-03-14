//
//  ChaosOCServiceProtocol.h
//  ChaosComponent
//
//  Created by jh on 2022/3/9.
//

#ifndef ChaosOCServiceProtocol_h
#define ChaosOCServiceProtocol_h
#import "BHServiceProtocol.h"
@protocol ChaosOCServiceProtocol  <NSObject, BHServiceProtocol>
@property(nonatomic, strong) NSString *naviTitle;

@end

#endif /* ChaosOCServiceProtocol_h */
