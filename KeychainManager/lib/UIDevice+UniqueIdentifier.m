//
//  UIDevice+UniqueIdentifier.m
//  KeychainManager
//
//  Created by wangyong on 2017/1/11.
//  Copyright © 2017年 wyong.developer. All rights reserved.
//

#import "UIDevice+UniqueIdentifier.h"
#import "KeychainManager.h"

static NSString *kDeviceUniqueIdentifierKey =@"kDeviceUniqueIdentifier";

@implementation UIDevice (UniqueIdentifier)

+(NSString *)uniqueIdentifier{

    NSString *identifier =[KeychainManager secretStringForKey:kDeviceUniqueIdentifierKey];
    
    if (identifier==nil) {
        identifier = [UIDevice currentDevice].identifierForVendor.UUIDString;
        identifier =[identifier  stringByReplacingOccurrencesOfString:@"-" withString:@""];
        [KeychainManager setSecret:identifier forKey:kDeviceUniqueIdentifierKey];
    }
    return identifier;
}

@end
