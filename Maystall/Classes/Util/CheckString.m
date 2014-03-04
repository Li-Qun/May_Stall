//
//  CheckString.m
//  Maystall
//
//  Created by DAWEI FAN on 03/03/2014.
//  Copyright (c) 2014 huiztech. All rights reserved.
//

#import "CheckString.h"

@implementation CheckString
+(BOOL) isBlankString:(NSString *)string {//判断字符串是否为空 方法  yes 为空
    
    if (string == nil || string == NULL) {
        
        return YES;
        
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        
        return YES;
        
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        
        return YES;
        
    }
    
    return NO;
    
}
@end
