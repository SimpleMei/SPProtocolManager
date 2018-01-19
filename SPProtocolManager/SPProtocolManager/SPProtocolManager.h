//
//  SPProtocolManager.h
//  SPProtocolManager
//
//  Created by simple on 19/01/2018.
//  Copyright © 2018 simple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPProtocolManager : NSObject

/**
 注册组件

 @param provide 服务提供对象
 @param protocol 遵守的协议
 */
+ (void)registServiceProvide:(id)provide forProtocol:(Protocol *)protocol;

/**
 获取某个协议的服务对象

 @param protocol 遵守的协议
 @return 返回服务提供对象
 */
+ (id)serviceProviceForProtocol:(Protocol *)protocol;

@end
