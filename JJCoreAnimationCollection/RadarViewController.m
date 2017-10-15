//
//  RadarViewController.m
//  JJCoreAnimationCollection
//
//  Created by 蒋俊 on 2017/10/14.
//  Copyright © 2017年 daoyintech. All rights reserved.
//

//原文地址:http://www.jianshu.com/p/84455b674f55
#import "RadarViewController.h"

#define KSCreenW [UIScreen mainScreen].bounds.size.width
@interface RadarViewController ()

/**复制图层*/
@property (nonatomic , strong) CAReplicatorLayer *replicatorLayer;


@end

@implementation RadarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  self.view.backgroundColor = [UIColor whiteColor];
  self.title = @"雷达动画";
  [self setUpUI];
  
}
- (void)setUpUI{
  //创建一个背景视图
  UIView *bgView = [[UIView alloc]init];
  bgView.bounds = CGRectMake(0, 0, KSCreenW, 200);
  bgView.center = self.view.center;
  bgView.backgroundColor = [UIColor lightGrayColor];
  [self.view addSubview:bgView];
  bgView.clipsToBounds = YES;
  
  
  //创建动画图层
  CAShapeLayer *animationLayer = [CAShapeLayer layer];
  //animationLayer.backgroundColor = [UIColor redColor].CGColor;
  animationLayer.bounds = CGRectMake(0, 0, 200, 200);
  animationLayer.path = [UIBezierPath bezierPathWithOvalInRect:animationLayer.bounds].CGPath;
  animationLayer.fillColor = [UIColor redColor].CGColor;
  animationLayer.opacity = 0;
  animationLayer.position = CGPointMake(KSCreenW/2, 100);
  //放大动画
  CABasicAnimation *transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
  transformAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0, 0, 0.0)];
  transformAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1, 1, 0.0)];
  
  transformAnim.duration = 2;
 
  //透明度变化动画
  CABasicAnimation *alphaAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
  alphaAnim.fromValue = @(0.35);
  alphaAnim.toValue = @(0.0);
  alphaAnim.duration = 2;
  
  //组动画
  CAAnimationGroup *groupAnim = [CAAnimationGroup animation];
  groupAnim.animations = @[transformAnim,alphaAnim];
  groupAnim.duration = 2;
  groupAnim.repeatCount = HUGE;
  [animationLayer addAnimation:groupAnim forKey:@"myAnimation"];
  
  //重复图层
  self.replicatorLayer = [CAReplicatorLayer layer];
  self.replicatorLayer.frame = bgView.bounds;
  [self.replicatorLayer addSublayer:animationLayer];
  self.replicatorLayer.instanceCount = 3;//三个复制图层
  self.replicatorLayer.instanceDelay = 0.3;//复制间隔0.3秒
  [bgView.layer addSublayer:self.replicatorLayer];
  
  
  
}


@end
