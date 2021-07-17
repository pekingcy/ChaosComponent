//
//  UIImageView+image.m
//  JHUniversalApp
//
//  Created by jh on 2021/7/17.
//  Copyright © 2021  William Sterling. All rights reserved.
//

#import "NSObject+image.h"
#import "SDImageCoderHelper.h"
#import <objc/runtime.h>

@interface NSObject ()
@property(nonatomic,strong)NSMutableDictionary* memCache;
@end

@implementation NSObject (image)

- (void)jh_setImageNamed:(NSString*)filename block:(void(^)(UIImage *image))block;{
    //从内存去取，如果没取到，就直接读取文件，在缓存起来
     NSMutableDictionary* memDic = self.memCache;
     UIImage *image = [memDic objectForKey:filename];
     if(image){
         dispatch_async(dispatch_get_main_queue(), ^{
             if (block) {
                 block(image);
             }
         });
     }else{
         dispatch_queue_t  _ioQueue = dispatch_queue_create("com.jher.cache.disk", DISPATCH_QUEUE_CONCURRENT);
         dispatch_async(_ioQueue, ^{
             @autoreleasepool{
                 if(IS_NOT_EMPTY(filename)){
                     NSString* imagePath = @"";
                     if([filename rangeOfString:@".bundle/"].location==NSNotFound) {
                         NSString* filePath = filename;
                         if ([filename rangeOfString:@"@2x"].location==NSNotFound) {
                             filePath = [NSString stringWithFormat:@"%@@2x",filename];
                         }
                         imagePath = [[NSBundle mainBundle] pathForResource:filePath ofType:@"png"];
                     }else{
                         NSArray* array = [filename componentsSeparatedByString:@".bundle/"];
                         NSString* bundleName = array[0];
                         NSString* bundlePath =  [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
                         NSString* fileName = array[1];
                         if ([fileName rangeOfString:@"@2x"].location==NSNotFound) {
                             fileName = [NSString stringWithFormat:@"%@@2x",fileName];
                         }
                         imagePath = [[NSBundle bundleWithPath:bundlePath]pathForResource:fileName ofType:@"png"];
                     }
                     UIImage* image =[UIImage imageWithContentsOfFile:imagePath];
                     image = [SDImageCoderHelper decodedImageWithImage:image];
                      if (image && IS_NOT_EMPTY(filename)) {
                          NSMutableDictionary* memDic = self.memCache;
                          [memDic setObject:image forKey:filename];
                          self.memCache = memDic;
                      }
                      dispatch_async(dispatch_get_main_queue(), ^{
                          if (block) {
                              block(image);
                          }
                      });
                 }
             }
         });
     }
}

- (NSMutableDictionary *)memCache{
    NSMutableDictionary* memDic = objc_getAssociatedObject(self, @selector(memCache));
    if (!memDic) {
        memDic = [NSMutableDictionary dictionary];
    }
    return memDic;
}

- (void)setMemCache:(NSMutableDictionary *)memCache{
    objc_setAssociatedObject(self, @selector(memCache), memCache, OBJC_ASSOCIATION_RETAIN);
}

@end
