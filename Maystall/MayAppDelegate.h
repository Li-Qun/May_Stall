//
//  MayAppDelegate.h
//  Maystall
//
//  Created by ss4346 on 13-10-28.
//  Copyright (c) 2013年 huiztech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MayAppDelegate : NSObject <UIApplicationDelegate,UINavigationControllerDelegate>{
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (retain, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
