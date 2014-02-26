//
//  SuccessViewController.m
//  Maystall
//
//  Created by ss4346 on 13-11-6.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "SuccessViewController.h"

@interface SuccessViewController ()

@end

@implementation SuccessViewController

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
    [self createNavigationItem];
    [self mainView];
}

#pragma -mark button action
- (void)backToPreviousView
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma -mark add subView
- (void)mainView
{
    UIImageView *borderTopLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"border_top_line"]];
    borderTopLine.frame = CGRectMake(0, 0, 320, 7);
    
    UILabel *prompt = [[UILabel alloc] initWithFrame:CGRectMake(5, 7, 320, 40)];
    prompt.text = @"Success";
    prompt.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    prompt.backgroundColor = [UIColor clearColor];
    
    UITextView *content = [[UITextView alloc] initWithFrame:CGRectMake(5, 42, 320, 200)];
    content.text = @"#$^$^(*HGTRTD&（（*…………%#￥#（*&&%#……%￥……&（*&%%#&%（……&&*%#￥%￥……&……￥%……#%%（*&……&%#￥……%￥……#@￥#@……%……%￥#@￥%#%……%&……￥#%￥￥%##%……￥%&……*";
    content.font = [UIFont fontWithName:@"Helvetica" size:13];
    content.backgroundColor = [UIColor clearColor];
    content.editable = NO;
    content.autoresizesSubviews= YES;
    
    [self.view addSubview:borderTopLine];
    [self.view addSubview:prompt];
    [self.view addSubview:content];
}

- (void)createNavigationItem
{
    self.navigationItem.title = @"Get Back Password";
    
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
