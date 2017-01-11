## 设备唯一标识

1、使用Keychain进行数据存储和读取

2、将第一次生成的UUID存储在keychain中，下次直接读取keychain中的数据。以此来做到标识唯一设备。 

## 怎么使用

1、引入头文件：#import "UIDevice+UniqueIdentifier.h"

```objective-c
NSLog(@"设备唯一标识: %@",[UIDevice uniqueIdentifier]);
```

