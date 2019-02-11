//
//  XLFont.h
//  XLCustomButtonDemo
//
//  Created by Mac-Qke on 2019/2/11.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLFont : NSObject

+ (instancetype)font;

/**
 *  图标字体 实心
 *
 *  @param size <#size description#>
 *
 *  @return <#return value description#>
 */

+ (UIFont *)iconGlphyFontWithSize:(CGFloat)size;

/**
 *  图标字体 空心
 *
 *  @param size <#size description#>
 *
 *  @return <#return value description#>
 */
+ (UIFont *)iconOutlineFontWithSize:(CGFloat)size;

/**
 *  图标字体 实心 Mini
 *
 *  @param size <#size description#>
 *
 *  @return <#return value description#>
 */
+ (UIFont *)iconMiniFontWithSize:(CGFloat)size;
@end

NS_ASSUME_NONNULL_END
