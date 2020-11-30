//
//  JCLoginManager.h
//  JCLoginSDK
//
//  Created by xingling xu on 2020/11/26.
//  Copyright © 2020 JCLogin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCLoginManager : NSObject

/** sigleten */
+ (instancetype)sharedManager;

/** set the base info for the login request */
- (void)injectBaseUrl:(NSString *)baseUrl
               header:(NSDictionary *)header
      verifyInterface:(NSString *)verifyInterface
       loginInterface:(NSString *)loginInterface;

/** reset baseUrl */
- (void)injectBaseUrl:(NSString *)baseUrl;

/** reset header */
- (void)injectHeader:(NSDictionary *)header;

/** reset the verify interface */
- (void)injectVerifyInterface:(NSString *)interface;

/** reset the login interface */
- (void)injectLoginInterface:(NSString *)interface;

/** request to get verify code */
- (void)getVerifyCodeWith:(NSDictionary *)params
                  success:(void(^)(id _Nullable responseObject))success
                  failure:(void(^)(NSError * _Nonnull error))failure;

/** login for verify code or username and pwd */
- (void)loginWith:(NSDictionary *)params
          success:(void(^)(id _Nullable responseObject))success
          failure:(void(^)(NSError * _Nonnull error))failure;

@end

NS_ASSUME_NONNULL_END
