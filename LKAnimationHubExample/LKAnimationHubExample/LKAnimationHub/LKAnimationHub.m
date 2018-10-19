//
//  LKAnimationHub.m
//  LKAnimationHubExample
//
//  Created by llk on 2018/10/19.
//  Copyright © 2018年 Beauty. All rights reserved.
//

#import "LKAnimationHub.h"
#define kScreenWidth    ([[UIScreen mainScreen] bounds].size.width)
#define kScreenHeight   ([[UIScreen mainScreen] bounds].size.height)
#define kWidth 40

@implementation LKAnimationHub

+ (LKAnimationHub *)shareManager
{
    static LKAnimationHub * shareManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[LKAnimationHub alloc]init];
        shareManager.loadView = [[LKAnimationView alloc] initWithFrame:CGRectMake((kScreenWidth-kWidth)/2, (kScreenHeight-kWidth)/2, kWidth, kWidth)];
        [[UIApplication sharedApplication].keyWindow addSubview:shareManager.loadView];
    });
    return shareManager;
}
-(void)startAnimating{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.loadView startAnimating];
    });
}
-(void)stopAnimating{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.loadView stopAnimating];
        });
    });
}

@end
