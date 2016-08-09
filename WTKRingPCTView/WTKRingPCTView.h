//
//  WTKRingPCTView.h
//  WTKRingPCTView
//
//  Created by 王同科 on 16/8/9.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WTKRingPCTView : UIView

@property(nonatomic,strong)UILabel *label;


/**
 *更新progress
 *progress 进度 0-100
 *strokColor 填充颜色
 *lineColor 线条颜色
 *width 线条宽度
 */
- (void)updateProgress:(CGFloat)progress withStrokColor:(UIColor *)strokColor lineColor:(UIColor *)lineColor withborderWidth:(CGFloat)width;

- (void)updateProgress:(CGFloat)progress;
@end
