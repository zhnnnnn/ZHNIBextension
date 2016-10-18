//
//  UIView+ZHNIBadd.h
//  ZHNIBextension
//
//  Created by zhn on 16/10/18.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIView (ZHNIBadd)

@property (nonatomic,assign) IBInspectable CGFloat zhn_cornerRadius;

@property (nonatomic,assign) IBInspectable CGFloat zhn_boderWidth;

@property (nonatomic,strong) IBInspectable UIColor * zhn_boderColor;

//=========== bottom line =============//

@property (nonatomic,assign) IBInspectable CGFloat zhn_bLWidth;

@property (nonatomic,assign) IBInspectable CGFloat zhn_bLPadding;

@property (nonatomic,strong) IBInspectable UIColor * zhn_bLColor;

@end
