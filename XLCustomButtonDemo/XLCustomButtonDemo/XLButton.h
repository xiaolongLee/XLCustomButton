//
//  XLButton.h
//  XLCustomButtonDemo
//
//  Created by Mac-Qke on 2019/2/11.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  默认图标在右边
 */
typedef NS_ENUM(NSInteger,ButtonIconType) {
    ButtonIconTypeNormal = 0,
    ButtonIconTypeLeft,
    ButtonIconTypeTop,
    ButtonIconTypeBottom
};

NS_ASSUME_NONNULL_BEGIN

@interface XLButton : UIButton
/** 标题标签 */
@property (nonatomic, strong) UILabel *buttonTitleLabel;
/** 字体图标标签 */
@property (nonatomic, strong) UILabel *buttonIconLabel;
/** 标题 */
@property (nonatomic, copy) NSString *buttonTitle;
/** 图标 */
@property (nonatomic, strong) NSString *buttonIcon;
/** 图标类型 */
@property (nonatomic, assign) ButtonIconType iconType;
/** 公共间距 */
@property (nonatomic, assign) CGFloat margin;
/** 左间距 */
@property (nonatomic, assign) CGFloat marginLeft;
/** 上间距 */
@property (nonatomic, assign) CGFloat marginTop;
/** 按钮总宽度(包含间距) */
@property (nonatomic, assign) CGFloat totalWidth;
/** 字体 */
@property (nonatomic, strong) UIFont *titleFont;
/** 字体大小 */
@property (nonatomic, assign) CGFloat titleFontSize;
/** 字体size */
@property (nonatomic, assign) CGSize titleSize;
/** 图标字体 */
@property (nonatomic, strong) UIFont *iconFont;
/** 图标字体大小 */
@property (nonatomic, assign) CGFloat iconFontSize;
/** 图标size*/
@property (nonatomic, assign) CGSize iconSize;
/** 标题颜色*/
@property (nonatomic, strong) UIColor *titleColor;
/** 图标颜色*/
@property (nonatomic, strong) UIColor *iconColor;

- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon iconType:(ButtonIconType)iconType;
- (void)setupUI;
@end

NS_ASSUME_NONNULL_END
