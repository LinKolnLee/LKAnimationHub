//
//  ViewController.m
//  LKAnimationHubExample
//
//  Created by llk on 2018/10/19.
//  Copyright © 2018年 Beauty. All rights reserved.
//

#import "ViewController.h"
#import "LKAnimationHub/LKAnimationHub.h"
@interface ViewController ()
@property(nonatomic,assign)BOOL animation;

@property(nonatomic,strong)UIButton * actionBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.actionBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

-(UIButton *)actionBtn{
    if (!_actionBtn) {
        _actionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionBtn.frame = CGRectMake(150, 500, 100, 40);
        _actionBtn.backgroundColor = [UIColor blackColor];
        [_actionBtn setTitle:@"开始" forState:UIControlStateNormal];
        [_actionBtn setTitle:@"结束" forState:UIControlStateSelected];
        [_actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_actionBtn addTarget:self action:@selector(actionBtnTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionBtn;
}
-(void)actionBtnTouchUpInside:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [[LKAnimationHub shareManager] startAnimating];
    }else{
        [[LKAnimationHub shareManager] stopAnimating];
    }
}
@end
