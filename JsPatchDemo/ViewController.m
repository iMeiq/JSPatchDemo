//
//  ViewController.m
//  JsPatchDemo
//
//  Created by meiqing on 15/12/12.
//  Copyright © 2015年 meiqing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* mytableView;
@property(nonatomic,strong)NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad
{
    
    UITableView* tv = [[UITableView alloc]initWithFrame:self.view.bounds
                                                  style:UITableViewStylePlain];
    self.mytableView = tv;
    self.mytableView.delegate = self;
    self.mytableView.dataSource = self;
    [self.view addSubview:self.mytableView];
    
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* i=  @"cell";
    UITableViewCell* cell = [tableView  dequeueReusableCellWithIdentifier:i];
    if (cell == nil ) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:i];
    }
    //我在这里给cell的标题是"meiqing",通过JS修改成了"meijiaqing"
    cell.textLabel.text = @"meiqing";
    //我在这里给cell的背景颜色是白色，但是上线后发现红色更好看，我就在JS里写了红色。
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.dataSource = @[@"1",@"2"];
    // cell有三行，当我点击第三行的时候肯定会数组越界导致 crash
    //  还好我在JS里弥补了这个bug，详情请看JS里的处理
    NSString *content = self.dataSource[indexPath.row];
    NSLog(@"content = %@",content);
}

@end
