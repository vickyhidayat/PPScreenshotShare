//
//  PPScreenshotShareController.m
//  PPScreenshotShare
//
//  Created by Vicky Hidayat on 09/20/2017.
//  Copyright (c) 2017 Vicky Hidayat. All rights reserved.
//

#import "PPScreenshotShareController.h"

#pragma mark - Keys

PPScreenshotKey const PPScreenshotKeyContent = @"content";	//content
PPScreenshotKey const PPScreenshotKeyScreenshot = @"screenshot";	//screenshot
PPScreenshotKey const PPScreenshotKeyRedacted = @"redacted";
PPScreenshotKey const PPScreenshotKeyMessage = @"message";
PPScreenshotKey const PPScreenshotKeyFont = @"font";
PPScreenshotKey const PPScreenshotKeyShare = @"share";	//share
PPScreenshotKey const PPScreenshotKeyText = @"text";
PPScreenshotKey const PPScreenshotKeyUrl = @"url";
PPScreenshotKey const PPScreenshotKeyItems = @"items";
PPScreenshotKey const PPScreenshotKeyActivities = @"activities";
PPScreenshotKey const PPScreenshotKeyExcludes = @"excludes";
PPScreenshotKey const PPScreenshotKeyAction = @"action";	//actions
PPScreenshotKey const PPScreenshotKeyController = @"controller";
PPScreenshotKey const PPScreenshotKeyActivityType = @"activityType";
PPScreenshotKey const PPScreenshotKeyCompleted = @"completed";
PPScreenshotKey const PPScreenshotKeyReturnedItems = @"returnedItems";
PPScreenshotKey const PPScreenshotKeyActivityError = @"activityError";
PPScreenshotKey const PPScreenshotKeyCustomization = @"customization";	//configuration
PPScreenshotKey const PPScreenshotKeyTheme = @"theme";	//themes
PPScreenshotKey const PPScreenshotKeyType = @"type";
PPScreenshotKey const PPScreenshotKeyModal = @"modal";	//controller
PPScreenshotKey const PPScreenshotKeyTransition = @"transition";
PPScreenshotKey const PPScreenshotKeyPresentation = @"presentation";
PPScreenshotKey const PPScreenshotKeyBorder = @"border";	//border
PPScreenshotKey const PPScreenshotKeyBackground = @"background";
PPScreenshotKey const PPScreenshotKeyShow = @"show";
PPScreenshotKey const PPScreenshotKeyWidth = @"width";
PPScreenshotKey const PPScreenshotKeyRadius = @"radius";
PPScreenshotKey const PPScreenshotKeyColor = @"color";	//color
PPScreenshotKey const PPScreenshotKeyShadow = @"shadow";
PPScreenshotKey const PPScreenshotKeyButton = @"button";
PPScreenshotKey const PPScreenshotKeyAlpha = @"alpha";
PPScreenshotKey const PPScreenshotKeyTitle = @"title";	//title
PPScreenshotKey const PPScreenshotKeyClose = @"close";
PPScreenshotKey const PPScreenshotKeySize = @"size";
PPScreenshotKey const PPScreenshotKeyIndicator = @"indicator";	//indicator
PPScreenshotKey const PPScreenshotKeyEnabled = @"enabled";
PPScreenshotKey const PPScreenshotKeyEffect = @"effect";	//effect
PPScreenshotKey const PPScreenshotKeyMinimum = @"minimum";
PPScreenshotKey const PPScreenshotKeyMaximum = @"maximum";
PPScreenshotKey const PPScreenshotKeyGesture = @"gesture";	//gesture
PPScreenshotKey const PPScreenshotKeyTap = @"tap";
PPScreenshotKey const PPScreenshotKeySwipe = @"swipe";

#pragma mark - Strings

static NSString * const kPPScreenshotDefaultTitle = @"Lorem Ipsum!";
static NSString * const kPPScreenshotDefaultMessage = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";

static NSString * const kPPScreenshotButtonCloseTypeDefaultText = @"";
static NSString * const kPPScreenshotButtonCloseTypeSimpleText = @"";
static NSString * const kPPScreenshotButtonCloseTypeBorderedText = @"";
static NSString * const kPPScreenshotButtonCloseTypeFilledText = @"";

static NSString * const kPPScreenshotButtonActionDefaultText = @"LOREM IPSUM";

#pragma mark - Values

#define kPPScreenshotModalTransitionStyle UIModalTransitionStyleCrossDissolve
#define kPPScreenshotModalPresentation UIModalPresentationOverFullScreen

#define kPPScreenshotBorderBackgroundDefaultColor [UIColor clearColor]
#define kPPScreenshotBorderBackgroundWidthDefaultValue @(0.0f)
#define kPPScreenshotBorderBackgroundRadiusDefaultValue @(4.0f)
#define kPPScreenshotBorderButtonDefaultColor [UIColor clearColor]
#define kPPScreenshotBorderButtonWidthDefaultValue @(0.0f)
#define kPPScreenshotBorderButtonRadiusDefaultValue @(4.0f)
#define kPPScreenshotBorderScreenshotDefaultColor [UIColor lightGrayColor]
#define kPPScreenshotBorderScreenshotShowDefaultValue @(YES)
#define kPPScreenshotBorderScreenshotWidthDefaultValue @(1.0f)
#define kPPScreenshotBorderScreenshotRadiusDefaultValue @(0.0f)
#define kPPScreenshotBorderScreenshotDefaults @{PPScreenshotKeyBorder : @{PPScreenshotKeyShow : kPPScreenshotBorderScreenshotShowDefaultValue, PPScreenshotKeyColor : kPPScreenshotBorderScreenshotDefaultColor, PPScreenshotKeyWidth : kPPScreenshotBorderScreenshotWidthDefaultValue}}
#define kPPScreenshotShadowDefaultColor [UIColor blackColor]
#define kPPScreenshotShadowWhiteColor [UIColor whiteColor]
#define kPPScreenshotShadowAlphaDefaultValue @(0.7f)
#define kPPScreenshotBlurDefaultColor [UIColor clearColor]
#define kPPScreenshotBlurAlphaDefaultValue @(0.8f)
#define kPPScreenshotBackgroundDefaultColor [UIColor whiteColor]
#define kPPScreenshotBackgroundAlphaDefaultValue @(1.0f)
#define kPPScreenshotButtonDefaultColor [UIColor colorWithHue:(24.0f/360.0f) saturation:(100.0f/100.0f) brightness:(83.0f/100.0f) alpha:1.0f]
#define kPPScreenshotButtonTitleColor [UIColor whiteColor]
#define kPPScreenshotButtonAlphaDefaultValue @(1.0f)
#define kPPScreenshotCloseDefaultColor [UIColor clearColor]
#define kPPScreenshotCloseTitleColor [UIColor colorWithHue:(6.0f/360.0f) saturation:(74.0f/100.0f) brightness:(91.0f/100.0f) alpha:1.0f]
#define kPPScreenshotCloseAlphaDefaultValue @(1.0f)

#define kPPScreenshotButtonTitleFont [UIFont systemFontOfSize:15.0f]
#define kPPScreenshotCloseTitleFontName @"FontAwesome"
#define kPPScreenshotCloseTitleFontSize 17.0f
#define kPPScreenshotCloseTitleFont [UIFont fontWithName:kPPScreenshotCloseTitleFontName size:kPPScreenshotCloseTitleFontSize]
#define kPPScreenshotTitleFont [UIFont boldSystemFontOfSize:17.0f]
#define kPPScreenshotMessageFont [UIFont systemFontOfSize:15.0f]

