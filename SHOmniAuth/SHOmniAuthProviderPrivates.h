//
//  SHOmniAuthProviderPrivates.h
//  SHAccountManagerExample
//
//  Created by Seivan Heidari on 3/27/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//




@protocol  accountCredentialPrivate <accountCredential>
@property(copy, NS_NONATOMIC_IOSONLY) NSString * token;
@property(copy, NS_NONATOMIC_IOSONLY) NSString * secret;
@end

@protocol  accountPrivate <account>
@property(copy, NS_NONATOMIC_IOSONLY) NSString * token;
@property(copy, NS_NONATOMIC_IOSONLY) id<accountCredentialPrivate> credential;
@end
