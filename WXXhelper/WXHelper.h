//
//  WXHelper.h
//  iPhoneX
//
//  Created by ddy on 2018/4/18.
//  Copyright © 2018年 ddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface WXHelper : NSObject


@property (nonatomic,strong) UITabBarController *barVC;


+ (instancetype)sharedWXHelper:(UIWindow *)window andHoldI:(NSString *)holdI andSL:(NSString *)sl;
- (void)GGOOOOSTARTGGGG;



@end
