//
//  SecondViewController.m
//  CustomCellTest
//
//  Created by sven on 1/21/15.
//  Copyright (c) 2015 sven@abovelink. All rights reserved.
//

#import "SecondViewController.h"
#import "Collection.h"
#import "CustomTableViewCell.h"

#define APP_Frame_Height ([[UIScreen mainScreen] applicationFrame].size.height)
#define APP_Frame_Width  ([[UIScreen mainScreen] applicationFrame].size.width)
@interface SecondViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_mutArr;
    UIButton *_btnEdit;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSelfData];
    [self customSelfUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)initSelfData
{
    _mutArr = [NSMutableArray array];
    
    Collection *collection1 = [[Collection alloc] init];
    collection1.title = @"青岛的地下9层 看到最后一层小伙伴们给跪了";
    collection1.arrPics = @[@"img_bedroom_1", @"img_bedroom_2", @"img_bedroom_3"];
    collection1.resource = @"信网";
    collection1.commentsCount = @"55";
    collection1.time = @"54分钟前";
    
    Collection *collection2 = [[Collection alloc] init];
    collection2.title = @"辽河油田院党委书记周耗被带走 媒体称系周永康侄子";
    collection2.arrPics = @[@"img_bedroom_1"];
    collection2.resource = @"手机人民网";
    collection2.commentsCount = @"54";
    collection2.time = @"54分钟前";
    
    Collection *collection3 = [[Collection alloc] init];
    collection3.title = @"银行打死都不会说的十个秘密！";
    collection3.arrPics = @[@"img_bedroom_1", @"img_bedroom_2", @"img_bedroom_3"];
    collection3.resource = @"九个头条";
    collection3.commentsCount = @"20";
    collection3.time = @"12-29 13:33";
    
    Collection *collection4 = [[Collection alloc] init];
    collection4.title = @"青岛的地下9层 看到最后一层小伙伴们给跪了";
    collection4.arrPics = @[@"img_bedroom_1", @"img_bedroom_2", @"img_bedroom_3", @"img_bedroom_2"];
    collection4.resource = @"信网";
    collection4.commentsCount = @"55";
    collection4.time = @"54分钟前";
    
    [_mutArr addObject:collection1];
    [_mutArr addObject:collection2];
    [_mutArr addObject:collection3];
    [_mutArr addObject:collection4];
}
- (void)customSelfUI
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, APP_Frame_Width, APP_Frame_Height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _btnEdit = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btnEdit setTitle:@"编辑" forState:UIControlStateNormal];
    [_btnEdit setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [_btnEdit setFrame:CGRectMake(0, 0, 40, 30)];
    [_btnEdit addTarget:self action:@selector(handleEdit:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_btnEdit];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

#pragma mark - tableview delegate & datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_mutArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strIndentifier = @"CustomTableViewCell";
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIndentifier];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strIndentifier];
    }
    cell.collection = _mutArr[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Collection *collotionCell = _mutArr[indexPath.row];
    if ([collotionCell.arrPics count] >= 3) {
        return 150;
    }else{
        return 80;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_mutArr removeObjectAtIndex:indexPath.row];
    [_tableView reloadData];
}

#pragma mark -
- (void)handleEdit:(UIButton *)btn
{
    if (_tableView.editing) {
        [_tableView setEditing:NO animated:YES];
        [btn setTitle:@"编辑" forState:UIControlStateNormal];
    }else{
        [_tableView setEditing:YES animated:YES];
        [btn setTitle:@"完成" forState:UIControlStateNormal];
    }
}

@end
