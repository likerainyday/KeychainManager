//
//  ViewController.m
//  KeychainManager
//
//  Created by wangyong on 2017/1/11.
//  Copyright © 2017年 wyong.developer. All rights reserved.
//

#import "ViewController.h"
#import "UIDevice+UniqueIdentifier.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"设备唯一标识: %@",[UIDevice uniqueIdentifier]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
