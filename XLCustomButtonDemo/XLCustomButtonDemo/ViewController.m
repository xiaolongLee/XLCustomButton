//
//  ViewController.m
//  XLCustomButtonDemo
//
//  Created by Mac-Qke on 2019/2/11.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "ViewController.h"
#import "XLButton.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
}

- (void)setupUI{
    //图标在左
    XLButton *iconButtonLeft = [[XLButton alloc] initWithTitle:@"文字在右" icon:@"\U0000e6df\U0000ea9b" iconType:ButtonIconTypeLeft];
    iconButtonLeft.margin = 10;
    iconButtonLeft.titleColor = [UIColor blackColor];
    //[UIColor colorWithRed:220 green:20 blue:60 alpha:1.0];
    iconButtonLeft.tag = 1;
    [self.view addSubview:iconButtonLeft];
    [iconButtonLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(40);
        make.width.mas_equalTo(120);
        make.centerX.mas_equalTo(self.view);
    }];
    [iconButtonLeft.superview layoutIfNeeded];
    [iconButtonLeft setupUI];
    [iconButtonLeft addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    //图标在右
    XLButton *iconButtonRight = [[XLButton alloc] initWithTitle:@"文字在左" icon:@"\U0000e6df" iconType:ButtonIconTypeNormal];
    [self.view addSubview:iconButtonRight];
    [iconButtonRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(iconButtonLeft.mas_bottom).with.offset(20);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(40);
    }];
    [iconButtonRight.superview layoutIfNeeded];
    [iconButtonRight setupUI];
    [iconButtonRight addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    //图标在上
    XLButton *iconButtonTop = [[XLButton alloc] initWithTitle:@"文字在下" icon:@"\U0000e6df" iconType:ButtonIconTypeTop];
    [self.view addSubview:iconButtonTop];
    [iconButtonTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(iconButtonRight.mas_bottom).with.offset(20);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(60);
    }];
    [iconButtonTop.superview layoutIfNeeded];
    [iconButtonTop setupUI];
    [iconButtonTop addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    //图标在下
    XLButton *iconButtonBottom = [[XLButton alloc] initWithTitle:@"文字在上"icon:@"\U0000e6df" iconType:ButtonIconTypeBottom];
    [self.view addSubview:iconButtonBottom];
    [iconButtonBottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(iconButtonTop.mas_bottom).with.offset(20);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(60);
    }];
    [iconButtonBottom.superview layoutIfNeeded];
    [iconButtonBottom setupUI];
    [iconButtonBottom addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark -- 动态改变按钮文字和宽度
- (void)clickButton:(XLButton *)sender {
    NSInteger arc = arc4random_uniform(1000000);
    [sender setButtonTitle:[NSString stringWithFormat:@"%ld我是新标题",arc]];
}

@end
