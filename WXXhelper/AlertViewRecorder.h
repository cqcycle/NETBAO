//
//  AlertViewRecorder.h
//  CQWWYX
//
//  Created by ddy on 2018/3/28.
//  Copyright © 2018年 ddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertViewRecorder : NSObject
@property (nonatomic, strong)NSMutableArray * alertViewArray;

+ (AlertViewRecorder *)shareAlertViewRecorder;


@end
