//
//  ShoppingCartViewController.m
//  Maystall
//
//  Created by ss4346 on 13-10-29.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "MayColorValue.h"

@interface ShoppingCartViewController ()

@end

@implementation ShoppingCartViewController

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
    
    
	[self setNavigationBarTitleWithText:@"Shopping Cart"];
    
    //初始化数据
    allSelected = NO;
    goods = [[NSMutableArray alloc] init];
    
    [self createView];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark 
#pragma custom method
- (void)selectallMethod
{
    NSLog(@"select all");
    if (allSelected) {
        
    }
}

#pragma -mark tableview datasource delgate
- (void)createView
{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    topView.backgroundColor = TAB_COLOR_DARK;
    
    UILabel *totalPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 100, 20)];
    totalPriceLabel.backgroundColor = [UIColor clearColor];
    totalPriceLabel.text = @"Total price:";
    totalPriceLabel.textColor = TAB_COLOR_LIGHT;
    totalPriceLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    [topView addSubview:totalPriceLabel];
    
    totalPrice = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 100, 20)];
    totalPrice.textColor = [UIColor redColor];
    totalPrice.text = @"￥200.00";
    totalPrice.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    [topView addSubview:totalPrice];
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 30, 50, 20)];
    priceLabel.textColor = TAB_COLOR_LIGHT;
    priceLabel.text = @"price:";
    priceLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    [topView addSubview:priceLabel];
    
    price = [[UILabel alloc] initWithFrame:CGRectMake(85, 30, 100, 20)];
    price.textColor = [UIColor redColor];
    price.text = @"￥200.00";
    price.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    [topView addSubview:price];
    
    UILabel *cashBackLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 30, 70, 20)];
    cashBackLabel.textColor = TAB_COLOR_LIGHT;
    cashBackLabel.text = @"cashback:";
    cashBackLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    [topView addSubview:cashBackLabel];
    
    cashBack = [[UILabel alloc] initWithFrame:CGRectMake(220, 30, 100, 20)];
    cashBack.textColor = [UIColor redColor];
    cashBack.text = @"￥2000.00";
    cashBack.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    [topView addSubview:cashBack];
    
    UIButton *selectAll = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
    selectAll.backgroundColor = [UIColor yellowColor];
    [selectAll addTarget:self action:@selector(selectallMethod) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:selectAll];
    
    mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 320, VIEW_HEIGHT-99)];
    mainTableView.backgroundColor = [UIColor clearColor];
    mainTableView.dataSource = self;
    mainTableView.delegate = self;
    mainTableView.separatorColor= [UIColor clearColor];
    mainTableView.sectionHeaderHeight = 2.0;
    mainTableView.sectionFooterHeight = 2.0;
    
    [self.view addSubview:topView];
    [self.view addSubview:mainTableView];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"cartCell";
    
    CartCell *cell = (CartCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CartCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];

        cell = [[CartCell alloc] init];
         
    }
    
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
    
    
}


@end
