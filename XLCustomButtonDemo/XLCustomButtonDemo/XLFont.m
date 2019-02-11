//
//  XLFont.m
//  XLCustomButtonDemo
//
//  Created by Mac-Qke on 2019/2/11.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "XLFont.h"

@implementation XLFont

+ (instancetype)font {
    static XLFont *font;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        font = [[XLFont alloc] init];
    });
    return font;
}

+ (UIFont *)iconGlphyFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"icomoon-glyph" size:size];
}

+ (UIFont *)iconMiniFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"icomoon-mini" size:size];
}
//字体2.9之后，字体名称变成了 nucleo-outline,2.4是 icomoon
+ (UIFont *)iconOutlineFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"icomoon" size:size];
}
@end
