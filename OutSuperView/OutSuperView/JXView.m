//
//  JXView.m
//  OutSuperView
//
//  Created by 俊祥 on 2018/8/30.
//  Copyright © 2018年 俊祥. All rights reserved.
//

#import "JXView.h"

@implementation JXView

// 方案一
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (!view) {
        for (UIView *subView in self.subviews) {
            // 这一步是转换坐标系
            CGPoint myPoint = [subView convertPoint:point fromView:self];
            // hitTest 先判断 透明度、是否可点击 在判断是否在 bounds 内
            return [subView hitTest:myPoint withEvent:event];
        }
    }

    return view;

}

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
