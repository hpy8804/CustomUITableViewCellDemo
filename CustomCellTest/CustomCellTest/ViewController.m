//
//  ViewController.m
//  CustomCellTest
//
//  Created by sven on 1/20/15.
//  Copyright (c) 2015 sven@abovelink. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self customSelfUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customSelfUI
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 100, 60, 40)];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pushToNew) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (void)pushToNew
{
    SecondViewController *vcSecond = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vcSecond animated:YES];
}


@end
