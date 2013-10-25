//
//  SHOmniAuthProviderPrivates.h
//  SHAccountManagerExample
//
//  Created by Seivan Heidari on 3/27/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//




@protocol  accountCredentialPrivate <accountCredential>
@property(NS_NONATOMIC_IOSONLY,copy) NSString * token;
@property(NS_NONATOMIC_IOSONLY,copy) NSString * secret;
@end

@protocol  accountPrivate <account>
@property(NS_NONATOMIC_IOSONLY,copy) NSString * token;
@property(NS_NONATOMIC_IOSONLY,copy) id<accountCredentialPrivate> credential;
@end
