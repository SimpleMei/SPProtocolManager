//
//  SPProtocolManager.m
//  SPProtocolManager
//
//  Created by simple on 19/01/2018.
//  Copyright © 2018 simple. All rights reserved.
//

#import "SPProtocolManager.h"

@interface SPProtocolManager ()

/***serviceProvideSource**/
@property (nonatomic, strong) NSMutableDictionary * serviceProvideSource;

@end

@implementation SPProtocolManager

+ (SPProtocolManager *)sharedInstance
{
    static SPProtocolManager * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SPProtocolManager alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.serviceProvideSource = [NSMutableDictionary dictionary];
    }
    return self;
}

+ (void)registServiceProvide:(id)provide forProtocol:(Protocol *)protocol
{
    if (provide == nil || protocol == nil) {
        NSLog(@"注册失败");
        return;
    }
    [[self sharedInstance].serviceProvideSource setObject:provide forKey:NSStringFromProtocol(protocol)];
}

+ (id)serviceProviceForProtocol:(Protocol *)protocol
{
    return [[self sharedInstance].serviceProvideSource objectForKey:NSStringFromProtocol(protocol)];
}
@end
