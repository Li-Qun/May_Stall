//
//  SignInViewController.h
//  Maystall
//
//  Created by ss4346 on 13-11-4.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "FindPwdViewController.h"

@interface SignInViewController : BaseViewController
{
    UITextField *emailTextField;
    UITextField *passTextField;
    
    UIButton *loginBtn;
    UIButton *registerBtn;
    
    UIButton *facebookBtn;
    UIButton *twitterBtn;
}


@end
