//
//  SHOmniAuth.h
//  SHAccountManagerExample
//
//  Created by Seivan Heidari on 3/23/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//
typedef enum    {
  SHOmniAuthProviderValueKey,
  SHOmniAuthProviderValueSecret,
  SHOmniAuthProviderValueScope,
  SHOmniAuthProviderValueCallbackUrl,
  SHOmniAuthProviderValueUserInfo
} SHOmniAuthProviderValue;


@interface SHOmniAuth : NSObject
typedef void(^SHOmniAuthProviderBlock)
            (NSString * provider,
            NSString  * key,
            NSString  * secret,
            NSString  * scope,
            NSString  * callbackUrl,
       NSDictionary   * userInfo);

typedef void(^SHOmniAuthRegisterBlock)(SHOmniAuthProviderBlock provider);

+(void)registerProvidersWith:(SHOmniAuthRegisterBlock)theProviderBlock;
+(id)providerValue:(SHOmniAuthProviderValue)theProviderValue forProvider:(NSString *)theProvider;

+(id)optionForProviderKey:(NSString *)optionKey forProvider:(NSString *)theProvider;

@end
