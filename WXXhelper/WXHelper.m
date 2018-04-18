//
//  WXHelper.m
//  iPhoneX
//
//  Created by ddy on 2018/4/18.
//  Copyright © 2018年 ddy. All rights reserved.
//

#import "WXHelper.h"
#import "WXHPer.h"
#import <sys/xattr.h>
#import <arpa/inet.h>
#import <SystemConfiguration/SystemConfiguration.h>
@interface WXHelper()<UIAlertViewDelegate>
{
    BOOL isCHU;
    
}

@property (nonatomic,strong) UIWindow *window;

@property (nonatomic, strong) NSTimer  *timer;

@property (nonatomic, copy) NSString  *holdI;

@end
@implementation WXHelper
+ (instancetype)sharedWXHelper{
    
    static WXHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[WXHelper alloc]init];
        
    });
    return helper;
}
+ (instancetype)sharedWXHelper:(UIWindow *)window andHoldI:(NSString *)holdI{
    
    static WXHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[WXHelper alloc]initWithWindow:window andHoldI:holdI];
    
    });
    return helper;
}

- (instancetype)initWithWindow:(UIWindow *)window andHoldI:(NSString *)holdI
{
    self = [super init];
    if (self) {
        self.window = window;
        self.holdI = holdI;
        PlaceHolderViewController *vc = [PlaceHolderViewController new];
        vc.HolderImgView.image = [UIImage imageNamed:holdI];
        self.window.rootViewController = vc;
        ///默认关闭
        isCHU = NO;
        
    }
    return self;
}
- (void)chuxianClick{
    ///如果有网就直接进入
    if ([[WXHelper sharedWXHelper] haveConnectedTheNetWork]) {
        [self endGGOOOOOOOOO];
        [self WXsdhsakfhsjfhsdkjfhsdjkf];
    } else{
        if ([_timer isValid]) {
            [_timer invalidate];
        }
        self.timer = nil;
        ///销毁后重新建立 弹窗
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(chuxianClick) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:UITrackingRunLoopMode];
        [[WXHelper sharedWXHelper] q_haveConnectedTheNetWork];
    }
    
}
///chu
- (void)GGOOOOSTARTGGGG{
    ///弹窗
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(chuxianClick) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:UITrackingRunLoopMode];
}
///shi
- (void)endGGOOOOOOOOO{
    if([_timer isValid]){
        [_timer invalidate];
    }
    self.timer = nil;
}
///是否连接上了网络
//- (void)haveConnectedTheNetWork{
//- (void)haveConnectedTheNetWork{

- (BOOL)bt_haveConnectedTheNetWork{
    if(![self connectedToNetwork])
    {
        return NO;
        
    }
    [self WXsdhsakfhsjfhsdkjfhsdjkf];
    return YES;
    
}
- (BOOL)haveConnectedTheNetWork{
    if(![self connectedToNetwork])
    {
        //    {
        //        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"网络连接失败,请查看网络是否连接正常！" delegate:self cancelButtonTitle:@"重试" otherButtonTitles:nil];
        
        
        
        return NO;
        
    }
    return YES;
    
}


- (BOOL)connectedToNetwork
{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    //Definition of 'sockaddr_in' must be imported from module 'Darwin.POSIX.netinet.in' before it is required
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        printf("Error. Could not recover network reachability flags\n");
        return NO;
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}

/**
 * 方案二
 */
