//
//  UserCenterViewController.h
//  Maystall
//
//  Created by ss4346 on 13-10-29.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "SignInViewController.h"
#import "SignUpViewController.h"
#import "RepairViewController.h"

@interface UserCenterViewController : BaseViewController

@property (strong,nonatomic) IBOutlet UIButton *loginBtn;
@property (strong,nonatomic) IBOutlet UIButton *rigsiterBtn;
@property (strong,nonatomic) IBOutlet UIView *topView;

- (IBAction)toLoginView:(id)sender;

@end
