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
  SHOmniAuthProviderValueCallbackUrl
} SHOmniAuthProviderValue;


@interface SHOmniAuth : NSObject
typedef void(^SHOmniAuthProviderBlock)
            (NSString * provider,
            NSString  * key,
            NSString  * secret,
            NSString  * scope,
            NSString  * callbackUrl);

typedef void(^SHOmniAuthRegisterBlock)(SHOmniAuthProviderBlock provider);

+(void)registerProvidersWith:(SHOmniAuthRegisterBlock)theProviderBlock;
+(NSString *)providerValue:(SHOmniAuthProviderValue)theProviderValue forProvider:(NSString *)theProvider;
@end
