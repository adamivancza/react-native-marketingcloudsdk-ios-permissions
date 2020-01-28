
#import "RNReactNativeMarketingcloudsdkIosPermissions.h"

@implementation RNReactNativeMarketingcloudsdkIosPermissions

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(askForPermission) {
  dispatch_async(dispatch_get_main_queue(), ^{
            if (@available(iOS 10, *)) {
                [[UIApplication sharedApplication] registerForRemoteNotifications];

                [[UNUserNotificationCenter currentNotificationCenter]
                    requestAuthorizationWithOptions:UNAuthorizationOptionAlert |
                                                    UNAuthorizationOptionSound |
                                                    UNAuthorizationOptionBadge
                                  completionHandler:^(BOOL granted, NSError *_Nullable error) {
                                    if (error == nil) {
                                        if (granted == YES) {
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                           });
                                        }
                                    }
                                  }];
            } else {
  #if __IPHONE_OS_VERSION_MIN_REQUIRED < 100000
                UIUserNotificationSettings *settings = [UIUserNotificationSettings
                    settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound |
                                     UIUserNotificationTypeAlert
                          categories:nil];
                [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
  #endif
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            }
          });
}

@end
  