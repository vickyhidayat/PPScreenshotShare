//
//  PPScreenshotShareController.h
//  PPScreenshotShare
//
//  Created by Vicky Hidayat on 09/20/2017.
//  Copyright (c) 2017 Vicky Hidayat. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Helper

#ifndef NSLOG
    #ifdef DEBUG
        #ifdef NSLOG_VERBOSE_SHOW_CONTEXT
            #define NSLOG(F, ...) CFShow((__bridge CFTypeRef)([NSString stringWithFormat:@"file:%@, line:%ld, function:%s, %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], (long)__LINE__, __FUNCTION__, [NSString stringWithFormat:F, ## __VA_ARGS__]]))
        #elif defined NSLOG_VERBOSE_LOG_CONTEXT
            #define NSLOG(F, ...) NSLog(@"file:%@, line:%ld, function:%s, %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], (long)__LINE__, __FUNCTION__, [NSString stringWithFormat:F, ## __VA_ARGS__])
        #elif defined NSLOG_VERBOSE_SHOW
            #define NSLOG(F, ...) CFShow((__bridge CFTypeRef)([NSString stringWithFormat:F, ## __VA_ARGS__]))
        #elif defined NSLOG_VERBOSE_LOG
            #define NSLOG(F, ...) NSLog(F, ## __VA_ARGS__)
        #else
            #define NSLOG(F, ...) //
        #endif
    #else
        #define NSLOG(F, ...) //
    #endif
#endif

#pragma mark - NSDictionary

@interface NSDictionary (Screenshot)

- (instancetype)dictionaryFromMergeWithDictionary:(NSDictionary *)dict;	//return new dictionary from merged self & dict or self

- (BOOL)isMutable;	//check for mutability

@end

#pragma mark - NSMutableDictionary

@interface NSMutableDictionary (Screenshot)

- (void)mergeWithDictionary_:(NSDictionary *)dict;	//return self merged with dict

@end

#pragma mark - UIScreen

@interface UIScreen (Screenshot)

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;	//return image snapshot from main screen

@end

#pragma mark - UIWindow

@interface UIWindow (Screenshot)

@property(nullable, nonatomic, readonly) UIViewController *activeViewController;	//return top most controller in key window

@end

#pragma mark - PPScreenshotThemeType

typedef NS_ENUM(NSInteger, PPScreenshotThemeType) {	//theme type
    PPScreenshotThemeTypeDefault,
    PPScreenshotThemeTypeBlurLight,
    PPScreenshotThemeTypeBlurDark,
    PPScreenshotThemeTypeTransparentLight,
    PPScreenshotThemeTypeTransparentDark = PPScreenshotThemeTypeDefault,
};

#pragma mark - PPScreenshotButtonCloseType

typedef NS_ENUM(NSInteger, PPScreenshotButtonCloseType) {	//button close type
    PPScreenshotButtonCloseTypeDefault,
    PPScreenshotButtonCloseTypeSimple,
    PPScreenshotButtonCloseTypeBordered,
    PPScreenshotButtonCloseTypeFilled = PPScreenshotButtonCloseTypeDefault,
};

#pragma mark - PPScreenshotKey

typedef NSString * PPScreenshotKey;	//keys

FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyContent;	//content
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyScreenshot;	//screenshot
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyRedacted;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyMessage;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyFont;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyShare;	//share
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyText;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyUrl;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyItems;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyActivities;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyExcludes;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyAction;	//actions
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyController;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyActivityType;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyCompleted;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyReturnedItems;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyActivityError;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyCustomization;	//configuration
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyTheme;	//themes
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyType;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyModal;	//controller
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyTransition;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyPresentation;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyBorder;	//border
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyBackground;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyShow;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyWidth;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyRadius;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyColor;	//color
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyShadow;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyButton;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyAlpha;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyTitle;	//title
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyClose;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeySize;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyIndicator;	//indicator
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyEnabled;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyEffect;	//effect
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyMinimum;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyMaximum;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyGesture;	//gesture
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeyTap;
FOUNDATION_EXPORT PPScreenshotKey const PPScreenshotKeySwipe;

#pragma mark - PPScreenshotShareController

@class PPScreenshotShareController;

typedef void (^PPScreenshotViewControllerLifeCycleHandler)(PPScreenshotShareController * controller, NSDictionary * __nullable userInfo);

@interface PPScreenshotShareController : UIViewController

@property (nullable, nonatomic, copy) NSDictionary *data;	//configuration information
- (NSDictionary *)themeForType:(PPScreenshotThemeType)type;	//theme builder proxy

@property (nonatomic, assign) BOOL enabled;	//status flag

@property (nullable, nonatomic, copy) PPScreenshotViewControllerLifeCycleHandler doScreenshotHandler;	//handlers
@property (nullable, nonatomic, copy) PPScreenshotViewControllerLifeCycleHandler willPresentHandler;
@property (nullable, nonatomic, copy) PPScreenshotViewControllerLifeCycleHandler willDismissHandler;
@property (nullable, nonatomic, copy) PPScreenshotViewControllerLifeCycleHandler didPresentHandler;
@property (nullable, nonatomic, copy) PPScreenshotViewControllerLifeCycleHandler didDismissHandler;
@property (nullable, nonatomic, copy) PPScreenshotViewControllerLifeCycleHandler doActionHandler;
@property (nullable, nonatomic, copy) PPScreenshotViewControllerLifeCycleHandler didActionHandler;

- (void)resetHandlers;

+ (Class)attach;	//activate screenshot handling
+ (Class)detach;	//deactivate

+ (Class)setEnabled:(BOOL)enabled;	//status flag
+ (BOOL)isEnabled;

+ (Class)setData:(nullable NSDictionary *)data;	//configuration information
+ (NSDictionary *)themeForType:(PPScreenshotThemeType)type;	//theme builder

+ (nullable instancetype)activeInstance;	//cached instance
+ (Class)clearInstance;

+ (Class)setDoScreenshotHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler;	//handlers
+ (Class)setWillPresentHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler;
+ (Class)setWillDismissHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler;
+ (Class)setDidPresentHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler;
+ (Class)setDidDismissHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler;
+ (Class)setDoActionHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler;
+ (Class)setDidActionHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler;

+ (Class)resetHandlers;

@end

NS_ASSUME_NONNULL_END
