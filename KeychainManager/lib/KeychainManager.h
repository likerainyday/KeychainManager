//
//  KeychainManager.h
//  KeychainManager
//
//  Created by wangyong on 2017/1/11.
//  Copyright © 2017年 wyong.developer. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 keychain的数据存取
 */
@interface KeychainManager : NSObject

/**
  将数据存储在keychain

 @param secretString 数据
 @param strKey 键值
 @return 是否保存成功
 */
+(BOOL)setSecret:(NSString *)secretString forKey:(NSString *)strKey;

/**
 从keychain里读取数据

 @param strKey 键值
 @return 数据
 */
+(NSString *)secretStringForKey:(NSString *)strKey;

/**
  清空keychain数据

 @return 是否成功
 */
+(BOOL)wipeData;

@end
