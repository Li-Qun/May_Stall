//
//  TestIPay88ViewController.m
//  Maystall
//
//  Created by 宋硕 on 14-2-8.
//  Copyright (c) 2014年 huiztech. All rights reserved.
//

#import "TestIPay88ViewController.h"

@interface TestIPay88ViewController ()

@end

@implementation TestIPay88ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)paymentSuccess:(NSString *)refNo withTransId:(NSString *)transId withAmount:(NSString *)amount withRemark:(NSString *)remark withAuthCode:(NSString *)authCode {
    NSLog(@"success");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"payment success" message:[NSString stringWithFormat:@"refNo=%@\ntransId=%@\namount=%@\nremark=%@\nauthcode=%@",refNo,transId,amount,remark,authCode] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)paymentFailed:(NSString *)refNo withTransId:(NSString *)transId withAmount:(NSString *)amount withRemark:(NSString *)remark withErrDesc:(NSString *)errDesc{
    NSLog(@"failed");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"payment failed" message:[NSString stringWithFormat:@"refNo=%@\ntransId=%@\namount=%@\nremark=%@\nerrDesc=%@",refNo,transId,amount,remark,errDesc] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
- (void)paymentCancelled:(NSString *)refNo withTransId:(NSString *)transId withAmount:(NSString *)amount withRemark:(NSString *)remark withErrDesc:(NSString *)errDesc{
    NSLog(@"cancelled");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"payment cancelled" message:[NSString stringWithFormat:@"refNo=%@\ntransId=%@\namount=%@\nremark=%@\nerrDesc=%@",refNo,transId,amount,remark,errDesc] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    exit(0);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /* 1. Setting IpayPayment Object - BEGIN */
    IpayPayment *payment = [[IpayPayment alloc] init];
    [payment setPaymentId:@"2"];
    [payment setMerchantKey:@"lQty66n7RM"];
    [payment setMerchantCode:@"M03213"];
    [payment setRefNo:[NSString stringWithFormat:@"%f", [[NSDate date] timeIntervalSince1970]]];
    [payment setAmount:@"1.00"];
    [payment setCurrency:@"MYR"];
    [payment setProdDesc:@"testing"];
    [payment setUserName:@"SDK Tester"];
    [payment setUserEmail:@"sdktester@ipay88.com"];
    [payment setUserContact:@"0171234567"];
    [payment setRemark:@"Testing SDK"];
    [payment setLang:@"UTF-8"];
    [payment setCountry:@"MY"];
    /* 1. Setting IpayPayment Object - END */
    
    
    /* 2. SDK Initialization - BEGIN */
    paymentsdk = [[Ipay alloc] init];
    paymentsdk.delegate = self;
    /* 2. SDK Initialization - END */
    
    
    /* 3. Payment Checkout Method - BEGIN */
    UIView *paymentView = [paymentsdk checkout:payment];
    /* 3. Payment Checkout Method - END */
    [self.view addSubview:paymentView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
