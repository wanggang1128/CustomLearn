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
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
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

    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}
//- (void)titlePosition:(UIViewContentMode)position space:(CGFloat)space{
//
//    // 1. 得到imageView和titleLabel的宽、高
//    CGFloat imageWith = self.imageView.frame.size.width;
//    CGFloat imageHeight = self.imageView.frame.size.height;
//
//    CGFloat labelWidth = 0.0;
//    CGFloat labelHeight = 0.0;
//    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
//        // 由于iOS8中titleLabel的size为0，用下面的这种设置
//        labelWidth = self.titleLabel.intrinsicContentSize.width;
//        labelHeight = self.titleLabel.intrinsicContentSize.height;
//    } else {
//        labelWidth = self.titleLabel.frame.size.width;
//        labelHeight = self.titleLabel.frame.size.height;
//    }
//
//    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
//    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
//    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
//
//    //3.默认为图左,文字右,所以设置偏移量的时候 根据这个默认位置 来设置偏移量
//    //方便理解的一句话:left以右为正方向,right以左为正方向,top向下为正,bottom向上为正
//    switch (position) {
//        case UIViewContentModeTop:{
//
//            /*
//             相对于默认位置
//             label需要
//             上移 图片高度和间距的一半(imageHeight+space)/2:即top和bottom都需要上移,正负根据上面那句话来理解
//             左移 图片宽度一半:即left和right都需要左移,才能居中,正负根据上面那句话
//
//             image需要
//             下移 label高度和间距的一半(labelHeight+space)/2
//             右移 label宽度的一半
//             */
//
//            labelEdgeInsets = UIEdgeInsetsMake(-(imageHeight+space)/2, -imageWith/2, (imageHeight+space)/2, imageWith/2);
//            imageEdgeInsets = UIEdgeInsetsMake((labelHeight+space)/2, labelWidth/2, -(labelHeight+space)/2, -labelWidth/2);
//
//            break;
//        }
//        case UIViewContentModeLeft:{
//
//            labelEdgeInsets = UIEdgeInsetsMake(0, -(imageWith+space/2), 0, (imageWith+space/2));
//            imageEdgeInsets = UIEdgeInsetsMake(0, (labelWidth+space/2), 0, -(labelWidth+space/2));
//            break;
//        }
//        case UIViewContentModeBottom:{
//
//            labelEdgeInsets = UIEdgeInsetsMake((imageHeight+space)/2, -imageWith/2, -(imageHeight+space)/2, imageWith/2);
//            imageEdgeInsets = UIEdgeInsetsMake(-(labelHeight+space)/2, labelWidth/2, (labelHeight+space)/2, -labelWidth/2);
//            break;
//        }
//        case UIViewContentModeRight:{
//            //默认
//            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space/2);
//            labelEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, -space/2);
//            break;
//        }
//        default:
//            break;
//    }
//    // 4. 赋值
//    self.titleEdgeInsets = labelEdgeInsets;
//    self.imageEdgeInsets = imageEdgeInsets;
//}

@end
