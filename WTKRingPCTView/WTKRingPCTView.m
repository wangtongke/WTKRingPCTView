//
//  WTKRingPCTView.m
//  WTKRingPCTView
//
//  Created by 王同科 on 16/8/9.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import "WTKRingPCTView.h"

@interface WTKRingPCTView ()
//线条颜色
@property(nonatomic,strong)UIColor *lineColor;
@property(nonatomic,strong)UIColor *strokColor;
@property(nonatomic,assign)CGFloat progress;
@property(nonatomic,assign)CGFloat width;


@end

@implementation WTKRingPCTView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self configView];
    }
    return self;
}

- (void)configView
{
    self.backgroundColor    = [UIColor clearColor];
    self.label          = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.label.textAlignment  = NSTextAlignmentCenter;
    [self addSubview:self.label];
    
    self.progress       = 0;
    self.width          = 2;
    self.lineColor      = [UIColor grayColor];
    self.strokColor     = [UIColor redColor];
}

- (void)updateProgress:(CGFloat)progress withStrokColor:(UIColor *)strokColor lineColor:(UIColor *)lineColor withborderWidth:(CGFloat)width
{
    self.progress   = progress;
    self.width      = width;
    self.lineColor  = lineColor;
    self.strokColor = strokColor;
    
    [self setNeedsDisplay];
    
}
- (void)updateProgress:(CGFloat)progress
{
    self.progress   = progress;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
//    画整个环形背景
    CGContextRef contextRef1   = UIGraphicsGetCurrentContext();
    
    CGPoint center1             = CGPointMake(rect.size.width / 2, rect.size.width / 2);
    CGFloat radius1             = rect.size.width / 2.0 - self.width * 2;
    CGFloat start1              = -M_PI_2;
    CGFloat end1                = -M_PI_2 + M_PI *  2;
    
    UIBezierPath *path1         = [UIBezierPath bezierPathWithArcCenter:center1 radius:radius1 startAngle:start1 endAngle:end1 clockwise:YES];
    CGContextSetLineWidth(contextRef1, self.width);
    [self.lineColor setStroke];
    CGContextAddPath(contextRef1, path1.CGPath);
    CGContextStrokePath(contextRef1);
    
    
//    画所需要的百分比
    CGContextRef contextRef2   = UIGraphicsGetCurrentContext();
//    设置中心，半径
    CGPoint center2             = CGPointMake(rect.size.width / 2, rect.size.width / 2);
    CGFloat radius2             = rect.size.width / 2.0 - self.width * 2;
    CGFloat start2              = -M_PI_2;
    CGFloat end2                = -M_PI_2 + M_PI * 2 *  self.progress / 100;
    
    UIBezierPath *path2         = [UIBezierPath bezierPathWithArcCenter:center2 radius:radius2 startAngle:start2 endAngle:end2 clockwise:YES];
//    线条宽度
    CGContextSetLineWidth(contextRef2, self.width);
//    线条颜色
    [self.strokColor setStroke];
//    把路径添加到上下文
    CGContextAddPath(contextRef2, path2.CGPath);
//    渲染
    CGContextStrokePath(contextRef2);
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

@end
