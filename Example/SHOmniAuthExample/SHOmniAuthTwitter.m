//
//  SHOmniAuthTwitter.m
//  SHOmniAuthExample
//
//  Created by Seivan Heidari on 3/27/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//

#import "SHOmniAuthTwitter.h"

@implementation SHOmniAuthTwitter
+(void)performLoginWithListOfAccounts:(SHOmniAuthAccountsListHandler)accountPickerBlock
                           onComplete:(SHOmniAuthAccountResponseHandler)completionBlock; {
  completionBlock(nil,nil,nil, YES);
}


+(BOOL)hasLocalAccountOnDevice; {
  return YES;
}


//Mainly used for key storages.
+(NSString *)provider; {
  return @"";
}

+(NSString *)accountTypeIdentifier; {
  return @"";
}
+(NSString *)serviceType; {
   return @""; 
}


@end
