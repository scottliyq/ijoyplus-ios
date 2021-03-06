//
//  DownloadItem.h
//  yueshipin
//
//  Created by joyplus1 on 12-12-19.
//  Copyright (c) 2012年 joyplus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQLitePersistentObject.h"

@interface DownloadItem : SQLitePersistentObject{
    NSString *itemId;
    NSString *imageUrl;
    NSString *name;
    NSString *fileName;
    NSString *downloadStatus;
    NSString *url;
    int type;
    int percentage;
}

@property (nonatomic, strong)NSString *itemId;
@property (nonatomic, strong)NSString *imageUrl;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *fileName;
@property (nonatomic, strong)NSString *downloadStatus; // start:开始 stop: 暂停 done: 完成 error:错误
@property (nonatomic, assign)int type;
@property (nonatomic, assign)int percentage;
@property (nonatomic, strong)NSString *url;
@end
