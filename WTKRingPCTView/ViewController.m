//
//  ViewController.m
//  WTKRingPCTView
//
//  Created by 王同科 on 16/8/9.
//  Copyright © 2016年 王同科. All rights reserved.
//

#import "ViewController.h"
#import "WTKRingPCTView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WTKRingPCTView *view    = [[WTKRingPCTView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.label.text         = @"45.20%";
    [self.view addSubview:view];
    
    [view updateProgress:45.20 withStrokColor:[UIColor redColor] lineColor:[UIColor grayColor] withborderWidth:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
