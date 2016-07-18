//
//  LoadView.m
//  RecieveInfoLoad
//
//  Created by 尹成真 on 16/4/19.
//  Copyright © 2016年 crystal. All rights reserved.
//

#import "LoadView.h"

#define Width  27.5
#define Height 6.5
#define Animate_Duration 1.4
#define UIScreenMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define UIScreenMainScreenHeight [UIScreen mainScreen].bounds.size.height

@interface LoadView()

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation LoadView

- (id)initWithMainView:(UIView *)mainView {
    
    if (self = [super init]) {
        
        _mainView = mainView;
        self.frame = CGRectMake(20, UIScreenMainScreenHeight - 30, Width, Height);
        [self configImageView];
    }
    return self;
}

- (void)configImageView {
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 0; i < 4;  i++) {
        
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"load%d",i+1]];
        [imageArray addObject:image];
    }
    
    self.imageView.animationImages = imageArray;
    self.imageView.animationDuration = Animate_Duration;
    self.imageView.animationRepeatCount = 0;
    [self addSubview:self.imageView];
}

- (void)start {
    
    if (![self superview]) {
        
        [_mainView addSubview:self];
    }
    
    if ([self.imageView isAnimating]) {
        
        return;
    }
    
    [self.imageView startAnimating];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:10.0f target:self selector:@selector(stop) userInfo:nil repeats:0];
}

- (void)stop {
    
    if (self.timer) {
        
        [self.timer invalidate];
        self.timer = nil;
    }
    if ([self superview]) {
            
        [self.imageView stopAnimating];
        [self removeFromSuperview];
    }
}

@end
