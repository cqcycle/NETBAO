//
//  AlertViewController.m
//  CQWWYX
//
//  Created by ddy on 2018/3/28.
//  Copyright © 2018年 ddy. All rights reserved.
//

#import "AlertViewController.h"

#import "WXHPer.h"

@interface AlertViewController ()
/** CycleAlertManager */
@property (nonatomic, strong) CycleAlertManager  *alertManager;
@property (nonatomic, strong)  UIImageView *imgView;

@end

@implementation AlertViewController
-(void)setNETPICI:(NSString *)NETPICI
{
    _NETPICI = NETPICI;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:NETPICI] placeholderImage:[UIImage imageNamed:self.holdI]];
    
        self.imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ClickTap)];
        [self.imgView addGestureRecognizer:tap];
    

    
}
-(void)setImgView:(UIImageView *)imgView{
    _imgView = imgView;
    [self setNETPICI:self.NETPICI];
}
/** CycleAlertManager */
- (CycleAlertManager *)alertManager{
    if(!_alertManager){
        _alertManager = [CycleAlertManager sharedCycleAlertManager];
    }
    return  _alertManager;
}
+ (instancetype)sharedAlertViewController{
    return [[self alloc]init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.imgView = [[UIImageView alloc]init];
        self.imgView.frame = CGRectMake(0, 0, KSCREENWIDTH_, KSCREENHEIGHT_);
        [self.view addSubview:self.imgView];
        self.imgView.image = [UIImage imageNamed:self.holdI];
        
        self.imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ClickTap)];
        [self.imgView addGestureRecognizer:tap];
        if (self.NETPICI.length) {
            [self.imgView sd_setImageWithURL:[NSURL URLWithString:self.NETPICI] placeholderImage:[UIImage imageNamed:self.holdI]];
        }
        
    }
    return self;
}
- (void)ClickTap{
    if (self.block) {
        self.block();
    }
}
-(void)showAlertViewController{
    // WS(weakSelf);
    self.transitioningDelegate = self.alertManager;
    self.modalPresentationStyle = UIModalPresentationCustom;
    ///视图大小

    CGFloat alert_w = KSCREENWIDTH_;
    CGFloat alert_h = KSCREENHEIGHT_;
    //    CGFloat alert_x = (screen_width-alert_w)*0.5;
    //    CGFloat alert_y = (screen_height-alert_h)*0.5;
        CGFloat alert_x = 0;
        CGFloat alert_y = 0;
    ///设置相关属性
    self.alertManager.presentedFrame = CGRectMake(alert_x, alert_y, alert_w, alert_h);
    ///不填写默认中心弹出
    self.alertManager.coverViewBgColor = [UIColor blackColor];
    self.alertManager.coverViewAlpha = 0.3;
    self.alertManager.AlertDirection = alertViewDirectionTypeCenter;
    self.alertManager.canClickBgView = NO;///不能点击背景
    ///弹出
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:self animated:YES completion:nil];;
}
-(void)dealloc{
    self.alertManager = nil;
}


















@end
