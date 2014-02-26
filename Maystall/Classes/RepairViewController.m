//
//  RepairViewController.m
//  Maystall
//
//  Created by ss4346 on 13-11-6.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import "RepairViewController.h"
#import "MayColorValue.h"

@interface RepairViewController ()

@end

@implementation RepairViewController

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
- (void)btnColorAction
{
    if (btnColor.selected) {
        btnColor.selected = NO;
    }else{
        btnColor.selected = YES;
    }
}

- (void)btnSizeAction
{
    if (btnSize.selected) {
        btnSize.selected = NO;
    }else{
        btnSize.selected = YES;
    }
}

- (void)btnQualityAction
{
    if (btnQuality.selected) {
        btnQuality.selected = NO;
    }else{
        btnQuality.selected = YES;
    }
}

- (void)btnReturnAction
{
    if (btnReturn.selected) {
        btnReturn.selected = NO;
    }else{
        btnReturn.selected = YES;
    }
}

- (void)btnReplaceAction
{
    if (btnReplace.selected) {
        btnReplace.selected = NO;
    }else{
        btnReplace.selected = YES;
    }
}

- (void)backToPreviousView
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma -mark add subview
- (void)mainView
{
    self.view = [[TPKeyboardAvoidingScrollView alloc] init];
    
    UIImageView *borderTopLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"border_top_line"]];
    borderTopLine.frame = CGRectMake(0, 0, 320, 7);
    
    UITextView *content = [[UITextView alloc] initWithFrame:CGRectMake(15, 7, 290, 150)];
    content.text = @"#$^$^(*HGTRTD&（（*…………%#￥#（*&&%#……%￥……&（*&%%#&%（……&&*%#￥%￥……&……￥%……#%%（*&……&%#￥……%￥……#@￥#@……%……%￥#@￥%#%……%&……￥#%￥￥%##%……￥%&……*";
    content.textColor = GREY_TEXT;
    content.font = [UIFont fontWithName:@"Helvetica" size:13];
    content.backgroundColor = [UIColor clearColor];
    content.editable = NO;
    content.autoresizesSubviews= YES;
    
    btnColor = [[UIButton alloc] initWithFrame:CGRectMake(15, 142, 13, 13)];
    [btnColor setBackgroundImage:[UIImage imageNamed:@"btn_frame_m"] forState:UIControlStateNormal];
    [btnColor setBackgroundImage:[UIImage imageNamed:@"btn_frame_m"] forState:UIControlStateHighlighted];
    [btnColor setBackgroundImage:[UIImage imageNamed:@"icon_right_m"] forState:UIControlStateSelected];
    [btnColor addTarget:self action:@selector(btnColorAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *labelColor = [[UILabel alloc] initWithFrame:CGRectMake(30, 142, 30, 13)];
    labelColor.font = [UIFont fontWithName:@"Helvetica" size:9];
    labelColor.backgroundColor = [UIColor clearColor];
    labelColor.text = @"color";
    labelColor.textColor = GREY_TEXT;
    
    btnSize = [[UIButton alloc] initWithFrame:CGRectMake(90, 142, 13, 13)];
    [btnSize setBackgroundImage:[UIImage imageNamed:@"btn_frame_m"] forState:UIControlStateNormal];
    [btnSize setBackgroundImage:[UIImage imageNamed:@"btn_frame_m"] forState:UIControlStateHighlighted];
    [btnSize setBackgroundImage:[UIImage imageNamed:@"icon_right_m"] forState:UIControlStateSelected];
    [btnSize addTarget:self action:@selector(btnSizeAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *labelSize = [[UILabel alloc] initWithFrame:CGRectMake(103, 142, 30, 13)];
    labelSize.font = [UIFont fontWithName:@"Helvetica" size:9];
    labelSize.backgroundColor = [UIColor clearColor];
    labelSize.text = @"size";
    labelSize.textColor = GREY_TEXT;
    
    
    btnQuality = [[UIButton alloc] initWithFrame:CGRectMake(165, 142, 13, 13)];
    [btnQuality setBackgroundImage:[UIImage imageNamed:@"btn_frame_m"] forState:UIControlStateNormal];
    [btnQuality setBackgroundImage:[UIImage imageNamed:@"icon_right_m"] forState:UIControlStateSelected];
    [btnQuality setBackgroundImage:[UIImage imageNamed:@"btn_frame_m"] forState:UIControlStateHighlighted];
    [btnQuality addTarget:self action:@selector(btnQualityAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *labelQuality = [[UILabel alloc] initWithFrame:CGRectMake(178, 142, 30, 13)];
    labelQuality.font = [UIFont fontWithName:@"Helvetica" size:9];
    labelQuality.backgroundColor = [UIColor clearColor];
    labelQuality.text = @"quality";
    labelQuality.textColor = GREY_TEXT;
    
    inputPlace = [[UITextView alloc] initWithFrame:CGRectMake(15, 157, 290, 146)];
    inputPlace.font = [UIFont fontWithName:@"Helvetica" size:13];
    inputPlace.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_inputView"]];
    inputPlace.editable = YES;
    inputPlace.autoresizesSubviews= YES;
    
    btnReturn = [[UIButton alloc] initWithFrame:CGRectMake(15, 310, 20, 20)];
    [btnReturn setBackgroundImage:[UIImage imageNamed:@"btn_frame_l"] forState:UIControlStateNormal];
    [btnReturn setBackgroundImage:[UIImage imageNamed:@"icon_right_l"] forState:UIControlStateSelected];
    [btnReturn setBackgroundImage:[UIImage imageNamed:@"btn_frame_l]"] forState:UIControlStateHighlighted];
    [btnReturn addTarget:self action:@selector(btnReturnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *labelReturn = [[UILabel alloc] initWithFrame:CGRectMake(35, 310, 30, 20)];
    labelReturn.font = [UIFont fontWithName:@"Helvetica" size:9];
    labelReturn.backgroundColor = [UIColor clearColor];
    labelReturn.text = @"return";
    labelReturn.textColor = GREY_TEXT;
    
    btnReplace = [[UIButton alloc] initWithFrame:CGRectMake(90, 310, 20, 20)];
    [btnReplace setBackgroundImage:[UIImage imageNamed:@"btn_frame_l"] forState:UIControlStateNormal];
    [btnReplace setBackgroundImage:[UIImage imageNamed:@"icon_right_l"] forState:UIControlStateSelected];
    [btnReplace setBackgroundImage:[UIImage imageNamed:@"btn_frame_l"] forState:UIControlStateHighlighted];
    [btnReplace addTarget:self action:@selector(btnReplaceAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *labelReplace = [[UILabel alloc] initWithFrame:CGRectMake(110, 310, 30, 20)];
    labelReplace.font = [UIFont fontWithName:@"Helvetica" size:9];
    labelReplace.backgroundColor = [UIColor clearColor];
    labelReplace.text = @"replace";
    labelReplace.textColor = GREY_TEXT;
    
    
    
    [self.view addSubview:borderTopLine];
    [self.view addSubview:content];
    [self.view addSubview:btnColor];
    [self.view addSubview:labelColor];
    [self.view addSubview:btnSize];
    [self.view addSubview:labelSize];
    [self.view addSubview:btnQuality];
    [self.view addSubview:labelQuality];
    [self.view addSubview:inputPlace];
    [self.view addSubview:btnReturn];
    [self.view addSubview:labelReturn];
    [self.view addSubview:btnReplace];
    [self.view addSubview:labelReplace];
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
