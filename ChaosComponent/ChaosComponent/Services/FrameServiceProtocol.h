//
//  FrameServiceProtocol.h
//  ChaosComponent
//
//  Created by jh on 2021/3/8.
//

#ifndef FrameServiceProtocol_h
#define FrameServiceProtocol_h

#import <Foundation/Foundation.h>
#import "BHServiceProtocol.h"

@protocol FrameServiceProtocol <NSObject, BHServiceProtocol>


@property(nonatomic, strong) NSString *itemId;


@end

#endif /* FrameServiceProtocol_h */
