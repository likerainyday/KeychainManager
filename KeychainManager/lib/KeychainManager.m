//
//  KeychainManager.m
//  KeychainManager
//
//  Created by wangyong on 2017/1/11.
//  Copyright © 2017年 wyong.developer. All rights reserved.
//

#import "KeychainManager.h"

@implementation KeychainManager

//账户标识配置
+(NSMutableDictionary *)configurationForAccount:(NSString *)strAccount{
    
    NSMutableDictionary *dict =[NSMutableDictionary new];
    
    //设置通用密码
    [dict setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
    //设置账户标识
    if ([strAccount isKindOfClass:NSString.class] && strAccount.length>0) {
        [dict setObject:[strAccount dataUsingEncoding:NSUTF8StringEncoding] forKey:(__bridge id)kSecAttrAccount];
    }
    //设置服务标识符
    [dict setObject:@"wyong.developer" forKey:(__bridge id)kSecAttrService];
    
    return dict;
}

//保存数据
+(BOOL)setSecret:(NSString *)secretString forKey:(NSString *)strKey{
    
    BOOL success =NO;
    NSMutableDictionary *keychainDict =[self.class configurationForAccount:strKey];
    
    //需要保存的信息
    [keychainDict setObject:[secretString?:@"" dataUsingEncoding:NSUTF8StringEncoding] forKey:(__bridge id)kSecValueData];
    //添加
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)keychainDict, NULL);
    if (status==errSecSuccess) {
        success =YES;
    }else if (status==errSecDuplicateItem){
        //已存在，更新内容
        NSMutableDictionary *tempDict =[self.class configurationForAccount:strKey];
        NSDictionary *dataDict =[[NSDictionary alloc]initWithObjectsAndKeys:[secretString?:@"" dataUsingEncoding:NSUTF8StringEncoding],(__bridge id)kSecValueData, nil];
        OSStatus status = SecItemUpdate((__bridge CFDictionaryRef)tempDict, (__bridge CFDictionaryRef)dataDict);
        if (status == errSecSuccess) {
            success =YES;
        }else{
            NSLog(@"Update failed, Code:%d",(int)status);
        }
    }else{
        NSLog(@"Save failed, Code:%d",(int)status);
    }
    return success;
}

//读取数据
+(NSString *)secretStringForKey:(NSString *)strKey{
    
    NSMutableDictionary *tempDict =[self.class configurationForAccount:strKey];
    [tempDict setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    [tempDict setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    
    CFTypeRef resultRef = NULL;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)tempDict, &resultRef);
    if (status == errSecSuccess){
        //查询成功
        return [[NSString alloc]initWithData:(__bridge NSData *)(resultRef) encoding:NSUTF8StringEncoding];;
    }
    return nil;
}

//清空数据
+(BOOL)wipeData{
    
    BOOL success =NO;
    NSDictionary *dict = [self.class configurationForAccount:nil];

    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)dict);
    if (status ==errSecSuccess) {
        success =YES;
    }else{
        NSLog(@"WipeData failed, Code:%d",(int)status);
    }
    return success;
}

@end