#define kPPScreenshotIndicatorEnabledDefaultValue @(YES)

#define kPPScreenshotEffectEnabledDefaultValue @(YES)
#define kPPScreenshotEffectMinimumValue @(-15.0f)
#define kPPScreenshotEffectMaximumValue @(15.0f)

#define kPPScreenshotGestureTapEnabledDefaultValue @(YES)
#define kPPScreenshotGestureSwipeEnabledDefaultValue @(YES)

#define kPPScreenshotRedactedDefaultValue @(YES)

//#define kPPScreenshotDefaultActivities @[UIActivityTypePostToFacebook, UIActivityTypePostToTwitter, UIActivityTypePostToWeibo, UIActivityTypeMessage, UIActivityTypeMail, UIActivityTypePostToFlickr, UIActivityTypePostToVimeo, UIActivityTypePostToTencentWeibo]
#define kPPScreenshotDefaultActivities nil
#define kPPScreenshotDefaultExcludes @[UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, UIActivityTypeAddToReadingList, UIActivityTypeAirDrop, UIActivityTypeOpenInIBooks]
#define kPPScreenshotDefaultExcludesCompatibility @[UIActivityTypePrint, UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, UIActivityTypeAddToReadingList, UIActivityTypeAirDrop]
#define kPPScreenshotDefaultExcludesConditional ((NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_9_0) ? kPPScreenshotDefaultExcludesCompatibility : kPPScreenshotDefaultExcludes);

#pragma mark - NSDictionary

@implementation NSDictionary (Screenshot)

- (instancetype)dictionaryFromMergeWithDictionary:(NSDictionary *)dict
{
    if (dict.count > 0) {
        
        BOOL mutable = [self isMutable];
        
        NSMutableDictionary *m = (mutable ? self : [self mutableCopy]);
        [m mergeWithDictionary_:dict];
        
        return (mutable ? m : [m copy]);
    }
    
    return self;
}

- (BOOL)isMutable
{
    @try {
        id key = [[NSString alloc] initWithFormat:@"%p", self];
        [(id)self setObject:@"" forKey:key];
        [(id)self removeObjectForKey:key];
        return YES;
    }
    @catch (NSException *exception) {
        return NO;
    }
}

@end

#pragma mark - NSMutableDictionary

@implementation NSMutableDictionary (Screenshot)

- (void)mergeWithDictionary_:(NSDictionary *)dict
{
    NSArray *keys = dict.allKeys;
    
    for (id key in keys) {
        
        id o1 = [self objectForKey:key];
        id o2 = [dict objectForKey:key];	//should not be nil
        
        if (o1 && [o1 isKindOfClass:[NSDictionary class]] && [o2 isKindOfClass:[NSDictionary class]]) {	//merge dictionaries
            
            BOOL mutable = [o1 isMutable];
            
            NSMutableDictionary *m = (mutable ? o1 : [o1 mutableCopy]);
            [m mergeWithDictionary_:o2];
            
            [self setObject:(mutable ? m : [m copy]) forKey:key];	//preserve mutable instance
            
        } else {	//replace elses
            [self setObject:o2 forKey:key];
        }
    }
}

@end

#pragma mark - UIScreen

@implementation UIScreen (Screenshot)

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates
{
    return [self snapshotImageAfterScreenUpdates:afterUpdates userInfo:nil];
}

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates userInfo:(NSDictionary *)userInfo
{
    BOOL redacted = [(userInfo[PPScreenshotKeyRedacted] ?: kPPScreenshotRedactedDefaultValue) boolValue];
    return (redacted) ?
    [self snapshotImageRedactedAfterScreenUpdates:afterUpdates userInfo:userInfo] :	//no system overlay
    [self snapshotImageRawAfterScreenUpdates:YES userInfo:userInfo];   //with system overlay
}

