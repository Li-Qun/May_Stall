//
//  CheckNetwork.m
//  Maystall
//
//  Created by 宋硕 on 14-2-7.
//  Copyright (c) 2014年 huiztech. All rights reserved.
//

#import "CheckNetwork.h"
#import "Reachability.h"

@implementation CheckNetwork
+(BOOL)isExistenceNetwork
{
//    BOOL isExistenceNetwork;
//	Reachability *r = [Reachability reachabilityWithHostName:@"www.oschina.net"];
//    switch ([r currentReachabilityStatus]) {
//            case NotReachable:
//    			isExistenceNetwork=FALSE;
//                //   NSLog(@"娌℃湁缃戠粶");
//                break;
//            case ReachableViaWWAN:
//    			isExistenceNetwork=TRUE;
//                //   NSLog(@"姝ｅ湪浣跨敤3G缃戠粶");
//                break;
//            case ReachableViaWiFi:
//    			isExistenceNetwork=TRUE;
//                //  NSLog(@"姝ｅ湪浣跨敤wifi缃戠粶");
//                break;
//        }
//    	return isExistenceNetwork;
//    
//    return YES;
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    
    if (!isExistenceNetwork) {
        
    }
    return isExistenceNetwork;
}

@end
