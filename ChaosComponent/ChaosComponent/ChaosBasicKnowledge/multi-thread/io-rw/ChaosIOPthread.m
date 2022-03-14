//
//  ChaosIOPthread.m
//  ChaosComponent
//
//  Created by jh on 2022/3/9.
//

#import "ChaosIOPthread.h"
#import <pthread.h>
@interface ChaosIOPthread()
@property (nonatomic,assign) pthread_rwlock_t lock;
@end

@implementation ChaosIOPthread
- (instancetype)init
{
    self = [super init];
    if (self) {
       pthread_rwlock_init(&_lock, NULL);
       dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
       for (int i = 0; i<10; i++) {
           dispatch_async(queue, ^{
               [self read];
           });
           dispatch_async(queue, ^{
               [self read];
           });
           dispatch_async(queue, ^{
               [self write];
           });
       }
    }
    return self;
}

-(void)read{
    pthread_rwlock_rdlock(&_lock);
    sleep(1);
    NSLog(@"%s",__func__);
    pthread_rwlock_unlock(&_lock);
}
-(void)write{
    pthread_rwlock_wrlock(&_lock);
    sleep(1);
    NSLog(@"%s",__func__);
    pthread_rwlock_unlock(&_lock);
}
-(void)dealloc{
    pthread_rwlock_destroy(&_lock);
}

@end
