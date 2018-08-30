//
//  JXView.m
//  OutSuperView
//
//  Created by 俊祥 on 2018/8/30.
//  Copyright © 2018年 俊祥. All rights reserved.
//

#import "JXView.h"

@implementation JXView

// 方案二
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    BOOL isInside = [super pointInside:point withEvent:event];
    if (isInside == YES) {
        return isInside;
    }

    for (UIView *subView in self.subviews) {
        CGPoint inViewPoint = [subView convertPoint:point fromView:self];
        BOOL isInsideSubView = [subView pointInside:inViewPoint withEvent:event];
//        BOOL isInsideSubView = CGRectContainsPoint(subView.bounds, inViewPoint);
        if (isInsideSubView == YES) {
            return isInsideSubView;
        }
    }

    return isInside;
}
@end
