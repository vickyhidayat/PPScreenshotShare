//
//  PPAppDelegate+Screenshot.m
//  PPScreenshotShare
//
//  Created by Vicky Hidayat on 09/20/2017.
//  Copyright (c) 2017 Vicky Hidayat. All rights reserved.
//

#import <PPScreenshotShare/PPScreenshotShareController.h>

#import "PPAppDelegate+Screenshot.h"

#pragma mark - PPAppDelegate (Screenshot)

@implementation PPAppDelegate (Screenshot)

#pragma mark - Public methods

- (void)configureScreenshot
{
    dispatch_async(dispatch_get_main_queue(), ^{    //return quickly
        
        [self configureScreenshotTheme];
        
        [self registerScreenshotShowHandler];
        [self registerScreenshotDismissHandler];
        [self registerScreenshotActionHandler];
        
    });
}

#pragma mark - Methods

- (void)screenshotShowHandler:(NSDictionary *)userInfo	//sent when screenshot shown
{
    NSDictionary * const event = @{@"event" : @"screenshot", @"screenshotScreen" : @"ScreenShotScreen"};	//const
    
    [self screenshotAnalytics:event];
}

- (void)screenshotDismissHandler:(NSDictionary *)userInfo	//sent when screenshot closed
{
    BOOL action = [userInfo[PPScreenshotKeyAction] boolValue];
    
    if (!action) {
        [self screenshotCancelHandler:userInfo];
    }
}

- (void)screenshotCancelHandler:(NSDictionary *)userInfo	//when screenshot closed without any action performed
{
    NSDictionary * const event = @{@"event" : @"shareScreenshot", @"screenshotAction" : @"Cancel", @"screenshotShare" : @"Cancel"};	//const
    
    [self screenshotAnalytics:event];
}

- (void)screenshotActionHandler:(NSDictionary *)userInfo	//sent when screenshot action performed
{
    BOOL completed = [userInfo[PPScreenshotKeyCompleted] boolValue];
    
    NSDictionary *event;
    if (completed) {	//action completed
        
        UIActivityType activityType = userInfo[PPScreenshotKeyActivityType];
        
        NSString *app;
        if ([activityType isEqualToString:UIActivityTypeMessage]) {	//com.apple.UIKit.activity.Message
            app = @"Message";
        } else if ([activityType isEqualToString:UIActivityTypeMail]) {	//com.apple.UIKit.activity.Mail
            app = @"Email";
        } else if ([activityType isEqualToString:UIActivityTypePostToTwitter]) {	//com.apple.UIKit.activity.PostToTwitter
            app = @"Twitter";
        } else if ([activityType isEqualToString:UIActivityTypePostToFacebook]) {	//com.apple.UIKit.activity.PostToFacebook
            app = @"Facebook";
        } else if ([activityType isEqualToString:@"net.whatsapp.WhatsApp.ShareExtension"]) {	//net.whatsapp.WhatsApp.ShareExtension
            app = @"Whatsapp";
        } else if ([activityType isEqualToString:@"jp.naver.line.Share"]) {	//jp.naver.line.Share
            app = @"Line";
        } else if ([activityType isEqualToString:@"com.blackberry.bbm1.shareextension"]) {	//TODO: com.blackberry.bbm1.shareextension. 1, 2??
            app = @"BBM";
        } else {	//elses
            app = @"Others";
        }
        
        event = @{@"event" : @"shareScreenshot", @"screenshotAction" : @"Share", @"screenshotShare" : app};
        
    } else {	//dismiss UIActivityViewController
        
        event = nil;	//no event
    }
    
    [self screenshotAnalytics:event];
}

- (void)screenshotAnalytics:(NSDictionary *)analytics
{
    if (analytics.count == 0) return;	//validation
    
    //TAGDataLayer *tag = [TAGManager instance].dataLayer;
    //[tag push:analytics];
}

#pragma mark - Internal methods

- (void)configureScreenshotTheme
{
    NSDictionary * const theme = @{
              PPScreenshotKeyTheme : @{
                      PPScreenshotKeyType : @(PPScreenshotThemeTypeTransparentDark)
                      }
              ,
              PPScreenshotKeyCustomization : @{
                      PPScreenshotKeyTitle : @{
                              PPScreenshotKeyClose : @{
                                      PPScreenshotKeySize : @(22.0f)
                                      }
                              }
                      ,
                      PPScreenshotKeyIndicator : @{
                              PPScreenshotKeyEnabled : @(YES)
                              }
                      }
              ,
              PPScreenshotKeyContent : @{
                      PPScreenshotKeyTitle : @{
                              PPScreenshotKeyText : @"Screenshot Saved"
                              },
                      PPScreenshotKeyMessage : @{
                              PPScreenshotKeyText : @"Share information from your APP is now easier dan practical"
                              },
                      PPScreenshotKeyButton : @{
                              PPScreenshotKeyText : @"SHARE SCREENSHOT"
                              }
                      }
              };	//const
    
    [PPScreenshotShareController setData:theme];	//customize screenshot
}

- (void)registerScreenshotShowHandler
{
    [PPScreenshotShareController setDidPresentHandler:^(PPScreenshotShareController  *_Nonnull controller, NSDictionary  *_Nullable userInfo) {	//screenshot shown
        
        [self screenshotShowHandler:userInfo];
        
    }];
}

- (void)registerScreenshotDismissHandler
{
    [PPScreenshotShareController setDidDismissHandler:^(PPScreenshotShareController  *_Nonnull controller, NSDictionary  *_Nullable userInfo) {	//screenshot closed
    
        [self screenshotDismissHandler:userInfo];
        
    }];
}

- (void)registerScreenshotActionHandler
{
    [PPScreenshotShareController setDidActionHandler:^(PPScreenshotShareController  *_Nonnull controller, NSDictionary  *_Nullable userInfo) {	//screenshot action
        
        [self screenshotActionHandler:userInfo];
        
    }];
}

@end