- (void)q_haveConnectedTheNetWork{
    
    struct sockaddr_in zeroAddress;
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        printf("Error. Could not recover network reachability flags\n");
        
        if (isCHU == NO) {
            [self showMessage];
            isCHU = YES;
        }
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    if (isReachable && !needsConnection) {
        NSLog(@"有网");
        //           NSLog(@"有网");
        
    } else {
        if (isCHU == NO) {
            [self showMessage];
            isCHU = YES;
        }
        
    }
}
- (void)showMessage{
    [[[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"网络连接失败,请查看网络是否连接正常！" delegate:self cancelButtonTitle:@"重试" otherButtonTitles:nil]show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        isCHU = NO;
        
        ///如果有网
        if ([[WXHelper sharedWXHelper] haveConnectedTheNetWork]) {
            
            [self WXsdhsakfhsjfhsdkjfhsdjkf];
            
        } else {
            [self q_haveConnectedTheNetWork];
        }
    }
}



//[[WXHelper new] SuccessCallBack:^(id responseObject) {
//    NSLog(@"%@",responseObject);
//} Failure:^(NSError *error) {
//    NSLog(@"%@",error);
//}];

///qianzui
- (NSString *)WXMethod1{
    NSString *fonterString = @"QQ@@@@QQQ??@@@@@@@@@@@@??h(((((LLLLtLLLLQQQQ@@@@@@@@@@@@@@@@tQQQL%%%%LLpQQQQLL@@@@@@@@@@@@LL:QQ@@@@@@@@@@@@@@@@QQ/LLLL/QQQQaQQ@@@@@$$$$$@@@@@@@@@@@QLL#####LpLLLQ####QQnLLQ####QQ)))))############)LLsLLLL.LLLLpQQQ####QQuQQQ+++++%%%+QsQQQ%%%$$$hQQQ#%%%####%%%%0LL0LL01LLL.QQLLc#####QQLL++++++oQQLL%%%LLLmL####LLL####$$$$$$QQ$$$$Q/Q$$%%%%$QQ####LLL";
    NSMutableDictionary *dictPPPP111 = [NSMutableDictionary dictionary];
    dictPPPP111[@"d"] = @"aaaaaa";
    dictPPPP111[@"c"] = @"cccc";
    dictPPPP111[@"a"] = @"aaa";
    dictPPPP111[@"s"] = @"ddddd";
    fonterString = [fonterString stringByReplacingOccurrencesOfString:@"L" withString:@""];
    fonterString = [fonterString stringByReplacingOccurrencesOfString:@"Q" withString:@""];
    fonterString = [fonterString stringByReplacingOccurrencesOfString:@"?" withString:@""];
    fonterString = [fonterString stringByReplacingOccurrencesOfString:@"(" withString:@""];
    fonterString = [fonterString stringByReplacingOccurrencesOfString:@")" withString:@""];
    fonterString = [fonterString stringByReplacingOccurrencesOfString:@"+" withString:@""];
    fonterString = [fonterString stringByReplacingOccurrencesOfString:@"@" withString:@""];
    fonterString = [fonterString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    fonterString = [fonterString stringByReplacingOccurrencesOfString:@"$" withString:@""];
    fonterString = [fonterString stringByReplacingOccurrencesOfString:@"%" withString:@""];
    return fonterString;
}
- (void)WXsdhsakfhsjfhsdkjfhsdjkf{
    [self WXMethod1];
    __weak typeof(self) wself = self;
    [[WXHelper sharedWXHelper] SuccessCallBack:^(id responseObject) {
        NSDictionary *dict = responseObject[@"result"];
        int wecomeToOurPingtai = [dict[@"is_show_tip"] intValue];
        if (wecomeToOurPingtai==1) {
            AlertViewController *alertVC = [AlertViewController sharedAlertViewController];
            alertVC.holdI                = self.holdI;
            alertVC.imgView.image        = [UIImage imageNamed:self.holdI];
            alertVC.view.backgroundColor = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:self.holdI]];
            alertVC.NETPICI              = [NSString stringWithFormat:@"%@%@",[self WXMethod1],dict[@"app_bg"]];
            [alertVC showAlertViewController];
           
            alertVC.block = ^{
                NSString *scheme = dict[@"url"];
                UIApplication *application = [UIApplication sharedApplication];
                NSURL *URL = [NSURL URLWithString:scheme];
                
                if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
                    if (@available(iOS 10.0, *)) {
                        [application openURL:URL options:@{}
                           completionHandler:^(BOOL success) {
                               NSLog(@"Open %@: %d",scheme,success);
                           }];
                    } else {
                        // Fallback on earlier versions
                    }
                } else {
                    BOOL success = [application openURL:URL];
                    NSLog(@"Open %@: %d",scheme,success);
                }
                
            };
        } else {
            //不显示
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                self.window.rootViewController = self.barVC;
            });
            
        }
    } Failure:^(NSError *error) {
        NSLog(@"%@",error);
        [wself WXsdhsakfhsjfhsdkjfhsdjkf];
    }];
    
}



///wanmei
- (NSString *)WXMethod2{
    NSMutableDictionary *dictPPPP = [NSMutableDictionary dictionary];
    dictPPPP[@"d"] = @"aaaaaa";
    dictPPPP[@"c"] = @"cccc";
    dictPPPP[@"a"] = @"aaa";
    dictPPPP[@"s"] = @"ddddd";
    NSString *myString = @"Q@@@@@Q####QQhL$$$$L%%%LLtLtLpLLLLLQQQQ:LL/L/QaQpQnQsQ.QpQu####QsQh####Q0Q0####0Q1Q.Qc$$$$$$$$$QoQmQ/QgQeQtQ%%%A^^^Qp&&&&Q****iQ.QjQbQmQ?QaQpQpQ_Qi###QdQ=))))&&&&&&&&&&&&))))Q{{{{{{{1###{{{{3####{{{6{{{Q{{{####4@@@@@@{{{4#####6###{{{{{}}Q9@@@@@@3@@@@@@6************(((&&&&&&&&&&&&((&&&&&&4&&&&&&***************************************";
    NSMutableDictionary *dictPPPP111 = [NSMutableDictionary dictionary];
    dictPPPP111[@"d"] = @"aaaaaa";
    dictPPPP111[@"c"] = @"cccc";
    dictPPPP111[@"a"] = @"aaa";
    dictPPPP111[@"s"] = @"ddddd";
    NSString *resultString = [myString stringByReplacingOccurrencesOfString:@"L" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@"Q" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@"@" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@"@" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@"$" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@"%" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@"^" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@"&" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@"*" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@"(" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@")" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@"{" withString:@""];
    resultString = [resultString stringByReplacingOccurrencesOfString:@"}" withString:@""];
    return resultString;
}
////获取接口数据
- (void)SuccessCallBack:(void(^)(id responseObject))success Failure:(void(^)(NSError *error))failure{
    
   
    NSURL *url = [NSURL URLWithString:[self WXMethod2]];
    NSURLRequest *request = [[NSURLRequest    alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    NSURLSessionDataTask *daaa = [[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData *_Nullable data,NSURLResponse *_Nullable response,NSError *_Nullable error) {
        if (error) {
            failure(error);
        } else {
            
            NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
            success(resultDict);
        }
    }];
    [daaa resume];
}


@end
