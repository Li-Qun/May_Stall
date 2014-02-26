//
//  CommentViewController.m
//  Maystall
//
//  Created by ss4346 on 13-11-1.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentCell.h"

@interface CommentViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CommentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self createNavigationBarItem];
    
    //初始化数据
    commentArray = [[NSMutableArray alloc] initWithObjects:@"pinglun1", @"pinglun2", @"pinglun3", @"pinglun4",nil];
    [self addSubView];
    
   
}

#pragma -mark button action
- (void)backToPreviousView
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - TableView data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return commentArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //初始化cell部分
    static NSString *cellIdentifier = @"commentCell";
    CommentCell *cell = (CommentCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CommentCellNib" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }

    cell.titleLabel.text = [commentArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    int index =indexPath.row;
//    CompanyDetailViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"companyDetailView"];
//    view.dictionary = [allList objectAtIndex:indexPath.row];
//    [self.navigationController pushViewController:view animated:YES];
    return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

#pragma -mark add SubView
- (void)addSubView
{
    int height = [UIScreen mainScreen].bounds.size.height - [UIApplication sharedApplication].statusBarFrame.size.height -44;
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, height)];
    myTableView.backgroundColor = [UIColor clearColor];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"buy_line"]];
    
    UIImageView *borderTopLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"border_top_line"]];
    borderTopLine.frame = CGRectMake(0, 0, 320, 7);
    
    [self.view addSubview:myTableView];
    [self.view addSubview:borderTopLine];
}

- (void)createNavigationBarItem
{
    self.navigationItem.title = @"Comments";
    
    //左键
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 60, 31);
    [leftButton setTitle:@"Back" forState:UIControlStateNormal];
    [leftButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backToPreviousView) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] init];
    [leftItem setCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
