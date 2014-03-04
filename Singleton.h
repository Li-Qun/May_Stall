//
//  Singleton.h
//  Fish
//
//  Created by DAWEI FAN on 04/01/2014.
//  Copyright (c) 2014 liqun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
{
    NSString *string_select;
}

+ (Singleton *) sharedInstance;
@property (nonatomic,retain)NSString *string_select;

@end
