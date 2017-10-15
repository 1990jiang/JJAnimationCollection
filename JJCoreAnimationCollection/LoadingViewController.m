//
//  LoadingViewController.m
//  JJCoreAnimationCollection
//
//  Created by 蒋俊 on 2017/10/15.
//  Copyright © 2017年 daoyintech. All rights reserved.
//


//原文地址:http://www.jianshu.com/p/84455b674f55
#import "LoadingViewController.h"

#define KSCreenW [UIScreen mainScreen].bounds.size.width
@interface LoadingViewController ()
/**复制图层*/
@property (nonatomic , strong) CAReplicatorLayer *replicatorLayer;
@end

@implementation LoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
  self.view.backgroundColor = [UIColor whiteColor];
  self.title = @"加载动画";
  [self setUpUI];
  
  
}
- (void)setUpUI{
  //1.背景View
  UIView *animationView = [[UIView alloc]init];
  animationView.bounds = CGRectMake(0, 0, KSCreenW, 300);
  animationView.center = self.view.center;
  [self.view addSubview:animationView];
  animationView.backgroundColor = [UIColor lightGrayColor];
  animationView.clipsToBounds = YES;
  
  //2.layer
  CAShapeLayer *animLayer = [CAShapeLayer layer];
  animLayer.backgroundColor = [UIColor redColor].CGColor;
  animLayer.bounds = CGRectMake(0, 0, 20, 20);
  animLayer.position = CGPointMake(self.view.bounds.size.width/2, 50);
  animLayer.borderColor = [UIColor whiteColor].CGColor;
  animLayer.cornerRadius = 10;
  animLayer.borderWidth = 1;
  animLayer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1);
  
  //3.动画
  CABasicAnimation *transAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
  transAnim.duration = 2;
  transAnim.repeatCount = HUGE;
  transAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
  transAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 0.1)];
  
  [animLayer addAnimation:transAnim forKey:nil];
  
  //4.重复图层
  self.replicatorLayer = [CAReplicatorLayer layer];
  self.replicatorLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width, 300);
  [self.replicatorLayer addSublayer:animLayer];
  self.replicatorLayer.instanceCount = 20;
  self.replicatorLayer.instanceDelay = 0.1;
  
  //关键布局
  CGFloat angle = 2*M_PI / 20;
  self.replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle,0 , 0, 1);
  
  [animationView.layer addSublayer:self.replicatorLayer];
  
}


@end
