//
//  ViewController.m
//  RecieveInfoLoad
//
//  Created by 尹成真 on 16/4/19.
//  Copyright © 2016年 crystal. All rights reserved.
//

#import "ViewController.h"
#import "LoadView.h"
#import "spiritView.h"

@interface ViewController ()
@property (strong, nonatomic) LoadView *loadingView;
@property (strong, nonatomic) spiritView *spView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    _loadingView = [[LoadView alloc] initWithMainView:self.view];
    UIButton *startBnt = [UIButton buttonWithType:UIButtonTypeCustom];
    startBnt.frame = CGRectMake(100, 200, 60, 30);
    [startBnt setTitle:@"加载" forState:UIControlStateNormal];
    [startBnt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [startBnt addTarget:self action:@selector(startLoad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBnt];
    
    UIButton *stopBnt = [UIButton buttonWithType:UIButtonTypeCustom];
    stopBnt.frame = CGRectMake(170, 200, 80, 30);
    [stopBnt setTitle:@"停止加载" forState:UIControlStateNormal];
    [stopBnt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [stopBnt addTarget:self action:@selector(stopLoad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopBnt];
    
    UIButton *showBnt = [UIButton buttonWithType:UIButtonTypeCustom];
    showBnt.frame = CGRectMake(120, 250, 80, 30);
    [showBnt setTitle:@"show" forState:UIControlStateNormal];
    [showBnt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [showBnt addTarget:self action:@selector(showTips) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBnt];
    
    UIButton *hideBnt = [UIButton buttonWithType:UIButtonTypeCustom];
    hideBnt.frame = CGRectMake(120, 300, 80, 30);
    [hideBnt setTitle:@"hide" forState:UIControlStateNormal];
    [hideBnt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [hideBnt addTarget:self action:@selector(hideTips) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hideBnt];
    
    _spView = [[spiritView alloc] init];
    _spView.frame = CGRectMake(10, 400, _spView.frame.size.width, _spView.frame.size.height);
    
    [self.view addSubview:_spView];
    [_spView showWithTips:@"你好JoyMason"];
    
}

- (void)startLoad {
    
    [_loadingView start];
}

- (void)stopLoad {
    
    [_loadingView stop];
}

- (void)showTips {
    

    [_spView showWithTips:@"你好JoyMason啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦我大二发发色法恩爱"];
}

- (void)hideTips {
    
    [_spView hide];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
