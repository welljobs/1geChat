//
//  CircleView.h
//  ACEExpandableTextCellDemo
//
//  Created by mac on 2017/5/4.
//  Copyright © 2017年 Stefano Acerbetti. All rights reserved.
//

#import <UIKit/UIKit.h>

// 在定义类的前面加上IB_DESIGNABLE宏
IB_DESIGNABLE // 动态刷新

@interface CircleView : UIView
@property (nonatomic, assign) IBInspectable CGFloat lineWidth; // 圆形线条的宽度
@property (nonatomic, assign) IBInspectable CGFloat radius; // 圆形的半径
@property (nonatomic, strong) IBInspectable UIColor *color; // 绘制的颜色
@property (nonatomic, assign) IBInspectable BOOL fill; // 是否填充，是不是实心圆
@end
