//
//  TestIPay88ViewController.h
//  Maystall
//
//  Created by 宋硕 on 14-2-8.
//  Copyright (c) 2014年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ipay.h"

@interface TestIPay88ViewController : UIViewController < PaymentResultDelegate> {
    Ipay *paymentsdk;
}

@end
