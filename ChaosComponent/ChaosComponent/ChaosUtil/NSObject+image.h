//
//  UIImageView+image.h
//  JHUniversalApp
//
//  Created by jh on 2021/7/17.
//  Copyright © 2021  William Sterling. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (image)

- (void)jh_setImageNamed:(NSString*)filename block:(void(^)(UIImage *image))block;

@end

NS_ASSUME_NONNULL_END
