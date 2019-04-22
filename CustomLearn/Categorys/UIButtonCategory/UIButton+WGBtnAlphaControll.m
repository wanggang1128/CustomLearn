//
//  UIButton+WGBtnAlphaControll.m
//  CustomLearn
//
//  Created by wanggang on 2019/4/19.
//  Copyright © 2019 WG. All rights reserved.
//

#import "UIButton+WGBtnAlphaControll.h"

@implementation UIButton (WGBtnAlphaControll)

- (void)titlePosition:(UIViewContentMode)position space:(CGFloat)space{
    
    CGRect imageSize = [self imageRectForContentRect:self.frame];
    CGSize labelSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    
    //图片宽高
    CGFloat imageWith =imageSize.size.width;
    CGFloat imageHeight = imageSize.size.height;
    //标题宽高
    CGFloat labelWidth = labelSize.width;
    CGFloat labelHeight = labelSize.height;
    
    //imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    //方便理解的一句话:left以右为正方向,right以左为正方向,top向下为正,bottom向上为正
    switch (position) {
        case UIViewContentModeTop:{
            //标题在上
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -(labelHeight+space), -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-(imageHeight+space), -imageWith, 0, 0);
            break;
        }
        case UIViewContentModeLeft:{
            //标题在左
            imageEdgeInsets = UIEdgeInsetsMake(0, (labelWidth+space/2), 0, -(labelWidth+space/2));
            labelEdgeInsets = UIEdgeInsetsMake(0, -(imageWith+space/2), 0, (imageWith+space/2));
            break;
        }
        case UIViewContentModeBottom:{
            //标题在下
            imageEdgeInsets = UIEdgeInsetsMake(-(labelHeight+space), 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -(imageHeight+space), 0);
            break;
        }
        case UIViewContentModeRight:{
            //标题在右
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space/2);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, -space/2);
            break;
        }
        default:
            break;
    }

    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

@end
