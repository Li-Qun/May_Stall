//
//  RepairViewController.h
//  Maystall
//
//  Created by ss4346 on 13-11-6.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "TPKeyboardAvoidingScrollView.h"

@interface RepairViewController : BaseViewController
{
    UITextView *inputPlace;
    
    UIButton *btnColor;
    UIButton *btnSize;
    UIButton *btnQuality;
    UIButton *btnReturn;
    UIButton *btnReplace;
}

@end
