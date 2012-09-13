//
//  UIUtility.m
//  ijoyplus
//
//  Created by joyplus1 on 12-9-13.
//  Copyright (c) 2012年 joyplus. All rights reserved.
//

#import "UIUtility.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIUtility

+ (void)customizeNavigationBar:(UINavigationBar *)navBar
{
    navBar.layer.shadowColor = [[UIColor blackColor] CGColor];
    navBar.layer.shadowOffset = CGSizeMake(0.0, 1.0);
    navBar.layer.shadowOpacity = 0.8;
}

+ (void)customizeToolbar:(UIToolbar *)toolbar
{
    UIImage *toobarImage = [[UIImage imageNamed:@"tool_bar_bg"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [toolbar setBackgroundImage:toobarImage forToolbarPosition:UIToolbarPositionBottom barMetrics:UIBarMetricsDefault];
}

+ (void)addTextShadow:(UILabel *)textLabel
{
    textLabel.layer.shadowOffset = CGSizeMake(0, 1);
    textLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    textLabel.layer.shadowOpacity = 0.5;
}
@end