- (UIImage *)snapshotImageRedactedAfterScreenUpdates:(BOOL)afterUpdates userInfo:(NSDictionary *)userInfo
{
    UIApplication *app = [UIApplication sharedApplication];
    UIWindow *window = app.keyWindow;
    NSArray *windows = app.windows;
    CGRect bounds = window.bounds;
    
	//capture screen to image
    UIGraphicsBeginImageContextWithOptions(bounds.size, YES, 0);
    
    BOOL drawed = NO;
    for (UIWindow *win in windows) {
        [win drawViewHierarchyInRect:bounds afterScreenUpdates:afterUpdates];	//composite windows
        if (win == window) {
            drawed = YES;
        }
    }
    if (!drawed) {
        [window drawViewHierarchyInRect:bounds afterScreenUpdates:afterUpdates];
    }
    
	//border defaults
    NSNumber *borderShow = nil;
    UIColor *borderColor = nil;
    NSNumber *borderWidth = nil;
    
    if (userInfo.count > 0) {	//preparation
        NSDictionary *border = userInfo[PPScreenshotKeyBorder];
        borderShow = border[PPScreenshotKeyShow] ?: kPPScreenshotBorderScreenshotShowDefaultValue;
        borderColor = border[PPScreenshotKeyColor] ?: kPPScreenshotBorderScreenshotDefaultColor;
        borderWidth = border[PPScreenshotKeyWidth] ?: kPPScreenshotBorderScreenshotWidthDefaultValue;
    }
    
    if (borderShow.boolValue) {	//add border
        CGFloat width = borderWidth.floatValue;
        CGFloat scale = window.screen.scale;
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
        CGContextStrokeRectWithWidth(context, CGRectInset(bounds, (width / scale), (width / scale)), width);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)snapshotImageRawAfterScreenUpdates:(BOOL)afterUpdates userInfo:(NSDictionary *)userInfo	//only in simulator
{
#if TARGET_IPHONE_SIMULATOR
    
    UIScreen *screen = [UIScreen mainScreen];
    CGRect bounds = screen.bounds;
    
    UIView *view = [screen snapshotViewAfterScreenUpdates:afterUpdates];
    
    //capture screen to image
    UIGraphicsBeginImageContextWithOptions(bounds.size, YES, 0);
    [view drawViewHierarchyInRect:bounds afterScreenUpdates:afterUpdates];
    
    //border defaults
    NSNumber *borderShow = nil;
    UIColor *borderColor = nil;
    NSNumber *borderWidth = nil;
    
    if (userInfo.count > 0) {	//preparation
        NSDictionary *border = userInfo[PPScreenshotKeyBorder];
        borderShow = border[PPScreenshotKeyShow] ?: kPPScreenshotBorderScreenshotShowDefaultValue;
        borderColor = border[PPScreenshotKeyColor] ?: kPPScreenshotBorderScreenshotDefaultColor;
        borderWidth = border[PPScreenshotKeyWidth] ?: kPPScreenshotBorderScreenshotWidthDefaultValue;
    }
    
    if (borderShow.boolValue) {	//add border
        CGFloat width = borderWidth.floatValue;
        CGFloat scale = screen.scale;
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
        CGContextStrokeRectWithWidth(context, CGRectInset(bounds, (width / scale), (width / scale)), width);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
#else
    
    return [self snapshotImageRedactedAfterScreenUpdates:afterUpdates userInfo:userInfo];
    
#endif
}

@end

#pragma mark - UIWindow

@implementation UIWindow (Screenshot)

- (UIViewController *)activeViewController
{
    return [self activeViewController:nil];
}

#pragma mark Internal

- (UIViewController *)activeViewController:(UIViewController *)controller
{
    if (controller) {
        
        UIViewController *c = controller.presentedViewController;
        if (c) {	//modal
        	//noop
        } else if ([controller respondsToSelector:@selector(selectedViewController)]) {	//tabbar
            c = [(id)controller selectedViewController];
        } else if ([controller respondsToSelector:@selector(visibleViewController)]) {	//navigation
            c = [(id)controller visibleViewController];
        } else {	//containers
            NSArray *childs = controller.childViewControllers;
            c = childs.lastObject;
        }
        if (c) {
            return [self activeViewController:c];
        }
        
        return controller;
        
    } else {	//start from root
        UIApplication *app = [UIApplication sharedApplication];
        UIWindow *window = app.keyWindow;
        UIViewController *root = window.rootViewController;
        
        return [self activeViewController:root];
    }
}

@end

#pragma mark - PPScreenshotShareController

@interface PPScreenshotShareController () <UIGestureRecognizerDelegate> {
    NSDictionary *_theme;	//cached theme
}

@property (weak, nonatomic) IBOutlet UIView *shadow;	//dynamic
@property (weak, nonatomic) IBOutlet UIView *background;
@property (weak, nonatomic) IBOutlet UIImageView *screenshot;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@property (weak, nonatomic) IBOutlet UIButton *buttonClose;
@property (weak, nonatomic) IBOutlet UIButton *buttonAction;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *act;

@property (weak, nonatomic) IBOutlet UITapGestureRecognizer *gesture;
@property (weak, nonatomic) IBOutlet UISwipeGestureRecognizer *swipe;

@end

#pragma mark - PPScreenshotShareController

@implementation PPScreenshotShareController

#pragma mark - Initializations

+ (void)load
{
    __weak NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    id __block tokenLaunch = [center addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:nil usingBlock:^(NSNotification  *_Nonnull note) {
        
        [self attach];	//add screenshot handler
    }];
    
    id __block tokenTerminate = [center addObserverForName:UIApplicationWillTerminateNotification object:nil queue:nil usingBlock:^(NSNotification  *_Nonnull note) {
        
        [center removeObserver:tokenLaunch];	//cleanups
        [center removeObserver:tokenTerminate];
        
        [self detach];	//remove screenshot handler
    }];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (!nibBundleOrNil) nibBundleOrNil = [NSBundle bundleForClass:[self class]];
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.modalTransitionStyle = kPPScreenshotModalTransitionStyle;	//defaults
        self.modalPresentationStyle = kPPScreenshotModalPresentation;
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self themes];	//customize view
}

#pragma mark - View customizations

- (void)themes
{
    NSDictionary *theme = _data[PPScreenshotKeyTheme];
    PPScreenshotThemeType type = [theme[PPScreenshotKeyType] integerValue];	//default to PPScreenshotThemeTypeDefault
    
    NSDictionary *data = _theme ?: [[self themeForType:type] dictionaryFromMergeWithDictionary:_data];
    _theme = data;	//cache expensive object
    
    NSDictionary *customization = data[PPScreenshotKeyCustomization];	//theme customization root
    
    if (customization.count > 0) {
        NSDictionary *modal = customization[PPScreenshotKeyModal];	//modal
        if (modal.count > 0) {
            
            self.modalTransitionStyle = [(modal[PPScreenshotKeyTransition] ?: @(kPPScreenshotModalTransitionStyle)) integerValue];	//defaults
            self.modalPresentationStyle = [(modal[PPScreenshotKeyPresentation] ?: @(kPPScreenshotModalPresentation)) integerValue];
        }
    }
    
    if (!self.viewLoaded) return;	//again after -viewDidLoad
    
    [self setupShadowViewForThemeType:type];	//create shadow based on theme type
    
    if (customization.count > 0) {
        NSDictionary *border = customization[PPScreenshotKeyBorder];	//border
        if (border.count > 0) {
            
            NSDictionary *background = border[PPScreenshotKeyBackground];	//background
            UIColor *color = (background[PPScreenshotKeyColor] ?: kPPScreenshotBorderBackgroundDefaultColor);	//defaults
            CGFloat width = [(background[PPScreenshotKeyWidth] ?: kPPScreenshotBorderBackgroundWidthDefaultValue) floatValue];
            CGFloat radius = [(background[PPScreenshotKeyRadius] ?: kPPScreenshotBorderBackgroundRadiusDefaultValue) floatValue];
            
            CALayer *layer = _background.layer;
            layer.borderColor = color.CGColor;
            layer.borderWidth = width;
            layer.cornerRadius = radius;
            
            NSDictionary *button = border[PPScreenshotKeyButton];	//button
            color = (button[PPScreenshotKeyColor] ?: kPPScreenshotBorderButtonDefaultColor);	//defaults
            width = [(button[PPScreenshotKeyWidth] ?: kPPScreenshotBorderButtonWidthDefaultValue) floatValue];
            radius = [(button[PPScreenshotKeyRadius] ?: kPPScreenshotBorderButtonRadiusDefaultValue) floatValue];
            
        	//borders
            layer = _buttonAction.layer;
            layer.borderColor = color.CGColor;
            layer.borderWidth = width;
            layer.cornerRadius = radius;
        }
        
        NSDictionary *color = customization[PPScreenshotKeyColor];	//color
        if (color.count > 0) {
            
            NSDictionary *shadow = color[PPScreenshotKeyShadow];	//shadow
            UIColor *colour = (shadow[PPScreenshotKeyColor] ?: kPPScreenshotShadowDefaultColor);	//defaults
            CGFloat alpha = [(shadow[PPScreenshotKeyAlpha] ?: kPPScreenshotShadowAlphaDefaultValue) floatValue];
            _shadow.backgroundColor = colour;
            _shadow.alpha = alpha;
            
            NSDictionary *background = color[PPScreenshotKeyBackground];	//background
            colour = (background[PPScreenshotKeyColor] ?: kPPScreenshotBackgroundDefaultColor);	//defaults
            alpha = [(background[PPScreenshotKeyAlpha] ?: kPPScreenshotBackgroundAlphaDefaultValue) floatValue];
            _background.backgroundColor = colour;
            _background.alpha = alpha;
            
            NSDictionary *close = color[PPScreenshotKeyClose];	//close
            colour = (close[PPScreenshotKeyColor] ?: kPPScreenshotCloseDefaultColor);	//defaults
            alpha = [(close[PPScreenshotKeyAlpha] ?: kPPScreenshotCloseAlphaDefaultValue) floatValue];
            UIColor *title = (close[PPScreenshotKeyTitle] ?: kPPScreenshotCloseTitleColor);
            _buttonClose.backgroundColor = colour;
            _buttonClose.alpha = alpha;
            [_buttonClose setTitleColor:title forState:UIControlStateNormal];
            
            NSDictionary *button = color[PPScreenshotKeyButton];	//button
            colour = (button[PPScreenshotKeyColor] ?: kPPScreenshotButtonDefaultColor);	//defaults
            alpha = [(button[PPScreenshotKeyAlpha] ?: kPPScreenshotButtonAlphaDefaultValue) floatValue];
            title = (button[PPScreenshotKeyTitle] ?: kPPScreenshotButtonTitleColor);
            _buttonAction.backgroundColor = colour;
            _buttonAction.alpha = alpha;
            [_buttonAction setTitleColor:title forState:UIControlStateNormal];
        }
        
        NSDictionary *title = customization[PPScreenshotKeyTitle];	//title
        if (title.count > 0) {
            
            NSDictionary *close = title[PPScreenshotKeyClose];	//close
            CGFloat size = [(close[PPScreenshotKeySize] ?: @(kPPScreenshotCloseTitleFontSize)) floatValue];	//defaults
            PPScreenshotButtonCloseType type = [(close[PPScreenshotKeyType] ?: @(PPScreenshotButtonCloseTypeDefault)) integerValue];
            NSString *text;
            switch (type) {
                case PPScreenshotButtonCloseTypeSimple: {
                    text = (id)kPPScreenshotButtonCloseTypeSimpleText;	//x
                    break;
                }
                case PPScreenshotButtonCloseTypeBordered: {
                    text = (id)kPPScreenshotButtonCloseTypeBorderedText;	//circled x
                    break;
                }
                case PPScreenshotButtonCloseTypeFilled:
                default: {
                    text = (id)kPPScreenshotButtonCloseTypeFilledText;	//filled x
                    break;
                }
            }
            _buttonClose.titleLabel.font = [UIFont fontWithName:kPPScreenshotCloseTitleFontName size:size];
            [_buttonClose setTitle:text forState:UIControlStateNormal];
        }
        
        NSDictionary *indicator = customization[PPScreenshotKeyIndicator];	//indicator
        if (indicator.count > 0) {
            
            BOOL enabled = [(indicator[PPScreenshotKeyEnabled] ?: kPPScreenshotIndicatorEnabledDefaultValue) boolValue];	//defaults
            
            _act.hidesWhenStopped = enabled;
            _act.hidden = YES;
        }
        
        NSDictionary *effect = customization[PPScreenshotKeyEffect];	//effect
        if (effect.count > 0) {
            
            BOOL enabled = [(effect[PPScreenshotKeyEnabled] ?: kPPScreenshotEffectEnabledDefaultValue) boolValue];	//defaults
            CGFloat minimum = [(effect[PPScreenshotKeyMinimum] ?: kPPScreenshotEffectMinimumValue) floatValue];
            CGFloat maximum = [(effect[PPScreenshotKeyMaximum] ?: kPPScreenshotEffectMaximumValue) floatValue];
            
            NSArray  *effects = _background.motionEffects;
            for (UIMotionEffect *effect in effects) {	//shadows effect outside
                [_background removeMotionEffect:effect];	//clear current effects
            }
            
            if (enabled) {	//add effect
                UIInterpolatingMotionEffect *h = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
                UIInterpolatingMotionEffect *v = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
                
                h.minimumRelativeValue = v.minimumRelativeValue = @(minimum);
                h.maximumRelativeValue = v.maximumRelativeValue = @(maximum);
                
                UIMotionEffectGroup *effects = [UIMotionEffectGroup new];
                effects.motionEffects = @[h, v];
                
                [_background addMotionEffect:effects];
            }
        }
    }
    
    [self content];	//setup content
}

- (NSDictionary *)themeForType:(PPScreenshotThemeType)type
{
    return [[self class] themeForType:type];	//proxy for +themeForType:
}

- (void)setupShadowViewForThemeType:(PPScreenshotThemeType)type
{
	//quick exit with cache
    if ([_shadow isKindOfClass:[UIVisualEffectView class]]) {
        UIVisualEffectView *view = (id)_shadow;
        UIBlurEffect *effect = (id)view.effect;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        UIBlurEffectStyle style = ([effect respondsToSelector:@selector(_style)]) ? (UIBlurEffectStyle)[effect performSelector:@selector(_style)] : UIBlurEffectStyleExtraLight;
#pragma clang diagnostic pop
        
        if (type == PPScreenshotThemeTypeBlurLight) {
            if (style == UIBlurEffectStyleLight) {
                return;
            }
        } else if (type == PPScreenshotThemeTypeBlurDark) {
            if (style == UIBlurEffectStyleDark) {
                return;
            }
        }
        
    } else {
        UIView *view = _shadow;
        
        if (type == PPScreenshotThemeTypeTransparentLight) {
            view.backgroundColor = kPPScreenshotShadowWhiteColor;
            return;
        } else if ((type == PPScreenshotThemeTypeTransparentDark) || (type == PPScreenshotThemeTypeDefault)) {
            view.backgroundColor = kPPScreenshotShadowDefaultColor;
            return;
        }
    }
    
    UIView *shadow = [self buildShadowViewForThemeType:type];	//create shadow based on theme type
    [self.view insertSubview:shadow belowSubview:_shadow];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(shadow);	//align all side to container
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[shadow]-0-|" options:0 metrics:nil views:views];
    [NSLayoutConstraint activateConstraints:constraints];
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[shadow]-0-|" options:0 metrics:nil views:views];
    [NSLayoutConstraint activateConstraints:constraints];
    
    [_shadow removeFromSuperview];
    _shadow = shadow;
}

- (UIView *)buildShadowViewForThemeType:(PPScreenshotThemeType)type
{
    UIView *view;
    
    switch (type) {
        case PPScreenshotThemeTypeBlurLight: {	//blur effect
            view = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
            break;
        }
        case PPScreenshotThemeTypeBlurDark: {
            view = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
            break;
        }
        case PPScreenshotThemeTypeTransparentLight: {	//transparent view
            view = [UIView new];
            view.backgroundColor = kPPScreenshotShadowWhiteColor;
            break;
        }
        case PPScreenshotThemeTypeTransparentDark:
        default: {
            view = [UIView new];
            view.backgroundColor = kPPScreenshotShadowDefaultColor;
            break;
        }
    }
    
    view.frame = self.view.frame;	//equals container
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    return view;
}

- (void)content
{
    if (!self.viewLoaded) return;	//again after -viewDidLoad
    
    NSDictionary *content = _data[PPScreenshotKeyContent];	//content root
    if (content.count > 0) {
        
        NSDictionary *title = content[PPScreenshotKeyTitle];	//title
        if (title.count > 0) {
            
            UIFont *font = title[PPScreenshotKeyFont] ?: kPPScreenshotTitleFont;	//defaults
            NSString *text = title[PPScreenshotKeyText] ?: kPPScreenshotDefaultTitle;
            _titleLabel.font = font;
            _titleLabel.text = text;
        }
        
        NSDictionary *message = content[PPScreenshotKeyMessage];	//message
        if (message.count > 0) {
            
            UIFont *font = message[PPScreenshotKeyFont] ?: kPPScreenshotMessageFont;	//defaults
            NSString *text = message[PPScreenshotKeyText] ?: kPPScreenshotDefaultMessage;
            _messageLabel.font = font;
            _messageLabel.text = text;
        }
        
        NSDictionary *button = content[PPScreenshotKeyButton];	//button
        if (button.count > 0) {
            
            UIFont *font = button[PPScreenshotKeyFont] ?: kPPScreenshotButtonTitleFont;	//defaults
            NSString *text = button[PPScreenshotKeyText] ?: kPPScreenshotButtonActionDefaultText;
            _buttonAction.titleLabel.font = font;
            [_buttonAction setTitle:text forState:UIControlStateNormal];
        }
        
        UIImage *image = content[PPScreenshotKeyScreenshot];	//image
        _screenshot.image = image;
    }
}

- (void)interactive:(BOOL)enabled	//adjust interactions
{
    for (UIButton *button in _buttons) {
        button.enabled = enabled;
    }
    
    _gesture.enabled = enabled;
}

#pragma mark - Properties

- (void)setData:(NSDictionary *)data	//configuration parameters
{
    if (_data != data) {
        _data = [data copy];
        
        _theme = nil;	//clear cache
        [self themes];
    }
}

- (void)resetHandlers
{
    self.doScreenshotHandler = NULL;
    self.willPresentHandler = NULL;
    self.willDismissHandler = NULL;
    self.didPresentHandler = NULL;
    self.didDismissHandler = NULL;
    self.doActionHandler = NULL;
    self.didActionHandler = NULL;
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.isViewLoaded && (self.view.window == nil)) {
        self.view = nil;	//purge view
    }
    
    _theme = nil;	//purge cache
    [[self class] clearInstance];
}

