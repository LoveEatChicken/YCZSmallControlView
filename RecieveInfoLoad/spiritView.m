//
//  spiritView.m
//  RecieveInfoLoad
//
//  Created by 尹成真 on 16/4/25.
//  Copyright © 2016年 crystal. All rights reserved.
//

#import "spiritView.h"
#define MaxWidth 215
#define LeftMargin 38
#define RightMargin 16
#define TopMargin 10
#define Delay_Time 3
#define FontSize 16
#define LabelWidth 150
#define LabelHeight 16
#define RGB(a, b, c) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:1.0]

@interface spiritView()

@property (strong, nonatomic) UIImageView *icon;
@property (strong, nonatomic) UILabel *tipLabel;
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) CGRect iconFrame;
@end

@implementation spiritView


- (instancetype)init {
    
    if (self = [super init]) {
        
        UIImage *bgImg = [UIImage imageNamed:@"spirit"];
        [self setImage:bgImg];
        [self setStretch];
        self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(7, 5.5, 25, 25)];
        self.iconFrame = self.icon.frame;
        [self.icon setImage:[UIImage imageNamed:@"spiritFace"]];
        [self addSubview:self.icon];
        
        self.tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, TopMargin, LabelWidth, LabelHeight)];
//        self.tipLabel.backgroundColor = [UIColor blueColor];
        self.tipLabel.numberOfLines = 0;
        [self.tipLabel setFont:[UIFont systemFontOfSize:FontSize]];
        self.tipLabel.textColor = RGB(245, 166, 35);
        [self addSubview:self.tipLabel];
        [self setHidden:YES];
    }
    
    return self;
}

- (void)setStretch {
    
    UIEdgeInsets  insertEdge = UIEdgeInsetsMake(self.image.size.height * 0.5, RightMargin, self.image.size.height * 0.5, RightMargin);
    self.image = [self.image resizableImageWithCapInsets:insertEdge resizingMode:UIImageResizingModeStretch];
}

- (CGSize)showWithTips:(NSString *)tips {
    
    [self stopTiming];
    self.tipLabel.text = tips;
    CGSize newSize = [self resetFrameWithTips:tips];
    [self setHidden:NO];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:Delay_Time target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
    return newSize;
}

- (void)hide {
    
    if ([self isHidden]) {
        
        return;
    }
    
    [self setHidden:YES];
}

- (void)stopTiming {
    
    if (self.timer) {
        [self.timer invalidate];
    }
}
- (CGSize)resetFrameWithTips:(NSString *)tips {
 
    CGRect tipLabelFrame = self.tipLabel.frame;
    CGRect frame = self.frame;
    
    
    CGFloat contentWidth = [self caculateContentWidthStr:tips];
    if (contentWidth > MaxWidth) {
        
        CGFloat ContentHeight = [self caculateContentHeightStr:tips];
        tipLabelFrame.size.width = MaxWidth;
        tipLabelFrame.size.height = ContentHeight;
        frame.size.width = MaxWidth + LeftMargin + RightMargin;
        frame.size.height = ContentHeight + TopMargin * 2;
        _iconFrame.origin.y = 9.5;
    } else {
        
        tipLabelFrame.size.width = contentWidth;
        tipLabelFrame.size.height = LabelHeight;
        frame.size.width = contentWidth + LeftMargin + RightMargin;
        frame.size.height = self.image.size.height;
        _iconFrame.origin.y = 5.5;
    }
    
    self.frame = frame;
    self.tipLabel.frame = tipLabelFrame;
    self.icon.frame = _iconFrame;
    return frame.size;
    
}

- (CGFloat)caculateContentWidthStr:(NSString *)str {
    
    CGRect newFrame = [str boundingRectWithSize:CGSizeMake(0, LabelHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:FontSize]}  context:nil];
    
    return newFrame.size.width;
}

- (CGFloat)caculateContentHeightStr:(NSString *)str {
    
    CGRect newFrame = [str boundingRectWithSize:CGSizeMake(MaxWidth, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:FontSize]}  context:nil];
    
    return newFrame.size.height;
}

@end
