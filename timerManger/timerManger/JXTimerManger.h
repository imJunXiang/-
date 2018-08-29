//
//  JXTimerManger.h
//  timerManger
//
//  Created by 俊祥 on 2018/8/28.
//  Copyright © 2018年 俊祥. All rights reserved.
//

#import <Foundation/Foundation.h>
/** timer 中介者 */
@interface JXTimerManger : NSObject
@property (nonatomic ,weak) id target;
+ (instancetype)shareMangerWithTarget:(id)target;
@end