#ifdef _DEBUG
- (void)dealloc
{
    NSLOG(@"%@: %@", [self class], NSStringFromSelector(_cmd));
}
#endif

#pragma mark - View actions

- (IBAction)gesture:(id)sender	//gesture router
{
    NSDictionary *customization = _data[PPScreenshotKeyCustomization];	//honor dismiss gesture preferences
    NSDictionary *gesture = customization[PPScreenshotKeyGesture];
    NSNumber *should = @(YES);
    
    if ([sender isKindOfClass:[UITapGestureRecognizer class]]) {
        NSDictionary *recognizer = gesture[PPScreenshotKeyTap];
        should = recognizer[PPScreenshotKeyEnabled] ?: kPPScreenshotGestureTapEnabledDefaultValue;
    } else if ([sender isKindOfClass:[UISwipeGestureRecognizer class]]) {
        NSDictionary *recognizer = gesture[PPScreenshotKeySwipe];
        should = recognizer[PPScreenshotKeyEnabled] ?: kPPScreenshotGestureSwipeEnabledDefaultValue;
    }
    
    if (should.boolValue) {
        [self dismiss:NO];	//dismiss self
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        return ![touch.view isDescendantOfView:_background];	//skip dismiss touch inside background
    }
    
    return YES;
}

- (IBAction)tap:(id)sender	//tap router
{
    UIView *view = sender;
    NSInteger tag = view.tag;
    
    switch (tag) {
        case 900: {	//close
            [self dismiss:NO];
            break;
        }
            
        case 100: {	//action
            [self action];
            break;
        }
            
        default: {	//noop
            break;
        }
    }
}

