//
//  ZYSplashViewController.m
//  RecieveInfoLoad
//
//  Created by 尹成真 on 16/4/26.
//  Copyright © 2016年 crystal. All rights reserved.
//

#import "ZYSplashViewController.h"

#define Animation_Duration 1.6f
#define Hide_Duration 0.4f
@interface ZYSplashViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *splashBg;
@property (weak, nonatomic) IBOutlet UIImageView *splashLogo;

@end

@implementation ZYSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startSplashAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startSplashAnimation {
    
     self.splashBg.transform = CGAffineTransformIdentity;
    [UIView beginAnimations:nil context:NULL];
    /* Make the animation 5 seconds long */
    [UIView setAnimationDuration:Animation_Duration];
    //图形放大两倍
    self.splashBg.transform = CGAffineTransformMakeScale(1.04f, 1.04f);
    /* Commit the animation */
    [UIView commitAnimations];
    [self performSelector:@selector(splashHideAnimation) withObject:nil afterDelay:Animation_Duration];
}

- (void)splashHideAnimation {
    
    __weak ZYSplashViewController *weakSelf = self;
    [UIView animateWithDuration:Hide_Duration animations:^{
      
        weakSelf.splashBg.alpha = 0;
        weakSelf.splashLogo.alpha = 0;
    } completion:^(BOOL finished) {
        
        if(finished) {
            
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
