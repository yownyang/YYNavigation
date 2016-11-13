//
//  PCHDefine.h
//  LifeHelper
//
//  Created by yangyang on 15/8/3.
//  Copyright (c) 2015年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#ifndef PCHDefine_h
#define PCHDefine_h


#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

#endif