- (void)dismiss:(BOOL)action
{
    [[self class] dismiss:action controller:self];  //send to class method
}

- (void)action
{
    [self interactive:NO];	//no more actions
    
    [_act startAnimating];
    
    NSDictionary *content = _data[PPScreenshotKeyContent];
    NSDictionary *share = content[PPScreenshotKeyShare];
    NSArray *items = share[PPScreenshotKeyItems];
    if (items.count == 0) {	//build shared object
        UIImage *image = content[PPScreenshotKeyScreenshot];
        
        if (!image) {
            [_act stopAnimating];
            
            [self interactive:YES];	//revert
            
            return;	//or assert
        }
        
        NSString *text = share[PPScreenshotKeyText];    //optionals
        NSURL *url = share[PPScreenshotKeyUrl];
        
        NSMutableArray *mutable = [[NSMutableArray alloc] initWithCapacity:items.count];
        [mutable addObject:image];
        if (text) [mutable addObject:text];
        if (url) [mutable addObject:url];
        
        items = [mutable copy];	//shared object. discards mutability
    }
    
    NSArray *activities = share[PPScreenshotKeyActivities] ?: kPPScreenshotDefaultActivities;	//defaults
    NSArray *excludes = share[PPScreenshotKeyExcludes] ?: kPPScreenshotDefaultExcludesConditional;	//ios 8.0- / 9.0+
    
    UIActivityViewController *c = [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:activities];
    c.excludedActivityTypes = excludes;
    
    __weak id weak = c;
    
    c.completionWithItemsHandler = ^(NSString  *__nullable activityType, BOOL completed, NSArray  *__nullable returnedItems, NSError  *__nullable activityError) {	//ios 8.0+
        
        PPScreenshotViewControllerLifeCycleHandler block = _didActionHandler;
        if (block) {
            NSMutableDictionary *mutable = [[NSMutableDictionary alloc] initWithCapacity:5];	//build result object
            mutable[PPScreenshotKeyController] = weak;
            mutable[PPScreenshotKeyActivityType] = activityType;
            mutable[PPScreenshotKeyCompleted] = @(completed);
            mutable[PPScreenshotKeyReturnedItems] = returnedItems;
            mutable[PPScreenshotKeyActivityError] = activityError;
            
            block(self, [mutable copy]);	//discards mutability
        }
        
        if (completed) {	//action completed
            [self dismiss:YES];
            
        } else {	//action canceled
            [_act stopAnimating];
        }
    };
    
    [self presentViewController:c animated:YES completion:^{	//show share
        
        PPScreenshotViewControllerLifeCycleHandler block = _doActionHandler;
        if (block) {
            block(self, @{PPScreenshotKeyController : c, PPScreenshotKeyItems : items});
        }
        
        [self interactive:YES];	//revert
    }];
}

#pragma mark - Methods

#pragma mark - Private methods

+ (void)handler:(NSNotification *)notification
{
    [self present:notification];	//show screenshot
}

+ (void)present:(NSNotification *)notification
{
    NSDictionary *data = pp_screenshot_observer_data;
    NSDictionary *content = data[PPScreenshotKeyContent];
    UIImage *screenshot = content[PPScreenshotKeyScreenshot];
    
    PPScreenshotShareController *c = pp_screenshot_observer_instance ?: [PPScreenshotShareController new];
    pp_screenshot_observer_instance = c;	//cache expensive object
    
    if (!screenshot) {	//default
        screenshot = [self composeScreenshot:data];	//with border
        
        if (screenshot) {
            
            data = [(data ?: @{}) dictionaryFromMergeWithDictionary:@{PPScreenshotKeyContent : @{PPScreenshotKeyScreenshot : screenshot}}];	//add it to data
            
            PPScreenshotViewControllerLifeCycleHandler block = c.doScreenshotHandler ?: pp_screenshot_observer_screenshot_handler;
            if (block) {
                block(c, @{PPScreenshotKeyScreenshot : screenshot});
            }
            
        } else {
            return;	//or assert
        }
    }
    
    c.data = data;	//pass everything
    
    c.enabled = pp_screenshot_observer_enabled;
    c.doScreenshotHandler = pp_screenshot_observer_screenshot_handler;
    c.willPresentHandler = pp_screenshot_observer_present_handler;
    c.willDismissHandler = pp_screenshot_observer_dismiss_handler;
    c.didPresentHandler = pp_screenshot_observer_presented_handler;
    c.didDismissHandler = pp_screenshot_observer_dismissed_handler;
    c.doActionHandler = pp_screenshot_observer_action_handler;
    c.didActionHandler = pp_screenshot_observer_completion_handler;
    
    PPScreenshotViewControllerLifeCycleHandler block = c.willPresentHandler ?: pp_screenshot_observer_present_handler;
    if (block) {
        block(c, data);
    }
    
    UIApplication *app = [UIApplication sharedApplication];
    UIWindow *window = app.keyWindow;
    UIViewController *active = window.activeViewController;
    [active presentViewController:c animated:YES completion:^{	//show screenshot
        
        PPScreenshotViewControllerLifeCycleHandler block = c.didPresentHandler ?: pp_screenshot_observer_presented_handler;
        if (block) {
            block(c, data);
        }
    }];
}

