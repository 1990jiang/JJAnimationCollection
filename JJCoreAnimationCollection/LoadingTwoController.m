//
//  LoadingTwoController.m
//  JJCoreAnimationCollection
//
//  Created by 蒋俊 on 2017/10/15.
//  Copyright © 2017年 daoyintech. All rights reserved.
//

//原文地址:http://www.jianshu.com/p/ece59bf9c3bc
#import "LoadingTwoController.h"
#define KSCreenW [UIScreen mainScreen].bounds.size.width
@interface LoadingTwoController ()

@end

@implementation LoadingTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
 
  self.view.backgroundColor = [UIColor whiteColor];
  self.title = @"加载动画2";
  
  [self initSubLayer:CGRectMake(150, 200, 150, 150)];
  
}

- (void)initSubLayer:(CGRect)frame{
  CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
  replicatorLayer.frame = frame;
  //延迟的时间
  replicatorLayer.instanceDelay = 0.6 / 5;
  //重复个数
  replicatorLayer.instanceCount = 5;
  //间隔
  replicatorLayer.instanceTransform = CATransform3DMakeTranslation(10,0,0);
  CAShapeLayer *shape = [CAShapeLayer layer];
  shape.frame = CGRectMake(0, 0, 3,40);
  shape.lineWidth = 3;
  shape.lineCap = kCALineCapRound;
  shape.strokeColor = [UIColor redColor].CGColor;
  
  UIBezierPath* path = [UIBezierPath bezierPath];
  [path moveToPoint:CGPointMake(1.5, 0)];
  [path addLineToPoint:CGPointMake(1.5, shape.frame.size.height)];
  shape.path = path.CGPath;
  
  [shape addAnimation:[self extendAnimation] forKey:@"scaleAnimation"];
  
  [replicatorLayer addSublayer:shape];
  
  [self.view.layer addSublayer:replicatorLayer];
  
  
  
}

- (CABasicAnimation*)extendAnimation
{
  CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
  scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 0.0)];
  scale.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1, 1.0/5, 0.0)];
  scale.autoreverses = YES;
  scale.repeatCount = HUGE;
  scale.duration = 0.6;
  return scale;
}


@end
