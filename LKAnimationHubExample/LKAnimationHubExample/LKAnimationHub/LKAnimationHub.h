//
//  LKAnimationHub.h
//  LKAnimationHubExample
//
//  Created by llk on 2018/10/19.
//  Copyright © 2018年 Beauty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LKAnimationView.h"
NS_ASSUME_NONNULL_BEGIN

@interface LKAnimationHub : NSObject

+ (LKAnimationHub *)shareManager;

- (void)startAnimating;

- (void)stopAnimating;

@property (nonatomic,strong) LKAnimationView * loadView;


@end

NS_ASSUME_NONNULL_END
