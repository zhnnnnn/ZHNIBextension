//
//  UIView+ZHNIBadd.m
//  ZHNIBextension
//
//  Created by zhn on 16/10/18.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "UIView+ZHNIBadd.h"
#import <objc/runtime.h>

@implementation UIView (ZHNIBadd)

- (void)setZhn_boderColor:(UIColor *)zhn_boderColor{
    self.layer.borderColor = zhn_boderColor.CGColor;
}
- (UIColor *)zhn_boderColor{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}


- (void)setZhn_boderWidth:(CGFloat)zhn_boderWidth{
    self.layer.borderWidth = zhn_boderWidth/[UIScreen mainScreen].scale;
}
- (CGFloat)zhn_boderWidth{
    return self.layer.borderWidth;
}


- (void)setZhn_cornerRadius:(CGFloat)zhn_cornerRadius{
    self.layer.cornerRadius = zhn_cornerRadius;
}
- (CGFloat)zhn_cornerRadius{
   return self.layer.cornerRadius;
}

// ==========bottom line=========== //

- (void)setZhn_bLWidth:(CGFloat)zhn_bLWidth{
    objc_setAssociatedObject(self, @selector(zhn_bLWidth), @(zhn_bLWidth), OBJC_ASSOCIATION_ASSIGN);
}
- (CGFloat)zhn_bLWidth{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}


- (void)setZhn_bLPadding:(CGFloat)zhn_bLPadding{
    objc_setAssociatedObject(self, @selector(zhn_bLPadding), @(zhn_bLPadding), OBJC_ASSOCIATION_ASSIGN);
}
- (CGFloat)zhn_bLPadding{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}


- (void)setZhn_bLColor:(UIColor *)zhn_bLColor{
    objc_setAssociatedObject(self, @selector(zhn_bLColor), zhn_bLColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIColor *)zhn_bLColor{
    return objc_getAssociatedObject(self, _cmd);
}



+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(layoutSubviews);
        SEL swizzledSelector = @selector(zhn_layoutSubviews);
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}
- (void)zhn_layoutSubviews{
    [self zhn_layoutSubviews];
    [self p_addBottmLine];
}
- (void)p_addBottmLine{
    if (self.zhn_bLWidth < 0) {
        return;
    }
    CALayer * bottomLineLayer = [CALayer layer];
    bottomLineLayer.backgroundColor = self.zhn_bLColor.CGColor;
    CGFloat lineX = self.zhn_bLPadding;
    CGFloat lineH = self.zhn_bLWidth/[UIScreen mainScreen].scale;
    CGFloat lineW = self.frame.size.width - (2 * self.zhn_bLPadding);
    CGFloat lineY = self.frame.size.height - lineH;
    bottomLineLayer.frame = CGRectMake(lineX, lineY, lineW, lineH);
    [self.layer addSublayer:bottomLineLayer];
}




@end
