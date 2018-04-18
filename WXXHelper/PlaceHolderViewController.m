//
//  PlaceHolderViewController.m
//  CQWWYX
//
//  Created by cycle on 2018/4/7.
//  Copyright © 2018年 ddy. All rights reserved.
//

#import "PlaceHolderViewController.h"

@interface PlaceHolderViewController ()


@end

@implementation PlaceHolderViewController
/** 图片 */
- (UIImageView *)HolderImgView{
    if (!_HolderImgView) {
        _HolderImgView = [UIImageView new];
        _HolderImgView.frame = self.view.bounds;
    }
    return _HolderImgView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.HolderImgView];

}


@end
