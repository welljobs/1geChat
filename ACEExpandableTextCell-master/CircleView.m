//
//  CircleView.m
//  ACEExpandableTextCellDemo
//
//  Created by mac on 2017/5/4.
//  Copyright © 2017年 Stefano Acerbetti. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 计算中心点
    CGFloat centerX = (self.bounds.size.width - self.bounds.origin.x) / 2;
    CGFloat centerY = (self.bounds.size.height - self.bounds.origin.y) / 2;
    
    // 添加一个圆形
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX, centerY) radius:_radius-_lineWidth startAngle:0 endAngle:M_PI * 2 clockwise:YES];

//    [path addArcWithCenter:CGPointMake(centerX, centerY) radius:_radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    // 设置线条宽度
    path.lineWidth = _lineWidth;
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineCapRound; //终点处理
    // 设置线条颜色
    [_color setStroke];
    
    // 绘制线条
    [path stroke];
    
    if (_fill) {
        // 如果是实心圆，设置填充颜色
        [_color setFill];
        // 填充圆形
        [path fill];
    }
    [super drawRect:rect];
}


@end