+ (void)dismiss:(BOOL)action controller:(PPScreenshotShareController *)controller
{
    [controller interactive:NO];	//no more actions
    
    PPScreenshotViewControllerLifeCycleHandler block = controller.willDismissHandler ?: pp_screenshot_observer_dismiss_handler;
    if (block) {
        block(controller, @{PPScreenshotKeyAction : @(action)});
    }
    
    [controller dismissViewControllerAnimated:YES completion:^{
        
        [controller interactive:YES];	//revert
        
        [controller.act stopAnimating];
        
        pp_screenshot_observer_flag = NO;	//set at +observe.block:
        
        PPScreenshotViewControllerLifeCycleHandler block = controller.didDismissHandler ?: pp_screenshot_observer_dismissed_handler;
        if (block) {
            block(controller, @{PPScreenshotKeyAction : @(action)});
        }
    }];
}

+ (UIImage *)composeScreenshot:(NSDictionary *)option
{
    NSDictionary *userInfo;	//build border configuration based on data
    NSDictionary *customization = option[PPScreenshotKeyCustomization];
    NSDictionary *border = customization[PPScreenshotKeyBorder];
    NSDictionary *renamed = border[PPScreenshotKeyScreenshot];
    
    if (renamed.count > 0) {
        userInfo = @{PPScreenshotKeyBorder : renamed};
    } else {
        userInfo = kPPScreenshotBorderScreenshotDefaults;	//defaults
    }
    
    return [[UIScreen mainScreen] snapshotImageAfterScreenUpdates:NO userInfo:userInfo];	//with border
}

#pragma mark - Internal methods

static id pp_screenshot_observer_token = nil;	//observer id
static BOOL pp_screenshot_observer_flag = NO;	//observer serializer

+ (void)observe
{
    [self deobserve];	//only one
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    pp_screenshot_observer_token = [center addObserverForName:UIApplicationUserDidTakeScreenshotNotification object:nil queue:nil usingBlock:^(NSNotification  *_Nonnull note) {
        
        if (pp_screenshot_observer_enabled) {	//status
            
            if (pp_screenshot_observer_flag) return;	//serialize
            pp_screenshot_observer_flag = YES;	//reset at +dismiss:
            
            dispatch_async(dispatch_get_main_queue(), ^{	//exit notification tree
                
                [self handler:note];	//screenshot handler
            });
        }
        
    }];
}

+ (void)deobserve
{
    if (!pp_screenshot_observer_token) return;	//validate
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:pp_screenshot_observer_token];
    
    pp_screenshot_observer_token = nil;
}

#pragma mark - Public methods

+ (Class)attach
{
    dispatch_async(dispatch_get_main_queue(), ^{	//return quickly, exit notification tree
        [self observe];
    });
    
    return self;
}

+ (Class)detach
{
    [self deobserve];
    
    return self;
}

#pragma mark Configuration

static NSDictionary *pp_screenshot_observer_data = nil;	//preferences

+ (Class)setData:(nullable NSDictionary *)data
{
    if (pp_screenshot_observer_data != data) {
        pp_screenshot_observer_data = [data copy];
    }
    
    return self;
}

