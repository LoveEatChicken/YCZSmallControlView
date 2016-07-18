//
//  JMLoadView.m
//  RecieveInfoLoad
//
//  Created by 尹成真 on 16/4/25.
//  Copyright © 2016年 crystal. All rights reserved.
//

#import "JMLoadView.h"
#define Width  10
#define Height 10
#define Animate_Duration 1.4
#define Blink_Druation 1.0
#define UIScreenMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define UIScreenMainScreenHeight [UIScreen mainScreen].bounds.size.height

@interface JMLoadView()

@property (strong, nonatomic) UIImageView *firstPoint;
@property (strong, nonatomic) UIImageView *secondPoint;
@property (strong, nonatomic) UIImageView *thirdPoint;
@end

@implementation JMLoadView

- (instancetype)initWithMainView:(UIView *)mainView {
    
    if (self = [super init]) {
       
        self.frame = CGRectMake(20, UIScreenMainScreenHeight - 30, 50, 10);
        _firstPoint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loadPoint"]];
        _secondPoint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loadPoint"]];
        _thirdPoint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loadPoint"]];
        
    }
    
    return self;
}

- (void)configPointPosition {
    
    NSArray *pointArray = [NSArray arrayWithObjects:_firstPoint, _secondPoint, _thirdPoint, nil];
    
}

@end
