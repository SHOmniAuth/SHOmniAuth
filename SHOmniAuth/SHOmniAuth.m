//
//  SHOmniAuth.m
//  SHAccountManagerExample
//
//  Created by Seivan Heidari on 3/23/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//

#import "SHOmniAuth.h"
#import "LUKeychainAccess.h"

static NSString * const kOmniAuthProviderKey          = @"kOmniAuthProviderKey";
static NSString * const kOmniAuthProviderSecret       = @"kOmniAuthProviderSecret";
static NSString * const kOmniAuthProviderScope        = @"kOmniAuthProviderScope";
static NSString * const kOmniAuthProviderCallbackUrl  = @"kOmniAuthProviderCallbackUrl";
static NSString * const kOmniAuth                     = @"kOmniAuth";

@interface SHOmniAuth ()
+(void)saveProviderWithAppProvider:(NSString *)theProvider theKey:(NSString *)theKey
                         andSecret:(NSString *)theSecret
                         withScope:(NSString *)theScope
                     onCallbackUrl:(NSString *)theCallbackUrl;

+(NSString *)keyForProvider:(NSString *)theProvider;
+(NSString *)secretForProvider:(NSString *)theProvider;
+(NSString *)scopeForProvider:(NSString *)theProvider;
+(NSString *)callbackUrlForProvider:(NSString *)theProvider;

@end

@implementation SHOmniAuth

+(void)registerProvidersWith:(SHOmniAuthRegisterBlock)theProviderBlock; {
  theProviderBlock(^(NSString * provider, NSString * key, NSString * secret,
                     NSString * scope, NSString * callbackUrl) {
    [self saveProviderWithAppProvider:provider theKey:key andSecret:secret withScope:scope onCallbackUrl:callbackUrl];
  });
                   
}

+(void)saveProviderWithAppProvider:(NSString *)theProvider
                         theKey:(NSString *)theKey
                      andSecret:(NSString *)theSecret
                      withScope:(NSString *)theScope
                      onCallbackUrl:(NSString *)theCallbackUrl; {
  NSAssert(theProvider, @"You need to pass the Provider");
  NSAssert(theKey, @"You need to pass the Key");
  NSAssert(theSecret, @"You need to pass the Secret");
  NSAssert(theCallbackUrl, @"You need to pass the CallbackUrl");
  if(theScope == nil) theScope = @"";
  LUKeychainAccess * keychain = [LUKeychainAccess standardKeychainAccess];
  
  NSDictionary * credential = @{ kOmniAuthProviderKey         : theKey,
                                 kOmniAuthProviderSecret      : theSecret,
                                 kOmniAuthProviderScope       : theScope,
                                 kOmniAuthProviderCallbackUrl : theCallbackUrl};
  
  NSDictionary * omniAuthDictionary =  [keychain objectForKey:kOmniAuth];
  if(omniAuthDictionary == nil) omniAuthDictionary = @{};
  NSMutableDictionary *  omniAuthChangesDictionary = omniAuthDictionary.mutableCopy;
  omniAuthChangesDictionary[theProvider] = credential;
  [keychain setObject:omniAuthChangesDictionary forKey:kOmniAuth];
}

+(NSString *)providerValue:(SHOmniAuthProviderValue)theProviderValue forProvider:(NSString *)theProvider; {
  NSAssert((theProviderValue >= SHOmniAuthProviderValueKey && theProviderValue <= SHOmniAuthProviderValueCallbackUrl),
           @"Must pass a valid SHOmniAuthProviderValue");
  NSAssert(theProvider, @"Must pass a provider");
  NSString * providerValue = nil;
  switch (theProviderValue) {
    case SHOmniAuthProviderValueKey:
      providerValue  = [self keyForProvider:theProvider];
      break;
    case SHOmniAuthProviderValueSecret:
      providerValue  = [self secretForProvider:theProvider];
      break;
    case SHOmniAuthProviderValueScope:
      providerValue  = [self scopeForProvider:theProvider];
      break;
    case SHOmniAuthProviderValueCallbackUrl:
      providerValue  = [self callbackUrlForProvider:theProvider];
      break;
    default:
      break;
  }
  return providerValue;
}

+(NSString *)keyForProvider:(NSString *)theProvider; {
  NSAssert(theProvider, @"Must pass the provider");
  NSDictionary * credential = [[LUKeychainAccess standardKeychainAccess] objectForKey:kOmniAuth];
  return credential[theProvider][kOmniAuthProviderKey];
}

+(NSString *)secretForProvider:(NSString *)theProvider {
  NSAssert(theProvider, @"Must pass the provider");
  NSDictionary * credential = [[LUKeychainAccess standardKeychainAccess] objectForKey:kOmniAuth];
  return credential[theProvider][kOmniAuthProviderSecret];
}

+(NSString *)scopeForProvider:(NSString *)theProvider; {
  NSAssert(theProvider, @"Must pass the provider");
  NSDictionary * credential = [[LUKeychainAccess standardKeychainAccess] objectForKey:kOmniAuth];
  return credential[theProvider][kOmniAuthProviderScope];
  
}

+(NSString *)callbackUrlForProvider:(NSString *)theProvider; {
  NSAssert(theProvider, @"Must pass the provider");
  NSDictionary * credential = [[LUKeychainAccess standardKeychainAccess] objectForKey:kOmniAuth];
  return credential[theProvider][kOmniAuthProviderCallbackUrl];
  
}


@end