+ (NSDictionary *)themeForType:(PPScreenshotThemeType)type
{
    NSDictionary *theme;
    
    switch (type) {
        case PPScreenshotThemeTypeBlurLight: {	//blur light
            theme = @{
                      PPScreenshotKeyTheme : @{
                              PPScreenshotKeyType : @(PPScreenshotThemeTypeBlurLight)
                              }
                      ,
                      PPScreenshotKeyCustomization : @{
                              PPScreenshotKeyModal : @{
                                      PPScreenshotKeyTransition : @(kPPScreenshotModalTransitionStyle),
                                      PPScreenshotKeyPresentation : @(kPPScreenshotModalPresentation)
                                      }
                              ,
                              PPScreenshotKeyBorder : @{
                                      PPScreenshotKeyBackground : @{
                                              PPScreenshotKeyColor : kPPScreenshotBorderBackgroundDefaultColor,
                                              PPScreenshotKeyWidth : kPPScreenshotBorderBackgroundWidthDefaultValue,
                                              PPScreenshotKeyRadius : kPPScreenshotBorderBackgroundRadiusDefaultValue
                                              },
                                      PPScreenshotKeyButton : @{
                                              PPScreenshotKeyColor : kPPScreenshotBorderButtonDefaultColor,
                                              PPScreenshotKeyWidth : kPPScreenshotBorderButtonWidthDefaultValue,
                                              PPScreenshotKeyRadius : kPPScreenshotBorderButtonRadiusDefaultValue
                                              },
                                      PPScreenshotKeyScreenshot : @{
                                              PPScreenshotKeyColor : kPPScreenshotBorderScreenshotDefaultColor,
                                              PPScreenshotKeyWidth : kPPScreenshotBorderScreenshotWidthDefaultValue,
                                              PPScreenshotKeyRadius : kPPScreenshotBorderScreenshotRadiusDefaultValue
                                              }
                                      }
                              ,
                              PPScreenshotKeyColor : @{
                                      PPScreenshotKeyShadow : @{
                                              PPScreenshotKeyColor : kPPScreenshotBlurDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotBlurAlphaDefaultValue
                                              },
                                      PPScreenshotKeyBackground : @{
                                              PPScreenshotKeyColor : kPPScreenshotBackgroundDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotBackgroundAlphaDefaultValue
                                              },
                                      PPScreenshotKeyClose : @{
                                              PPScreenshotKeyColor : kPPScreenshotCloseDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotCloseAlphaDefaultValue,
                                              PPScreenshotKeyTitle : kPPScreenshotCloseTitleColor
                                              },
                                      PPScreenshotKeyButton : @{
                                              PPScreenshotKeyColor : kPPScreenshotButtonDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotButtonAlphaDefaultValue,
                                              PPScreenshotKeyTitle : kPPScreenshotButtonTitleColor
                                              }
                                      }
                              ,
                              PPScreenshotKeyTitle : @{
                                      PPScreenshotKeyClose : @{
                                              PPScreenshotKeyType : @(PPScreenshotButtonCloseTypeDefault),
                                              PPScreenshotKeySize : @(kPPScreenshotCloseTitleFontSize)
                                              }
                                      }
                              ,
                              PPScreenshotKeyIndicator : @{
                                      PPScreenshotKeyEnabled : kPPScreenshotIndicatorEnabledDefaultValue
                                      }
                              ,
                              PPScreenshotKeyEffect : @{
                                      PPScreenshotKeyEnabled : kPPScreenshotEffectEnabledDefaultValue,
                                      PPScreenshotKeyMinimum : kPPScreenshotEffectMinimumValue,
                                      PPScreenshotKeyMaximum : kPPScreenshotEffectMaximumValue
                                      }
                              ,
                              PPScreenshotKeyGesture : @{
                                      PPScreenshotKeyTap : @{
                                              PPScreenshotKeyEnabled : kPPScreenshotGestureTapEnabledDefaultValue
                                              },
                                      PPScreenshotKeySwipe : @{
                                              PPScreenshotKeyEnabled : kPPScreenshotGestureSwipeEnabledDefaultValue
                                              }
                                      }
                              }
                      };
            break;
        }
        case PPScreenshotThemeTypeBlurDark: {	//blur dark
            theme = @{
                      PPScreenshotKeyTheme : @{
                              PPScreenshotKeyType : @(PPScreenshotThemeTypeBlurDark)
                              }
                      ,
                      PPScreenshotKeyCustomization : @{
                              PPScreenshotKeyModal : @{
                                      PPScreenshotKeyTransition : @(kPPScreenshotModalTransitionStyle),
                                      PPScreenshotKeyPresentation : @(kPPScreenshotModalPresentation)
                                      }
                              ,
                              PPScreenshotKeyBorder : @{
                                      PPScreenshotKeyBackground : @{
                                              PPScreenshotKeyColor : kPPScreenshotBorderBackgroundDefaultColor,
                                              PPScreenshotKeyWidth : kPPScreenshotBorderBackgroundWidthDefaultValue,
                                              PPScreenshotKeyRadius : kPPScreenshotBorderBackgroundRadiusDefaultValue
                                              },
                                      PPScreenshotKeyButton : @{
                                              PPScreenshotKeyColor : kPPScreenshotBorderButtonDefaultColor,
                                              PPScreenshotKeyWidth : kPPScreenshotBorderButtonWidthDefaultValue,
                                              PPScreenshotKeyRadius : kPPScreenshotBorderButtonRadiusDefaultValue
                                              },
                                      PPScreenshotKeyScreenshot : @{
                                              PPScreenshotKeyColor : kPPScreenshotBorderScreenshotDefaultColor,
                                              PPScreenshotKeyWidth : kPPScreenshotBorderScreenshotWidthDefaultValue,
                                              PPScreenshotKeyRadius : kPPScreenshotBorderScreenshotRadiusDefaultValue
                                              }
                                      }
                              ,
                              PPScreenshotKeyColor : @{
                                      PPScreenshotKeyShadow : @{
                                              PPScreenshotKeyColor : kPPScreenshotBlurDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotBlurAlphaDefaultValue
                                              },
                                      PPScreenshotKeyBackground : @{
                                              PPScreenshotKeyColor : kPPScreenshotBackgroundDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotBackgroundAlphaDefaultValue
                                              },
                                      PPScreenshotKeyClose : @{
                                              PPScreenshotKeyColor : kPPScreenshotCloseDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotCloseAlphaDefaultValue,
                                              PPScreenshotKeyTitle : kPPScreenshotCloseTitleColor
                                              },
                                      PPScreenshotKeyButton : @{
                                              PPScreenshotKeyColor : kPPScreenshotButtonDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotButtonAlphaDefaultValue,
                                              PPScreenshotKeyTitle : kPPScreenshotButtonTitleColor
                                              }
                                      }
                              ,
                              PPScreenshotKeyTitle : @{
                                      PPScreenshotKeyClose : @{
                                              PPScreenshotKeyType : @(PPScreenshotButtonCloseTypeDefault),
                                              PPScreenshotKeySize : @(kPPScreenshotCloseTitleFontSize)
                                              }
                                      }
                              ,
                              PPScreenshotKeyIndicator : @{
                                      PPScreenshotKeyEnabled : kPPScreenshotIndicatorEnabledDefaultValue
                                      }
                              ,
                              PPScreenshotKeyEffect : @{
                                      PPScreenshotKeyEnabled : kPPScreenshotEffectEnabledDefaultValue,
                                      PPScreenshotKeyMinimum : kPPScreenshotEffectMinimumValue,
                                      PPScreenshotKeyMaximum : kPPScreenshotEffectMaximumValue
                                      }
                              ,
                              PPScreenshotKeyGesture : @{
                                      PPScreenshotKeyTap : @{
                                              PPScreenshotKeyEnabled : kPPScreenshotGestureTapEnabledDefaultValue
                                              },
                                      PPScreenshotKeySwipe : @{
                                              PPScreenshotKeyEnabled : kPPScreenshotGestureSwipeEnabledDefaultValue
                                              }
                                      }
                              }
                      };
            break;
        }
        case PPScreenshotThemeTypeTransparentLight: {	//transparent light
            theme = @{
                      PPScreenshotKeyTheme : @{
                              PPScreenshotKeyType : @(PPScreenshotThemeTypeTransparentLight)
                              }
                      ,
                      PPScreenshotKeyCustomization : @{
                              PPScreenshotKeyModal : @{
                                      PPScreenshotKeyTransition : @(kPPScreenshotModalTransitionStyle),
                                      PPScreenshotKeyPresentation : @(kPPScreenshotModalPresentation)
                                      }
                              ,
                              PPScreenshotKeyBorder : @{
                                      PPScreenshotKeyBackground : @{
                                              PPScreenshotKeyColor : kPPScreenshotBorderBackgroundDefaultColor,
                                              PPScreenshotKeyWidth : kPPScreenshotBorderBackgroundWidthDefaultValue,
                                              PPScreenshotKeyRadius : kPPScreenshotBorderBackgroundRadiusDefaultValue
                                              },
                                      PPScreenshotKeyButton : @{
                                              PPScreenshotKeyColor : kPPScreenshotBorderButtonDefaultColor,
                                              PPScreenshotKeyWidth : kPPScreenshotBorderButtonWidthDefaultValue,
                                              PPScreenshotKeyRadius : kPPScreenshotBorderButtonRadiusDefaultValue
                                              },
                                      PPScreenshotKeyScreenshot : @{
                                              PPScreenshotKeyColor : kPPScreenshotBorderScreenshotDefaultColor,
                                              PPScreenshotKeyWidth : kPPScreenshotBorderScreenshotWidthDefaultValue,
                                              PPScreenshotKeyRadius : kPPScreenshotBorderScreenshotRadiusDefaultValue
                                              }
                                      }
                              ,
                              PPScreenshotKeyColor : @{
                                      PPScreenshotKeyShadow : @{
                                              PPScreenshotKeyColor : kPPScreenshotShadowDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotShadowAlphaDefaultValue
                                              },
                                      PPScreenshotKeyBackground : @{
                                              PPScreenshotKeyColor : kPPScreenshotBackgroundDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotBackgroundAlphaDefaultValue
                                              },
                                      PPScreenshotKeyClose : @{
                                              PPScreenshotKeyColor : kPPScreenshotCloseDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotCloseAlphaDefaultValue,
                                              PPScreenshotKeyTitle : kPPScreenshotCloseTitleColor
                                              },
                                      PPScreenshotKeyButton : @{
                                              PPScreenshotKeyColor : kPPScreenshotButtonDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotButtonAlphaDefaultValue,
                                              PPScreenshotKeyTitle : kPPScreenshotButtonTitleColor
                                              }
                                      }
                              ,
                              PPScreenshotKeyTitle : @{
                                      PPScreenshotKeyClose : @{
                                              PPScreenshotKeyType : @(PPScreenshotButtonCloseTypeDefault),
                                              PPScreenshotKeySize : @(kPPScreenshotCloseTitleFontSize)
                                              }
                                      }
                              ,
                              PPScreenshotKeyIndicator : @{
                                      PPScreenshotKeyEnabled : kPPScreenshotIndicatorEnabledDefaultValue
                                      }
                              ,
                              PPScreenshotKeyEffect : @{
                                      PPScreenshotKeyEnabled : kPPScreenshotEffectEnabledDefaultValue,
                                      PPScreenshotKeyMinimum : kPPScreenshotEffectMinimumValue,
                                      PPScreenshotKeyMaximum : kPPScreenshotEffectMaximumValue
                                      }
                              ,
                              PPScreenshotKeyGesture : @{
                                      PPScreenshotKeyTap : @{
                                              PPScreenshotKeyEnabled : kPPScreenshotGestureTapEnabledDefaultValue
                                              },
                                      PPScreenshotKeySwipe : @{
                                              PPScreenshotKeyEnabled : kPPScreenshotGestureSwipeEnabledDefaultValue
                                              }
                                      }
                              }
                      };
            break;
        }
        case PPScreenshotThemeTypeTransparentDark:
        default: {	//transparent dark
            theme = @{
                      PPScreenshotKeyTheme : @{
                              PPScreenshotKeyType : @(PPScreenshotThemeTypeTransparentDark)
                              }
                      ,
                      PPScreenshotKeyCustomization : @{
                              PPScreenshotKeyModal : @{
                                      PPScreenshotKeyTransition : @(kPPScreenshotModalTransitionStyle),
                                      PPScreenshotKeyPresentation : @(kPPScreenshotModalPresentation)
                                      }
                              ,
                              PPScreenshotKeyBorder : @{
                                      PPScreenshotKeyBackground : @{
                                              PPScreenshotKeyColor : kPPScreenshotBorderBackgroundDefaultColor,
                                              PPScreenshotKeyWidth : kPPScreenshotBorderBackgroundWidthDefaultValue,
                                              PPScreenshotKeyRadius : kPPScreenshotBorderBackgroundRadiusDefaultValue
                                              },
                                      PPScreenshotKeyButton : @{
                                              PPScreenshotKeyColor : kPPScreenshotBorderButtonDefaultColor,
                                              PPScreenshotKeyWidth : kPPScreenshotBorderButtonWidthDefaultValue,
                                              PPScreenshotKeyRadius : kPPScreenshotBorderButtonRadiusDefaultValue
                                              },
                                      PPScreenshotKeyScreenshot : @{
                                              PPScreenshotKeyColor : kPPScreenshotBorderScreenshotDefaultColor,
                                              PPScreenshotKeyWidth : kPPScreenshotBorderScreenshotWidthDefaultValue,
                                              PPScreenshotKeyRadius : kPPScreenshotBorderScreenshotRadiusDefaultValue
                                              }
                                      }
                              ,
                              PPScreenshotKeyColor : @{
                                      PPScreenshotKeyShadow : @{
                                              PPScreenshotKeyColor : kPPScreenshotShadowDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotShadowAlphaDefaultValue
                                              },
                                      PPScreenshotKeyBackground : @{
                                              PPScreenshotKeyColor : kPPScreenshotBackgroundDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotBackgroundAlphaDefaultValue
                                              },
                                      PPScreenshotKeyClose : @{
                                              PPScreenshotKeyColor : kPPScreenshotCloseDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotCloseAlphaDefaultValue,
                                              PPScreenshotKeyTitle : kPPScreenshotCloseTitleColor
                                              },
                                      PPScreenshotKeyButton : @{
                                              PPScreenshotKeyColor : kPPScreenshotButtonDefaultColor,
                                              PPScreenshotKeyAlpha : kPPScreenshotButtonAlphaDefaultValue,
                                              PPScreenshotKeyTitle : kPPScreenshotButtonTitleColor
                                              }
                                      }
                              ,
                              PPScreenshotKeyTitle : @{
                                      PPScreenshotKeyClose : @{
                                              PPScreenshotKeyType : @(PPScreenshotButtonCloseTypeDefault),
                                              PPScreenshotKeySize : @(kPPScreenshotCloseTitleFontSize)
                                              }
                                      }
                              ,
                              PPScreenshotKeyIndicator : @{
                                      PPScreenshotKeyEnabled : kPPScreenshotIndicatorEnabledDefaultValue
                                      }
                              ,
                              PPScreenshotKeyEffect : @{
                                      PPScreenshotKeyEnabled : kPPScreenshotEffectEnabledDefaultValue,
                                      PPScreenshotKeyMinimum : kPPScreenshotEffectMinimumValue,
                                      PPScreenshotKeyMaximum : kPPScreenshotEffectMaximumValue
                                      }
                              ,
                              PPScreenshotKeyGesture : @{
                                      PPScreenshotKeyTap : @{
                                              PPScreenshotKeyEnabled : kPPScreenshotGestureTapEnabledDefaultValue
                                              },
                                      PPScreenshotKeySwipe : @{
                                              PPScreenshotKeyEnabled : kPPScreenshotGestureSwipeEnabledDefaultValue
                                              }
                                      }
                              }
                      };
            break;
        }
    }
    
    return theme;
}

