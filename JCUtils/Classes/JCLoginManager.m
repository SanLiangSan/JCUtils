//
//  JCLoginManager.m
//  JCLoginSDK
//
//  Created by xingling xu on 2020/11/26.
//  Copyright © 2020 JCLogin. All rights reserved.
//

#import "JCLoginManager.h"
#import <AFNetworking/AFNetworking.h>

@interface JCLoginManager ()
@property (nonatomic, copy) NSString *baseUrl;
@property (nonatomic, copy) NSDictionary *header;
@property (nonatomic, copy) NSString *verifyInterface;
@property (nonatomic, copy) NSString *loginInterface;
@end

@implementation JCLoginManager
+ (instancetype)sharedManager {
    static JCLoginManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [self new];
    });
    return _sharedManager;
}

- (void)injectBaseUrl:(NSString *)baseUrl header:(NSDictionary *)header verifyInterface:(NSString *)verifyInterface loginInterface:(NSString *)loginInterface {
    [self injectBaseUrl:baseUrl];
    [self injectHeader:header];
    [self injectVerifyInterface:verifyInterface];
    [self injectLoginInterface:loginInterface];
}

- (void)injectBaseUrl:(NSString *)baseUrl {
    self.baseUrl = baseUrl;
}

- (void)injectHeader:(NSDictionary *)header {
    self.header = header;
}

- (void)injectVerifyInterface:(NSString *)interface {
    self.verifyInterface = interface;
}

- (void)injectLoginInterface:(NSString *)interface {
    self.loginInterface = interface;
}

- (void)getVerifyCodeWith:(NSDictionary *)params success:(void(^)(id _Nullable responseObject))success failure:(void(^)(NSError * _Nonnull error))failure {
    NSString *url = [NSString stringWithFormat:@"%@%@",self.baseUrl,self.verifyInterface];
    [[AFHTTPSessionManager manager] POST:url parameters:params headers:self.header progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)loginWith:(NSDictionary *)params success:(void(^)(id _Nullable responseObject))success failure:(void(^)(NSError * _Nonnull error))failure {
    NSString *url = [NSString stringWithFormat:@"%@%@",self.baseUrl,self.loginInterface];
    [[AFHTTPSessionManager manager] POST:url parameters:params headers:self.header progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}


@end
