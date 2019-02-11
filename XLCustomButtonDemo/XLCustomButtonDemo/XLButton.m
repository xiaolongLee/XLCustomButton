//
//  XLButton.m
//  XLCustomButtonDemo
//
//  Created by Mac-Qke on 2019/2/11.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "XLButton.h"
#import "Masonry.h"
#import "UIView+XLExtension.h"
#import "XLFont.h"
#import "YYKit.h"
#define SCREEN_WIDTH        [[UIScreen mainScreen] bounds].size.width   //获取屏幕宽度
#define SCREEN_HEIGHT       [[UIScreen mainScreen] bounds].size.height  //获取屏幕高度
@implementation XLButton

- (UILabel *)buttonTitleLabel {
    if (!_buttonTitleLabel) {
        _buttonTitleLabel = [[UILabel alloc] init];
        _buttonTitleLabel.font = _titleFont;
        _buttonTitleLabel.textColor = _titleColor;
        [self addSubview:_buttonTitleLabel];
        [_buttonTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            if (self->_iconType == ButtonIconTypeNormal) {
                make.left.mas_equalTo(self.marginLeft);
                make.centerY.mas_equalTo(self);
            }else if (self->_iconType == ButtonIconTypeLeft){
                make.centerY.mas_equalTo(self);
                make.left.mas_equalTo(self.buttonIconLabel.mas_right).with.offset(self->_margin);
            }else if (self->_iconType == ButtonIconTypeTop){
                make.top.mas_equalTo(self.buttonIconLabel.mas_bottom).with.offset(self->_margin);
                make.height.mas_equalTo(self->_titleSize.height);
                make.centerX.mas_equalTo(self);
                
            }else if (self->_iconType == ButtonIconTypeBottom){
                make.top.mas_equalTo((self.xl_height - self->_titleSize.height - self->_iconSize.height - self->_margin)/2);
                make.height.mas_equalTo(self->_titleSize.height);
                make.centerX.mas_equalTo(self);
            }
        }];
        
        
    }
    
    
    return _buttonTitleLabel;
}


- (UILabel *)buttonIconLabel {
    if (!_buttonIconLabel) {
        _buttonIconLabel = [[UILabel alloc] init];
        _buttonIconLabel.font = [XLFont iconOutlineFontWithSize:_iconFontSize];
        _buttonIconLabel.textColor = _iconColor;
        [self addSubview:_buttonIconLabel];
        [_buttonIconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            if (self->_iconType == ButtonIconTypeNormal) {
                
                make.left.mas_equalTo(self.buttonTitleLabel.mas_right).with.offset(self->_margin);
                make.centerY.mas_equalTo(self);
            }else if (self->_iconType == ButtonIconTypeLeft){
                make.left.mas_equalTo(self.marginLeft);
                make.centerY.mas_equalTo(self);
            }else if (self->_iconType == ButtonIconTypeTop){
                make.top.mas_equalTo(self.marginTop);
                make.centerX.mas_equalTo(self);
                make.height.mas_equalTo(self->_iconSize.height);
            }else if (self->_iconType == ButtonIconTypeBottom){
                make.top.mas_equalTo(self.buttonTitleLabel.mas_bottom).with.offset(self->_margin);
                make.height.mas_equalTo(self->_iconSize.height);
                make.centerX.mas_equalTo(self);
            }
        }];
    }
    
    return _buttonIconLabel;
}


#pragma mark --间距的get方法
- (CGFloat)marginLeft{
    return (self.xl_width - _iconSize.width - _titleSize.width - _margin) / 2;
}

- (CGFloat)marginTop {
    return (self.xl_height - _titleSize.height - _iconSize.height - _margin) / 2;
}

- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon iconType:(ButtonIconType)iconType {
    if (self = [super init]) {
        self.layer.borderWidth = 1/(CGFloat)[UIScreen mainScreen].scale;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        NSAssert(title.length, @"title is null");
        NSAssert(icon.length, @"icon is null");
        _buttonTitle = title;
        _buttonIcon = icon;
        _iconType = iconType;
        _titleFontSize = 15;
        _iconFontSize = 15;
        _margin  = 5;
        _titleFont = [UIFont systemFontOfSize:_titleFontSize];
        _iconFont = [XLFont iconOutlineFontWithSize: _iconFontSize];
        _titleColor = [UIColor redColor];
        _iconColor  = [UIColor redColor];
        
        _titleSize = [title sizeForFont:_titleFont size:CGSizeMake(SCREEN_WIDTH, _titleFontSize * 2) mode: NSLineBreakByWordWrapping];
        _iconSize = [icon sizeForFont:_iconFont size:CGSizeMake(SCREEN_WIDTH, _iconFontSize) mode:0];
        [self getTotalWidth];
    }
    
    return self;
}

#pragma mark -- 设置按钮数据
- (void)setupUI{
    self.buttonTitleLabel.text = self.buttonTitle;
    self.buttonIconLabel.text = self.buttonIcon;
}

#pragma mark -- 设置标题数据 （调用此方法可重写设置按钮标题）
- (void)setButtonTitle:(NSString *)buttonTitle {
    if (buttonTitle.length) {
        _buttonTitle = buttonTitle;
        self.buttonTitleLabel.text = buttonTitle;
        _titleSize = [_buttonTitle sizeForFont:_titleFont size:CGSizeMake(SCREEN_WIDTH, _titleFontSize * 2) mode:NSLineBreakByWordWrapping];
        [self getTotalWidth];
        [self mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.totalWidth);
        }];
        [self.superview layoutIfNeeded];
        self.marginLeft = (self.width - _titleSize.width - _iconSize.width - _margin)/2;
        if (self.iconType == ButtonIconTypeNormal){
            [self.buttonTitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.marginLeft);
            }];
        }else if (self.iconType == ButtonIconTypeLeft){
            [self.buttonIconLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.marginLeft);
            }];
        }
    }
}


#pragma mark -- 计算总宽度
- (void)getTotalWidth{
    if(_iconType == ButtonIconTypeNormal || _iconType == ButtonIconTypeLeft) {
        self.totalWidth = _titleSize.width + _iconSize.width + _margin * 3;
    }else{
        self.totalWidth  = _titleSize.width + _margin * 2;
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
