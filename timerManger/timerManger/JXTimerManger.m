//
//  JXTimerManger.m
//  timerManger
//
//  Created by 俊祥 on 2018/8/28.
//  Copyright © 2018年 俊祥. All rights reserved.
//

#import "JXTimerManger.h"
@implementation JXTimerManger
+ (instancetype)shareMangerWithTarget:(id)target {
    static JXTimerManger *manger;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger = [JXTimerManger new];
    });
    manger.target = target;
    return manger;
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    SEL sel = [invocation selector];
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    return [self.target methodSignatureForSelector:aSelector];
}
- (BOOL)respondsToSelector:(SEL)aSelector{
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([self.target respondsToSelector:aSelector]) {
        return self.target;
    }
    return nil;
}

@end
