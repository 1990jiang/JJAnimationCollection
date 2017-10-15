//
//  ViewController.m
//  JJCoreAnimationCollection
//
//  Created by 蒋俊 on 2017/10/14.
//  Copyright © 2017年 daoyintech. All rights reserved.
//

#import "ViewController.h"
#import "RadarViewController.h"//01-雷达动画
#import "LoadingViewController.h"//02-加载动画
#import "LoadingTwoController.h"//03-加载动画2


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/**tableView*/
@property (nonatomic , strong) UITableView *tableView;
/**数据源数组*/
@property (nonatomic , strong) NSArray *dataArr;


@end
static NSString *cellID = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self.view addSubview:self.tableView];
  
}

#pragma mark -- 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
  return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
  if (cell == nil) {
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
  }
  cell.textLabel.text = [NSString stringWithFormat:@"%ld-%@",indexPath.row +1 ,self.dataArr[indexPath.row]];
  cell.selectionStyle = UITableViewCellSelectionStyleNone;
  cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  return cell;
  
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  if (indexPath.row == 0) {
    RadarViewController *radarVc = [[RadarViewController alloc]init];
    [self.navigationController pushViewController:radarVc animated:YES];
  }else if (indexPath.row == 1){
    LoadingViewController *loadVc = [[LoadingViewController alloc]init];
    [self.navigationController pushViewController:loadVc animated:YES];
  }else if(indexPath.row == 2){
    LoadingTwoController *loadTwoVc = [[LoadingTwoController alloc]init];
    [self.navigationController pushViewController:loadTwoVc animated:YES];
  }
 
  
  
  
}


//懒加载
- (UITableView *)tableView {
  if (!_tableView){
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height - 60) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
  }
  return _tableView;
}

- (NSArray *)dataArr {
  if (!_dataArr){
    _dataArr = @[@"雷达动画",@"加载动画",@"加载动画2"];
  }
  return _dataArr;
}

@end
