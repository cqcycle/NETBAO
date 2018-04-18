//
//  AlertViewController.h
//  CQWWYX
//
//  Created by ddy on 2018/3/28.
//  Copyright © 2018年 ddy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^tapBlock)(void);
@interface AlertViewController : UIViewController


@property (nonatomic, copy) NSString  *holdI;
@property (nonatomic, copy) NSString  *NETPICI;
/** 点击图片  */
@property (nonatomic, copy) tapBlock block;

+ (instancetype)sharedAlertViewController;

- (void)showAlertViewController;


@end
