//
//  UIDevice+UniqueIdentifier.h
//  KeychainManager
//
//  Created by wangyong on 2017/1/11.
//  Copyright © 2017年 wyong.developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (UniqueIdentifier)

/**
 设备唯一标识

 @return 唯一标识
 */
+(NSString *)uniqueIdentifier;

@end
