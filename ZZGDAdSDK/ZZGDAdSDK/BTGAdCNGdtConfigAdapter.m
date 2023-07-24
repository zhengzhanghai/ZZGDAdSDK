//
//  BTGAdCNGdtConfigAdapter.m
//  BTGAdCNSDK
//
//  Created by zhengzhanghai on 2023/7/14.
//

#import "BTGAdCNGdtConfigAdapter.h"
#import <UIKit/UIKit.h>
#import <GDTMobSDK/GDTSDKConfig.h>
#import <BUAdSDK/BUAdSDK.h>
#import <ZZGDAdSDK/ZZGDAdSDK-Swift.h>

@interface BTGAdCNGdtConfigAdapter()<BUMCustomConfigAdapter>

@property (nonatomic, copy) NSString *appId;

@end

@implementation BTGAdCNGdtConfigAdapter

- (nonnull BUMCustomAdapterVersion *)basedOnCustomAdapterVersion {

    return BUMCustomAdapterVersion1_0;
}

- (void)initializeAdapterWithConfiguration:(BUMSdkInitConfig * _Nullable)initConfig {
    [BUAdSDKManager setAppID:initConfig.appID];
    
    NSString *sdkVersion =  [[ZZADManager shared] sdkVersion];
    
    NSLog(@"====== initializeAdapterWithConfiguration  %@", sdkVersion);
    
}

- (NSString * _Nonnull)adapterVersion {
    
    
    return @"1.0.0";
}

- (void)didReceiveConfigUpdateRequest:(nonnull BUMUserConfig *)config {
    
}

- (void)didRequestAdPrivacyConfigUpdate:(nonnull NSDictionary *)config {
    

//    BUAdSDKPrivacyProvider协议内容
//    /// Specify whether to allow the SDK to use location data
//    - (BOOL)canUseLocation;
//    /// Return a latitude value
//    - (CLLocationDegrees)latitude;
//    /// Return a longitude value
//    - (CLLocationDegrees)longitude;
//    /// Specify whether to allow the SDK to use WiFi BSSID. Defaults to YES if the protocol method is not implemented.
//    - (BOOL)canUseWiFiBSSID;
    
//TODO: 确认是否要实现，如果要设置PrivacyProvider，需要设置实现BUAdSDKPrivacyProvider，协议内容是定位和SSID相关
//    [[BUAdSDKConfiguration configuration] setPrivacyProvider:self];
}

- (NSString * _Nonnull)networkSdkVersion {
    

    return [GDTSDKConfig sdkVersion];
}

@end
