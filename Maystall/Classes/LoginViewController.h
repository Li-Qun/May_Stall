//
//  LoginViewController.h
//  Maystall
//
//  Created by 宋硕 on 14-2-12.
//  Copyright (c) 2014年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface LoginViewController : BaseViewController

@property (strong,nonatomic) IBOutlet UIView *nicknameView;
@property (strong,nonatomic) IBOutlet UIView *passwordView;
@property (strong,nonatomic) IBOutlet UITextField *nicknameFiled;
@property (strong,nonatomic) IBOutlet UITextField *passwordFiled;

- (IBAction)loginAction:(id)sender;
- (IBAction)registerAction:(id)sender;


@end
