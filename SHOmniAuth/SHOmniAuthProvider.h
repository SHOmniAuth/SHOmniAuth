//
//  SHOmniAuthProvider.h
//  SHAccountManagerExample
//
//  Created by Seivan Heidari on 3/23/13.
//  Copyright (c) 2013 Seivan Heidari. All rights reserved.
//


@protocol accountCredential <NSObject>
- (id)initWithOAuthToken:(NSString *)token tokenSecret:(NSString *)secret;
- (id)initWithOAuth2Token:(NSString *)token
             refreshToken:(NSString *)refreshToken
               expiryDate:(NSDate *)expiryDate;

@property (NS_NONATOMIC_IOSONLY,copy) NSString *oauthToken;
@end

@protocol accountType <NSObject>
@property(NS_NONATOMIC_IOSONLY,readonly) NSString * accountTypeDescription;
@property(NS_NONATOMIC_IOSONLY,readonly) NSString * identifier;
@property(NS_NONATOMIC_IOSONLY,readonly) BOOL      accessGranted;
@end

@protocol account <NSObject>
-(id)initWithAccountType:(id<accountType>)type;
@property(NS_NONATOMIC_IOSONLY,copy,readonly) NSString              * identifier;
@property(NS_NONATOMIC_IOSONLY,strong)        id<accountType>         accountType;
@property(NS_NONATOMIC_IOSONLY,copy)          NSString              * accountDescription;
@property(NS_NONATOMIC_IOSONLY,copy)          NSString              * username;
@property(NS_NONATOMIC_IOSONLY,strong)        id<accountCredential>   credential;
@end

@protocol SHOmniAuthProvider <NSObject>
@required
typedef void(^SHOmniAuthAccountPickerHandler)(id<account> chosenAccount);
typedef void(^SHOmniAuthAccountsListHandler)(NSArray * accounts, SHOmniAuthAccountPickerHandler pickAccountBlock);
typedef void(^SHOmniAuthAccountResponseHandler)(id<account> account, id response, NSError * error, BOOL isSuccess);

+(void)performLoginWithListOfAccounts:(SHOmniAuthAccountsListHandler)accountPickerBlock
                            onComplete:(SHOmniAuthAccountResponseHandler)completionBlock;


+(BOOL)hasLocalAccountOnDevice;


//Mainly used for key storages. 
+(NSString *)provider;
@optional
//Facebook, Twitter, SinaWeibo and RenRen have their own identifiers and serviceTypes. If you're not them, please use the provider as value.

//Return either the built in identifier and service types (SLServiceTypeTwitter and etc) or return the same value as provider
+(NSString *)accountTypeIdentifier; //Used for making accounts
+(NSString *)serviceType; // Used in conjuction of SHRequest (custom SLRequest)

@end
