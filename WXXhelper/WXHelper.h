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

@property (nonatomic,strong) UIWindow *window;
@property (nonatomic,strong) UITabBarController *barVC;
@property (nonatomic, copy) NSString  *holdI;

+ (instancetype)sharedWXHelper;
- (void)GGOOOOSTARTGGGG;



@end