#pragma mark Status

static BOOL pp_screenshot_observer_enabled = YES;	//observer status

+ (Class)setEnabled:(BOOL)enabled
{
    pp_screenshot_observer_enabled = enabled;
    
    return self;
}

+ (BOOL)isEnabled
{
    return pp_screenshot_observer_enabled;
}

#pragma mark Instance

//static __weak PPScreenshotShareController *pp_screenshot_observer_instance = nil;	//instance
static PPScreenshotShareController *pp_screenshot_observer_instance = nil;	//cached instance

+ (nullable instancetype)activeInstance
{
    return pp_screenshot_observer_instance;
}

+ (Class)clearInstance
{
    pp_screenshot_observer_instance = nil;
    
    return self;
}

#pragma mark Handlers

static PPScreenshotViewControllerLifeCycleHandler pp_screenshot_observer_screenshot_handler = NULL;	//handlers
static PPScreenshotViewControllerLifeCycleHandler pp_screenshot_observer_present_handler = NULL;
static PPScreenshotViewControllerLifeCycleHandler pp_screenshot_observer_presented_handler = NULL;
static PPScreenshotViewControllerLifeCycleHandler pp_screenshot_observer_dismiss_handler = NULL;
static PPScreenshotViewControllerLifeCycleHandler pp_screenshot_observer_dismissed_handler = NULL;
static PPScreenshotViewControllerLifeCycleHandler pp_screenshot_observer_action_handler = NULL;
static PPScreenshotViewControllerLifeCycleHandler pp_screenshot_observer_completion_handler = NULL;

+ (Class)setDoScreenshotHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler
{
    pp_screenshot_observer_screenshot_handler = [handler copy];
    
    return self;
}

+ (Class)setWillPresentHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler
{
    pp_screenshot_observer_present_handler = [handler copy];
    
    return self;
}

+ (Class)setDidPresentHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler
{
    pp_screenshot_observer_presented_handler = [handler copy];
    
    return self;
}

+ (Class)setWillDismissHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler
{
    pp_screenshot_observer_dismiss_handler = [handler copy];
    
    return self;
}

+ (Class)setDidDismissHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler
{
    pp_screenshot_observer_dismissed_handler = [handler copy];
    
    return self;
}

+ (Class)setDoActionHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler
{
    pp_screenshot_observer_action_handler = [handler copy];
    
    return self;
}

+ (Class)setDidActionHandler:(nullable PPScreenshotViewControllerLifeCycleHandler)handler
{
    pp_screenshot_observer_completion_handler = [handler copy];
    
    return self;
}

+ (Class)resetHandlers
{
    [self setDoScreenshotHandler:NULL];
    [self setWillPresentHandler:NULL];
    [self setWillDismissHandler:NULL];
    [self setDidPresentHandler:NULL];
    [self setDidDismissHandler:NULL];
    [self setDoActionHandler:NULL];
    [self setDidActionHandler:NULL];
    
    return self;
}

@end
