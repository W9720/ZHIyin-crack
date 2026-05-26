#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSURLSessionDataTask (VIPHook)
@end

@implementation NSURLSessionDataTask (VIPHook)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(resume);
        SEL swizzledSelector = @selector(vip_swizzled_resume);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)vip_swizzled_resume {
    NSURLRequest *request = [self originalRequest];
    NSString *urlString = request.URL.absoluteString;
    
    if ([urlString containsString:@"user"] || 
        [urlString containsString:@"vip"] || 
        [urlString containsString:@"member"] ||
        [urlString containsString:@"profile"] ||
        [urlString containsString:@"info"]) {
        
        [self vip_interceptRequest:request];
        return;
    }
    
    [self vip_swizzled_resume];
}

- (void)vip_interceptRequest:(NSURLRequest *)request {
    NSURL *url = request.URL;
    
    NSMutableDictionary *fakeResponse = [NSMutableDictionary dictionary];
    
    [fakeResponse setObject:@YES forKey:@"isVip"];
    [fakeResponse setObject:@(4102358399.0) forKey:@"vipTime"];
    [fakeResponse setObject:@"2099-12-31" forKey:@"vipEnvaildTime"];
    [fakeResponse setObject:@"喜爱民谣破解 免费分享" forKey:@"uname"];
    [fakeResponse setObject:@(999999) forKey:@"vipOverDay"];
    [fakeResponse setObject:@(1) forKey:@"vipState"];
    [fakeResponse setObject:@(999999) forKey:@"limitbook"];
    [fakeResponse setObject:@(999999) forKey:@"limitcollect"];
    [fakeResponse setObject:@(999999) forKey:@"limitfocus"];
    [fakeResponse setObject:@(999999.0) forKey:@"coin"];
    [fakeResponse setObject:@(999999.0) forKey:@"cgold"];
    [fakeResponse setObject:@(999999) forKey:@"kmhCoins"];
    [fakeResponse setObject:@(999999) forKey:@"starCoin"];
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:fakeResponse options:0 error:&error];
    
    if (!error) {
        NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:url statusCode:200 HTTPVersion:@"HTTP/1.1" headerFields:@{@"Content-Type": @"application/json"}];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"VIPFakeResponseNotification" object:@{@"data": data, @"response": response, @"task": self}];
    }
}

@end

%hook NSURLSession

- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler {
    NSString *urlString = request.URL.absoluteString;
    
    if ([urlString containsString:@"user"] || 
        [urlString containsString:@"vip"] || 
        [urlString containsString:@"member"] ||
        [urlString containsString:@"profile"] ||
        [urlString containsString:@"info"]) {
        
        NSMutableDictionary *fakeResponse = [NSMutableDictionary dictionary];
        
        [fakeResponse setObject:@YES forKey:@"isVip"];
        [fakeResponse setObject:@(4102358399.0) forKey:@"vipTime"];
        [fakeResponse setObject:@"2099-12-31" forKey:@"vipEnvaildTime"];
        [fakeResponse setObject:@"喜爱民谣破解 免费分享" forKey:@"uname"];
        [fakeResponse setObject:@(999999) forKey:@"vipOverDay"];
        [fakeResponse setObject:@(1) forKey:@"vipState"];
        [fakeResponse setObject:@(999999) forKey:@"limitbook"];
        [fakeResponse setObject:@(999999) forKey:@"limitcollect"];
        [fakeResponse setObject:@(999999) forKey:@"limitfocus"];
        [fakeResponse setObject:@(999999.0) forKey:@"coin"];
        [fakeResponse setObject:@(999999.0) forKey:@"cgold"];
        [fakeResponse setObject:@(999999) forKey:@"kmhCoins"];
        [fakeResponse setObject:@(999999) forKey:@"starCoin"];
        
        NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:request.URL statusCode:200 HTTPVersion:@"HTTP/1.1" headerFields:@{@"Content-Type": @"application/json"}];
        NSData *data = [NSJSONSerialization dataWithJSONObject:fakeResponse options:0 error:nil];
        
        NSURLSessionDataTask *task = %orig(request, completionHandler);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completionHandler) {
                completionHandler(data, response, nil);
            }
        });
        
        return task;
    }
    
    return %orig;
}

%end

%hook NSURLConnection

+ (void)sendAsynchronousRequest:(NSURLRequest *)request queue:(NSOperationQueue *)queue completionHandler:(void (^)(NSURLResponse *response, NSData *data, NSError *error))handler {
    NSString *urlString = request.URL.absoluteString;
    
    if ([urlString containsString:@"user"] || 
        [urlString containsString:@"vip"] || 
        [urlString containsString:@"member"] ||
        [urlString containsString:@"profile"] ||
        [urlString containsString:@"info"]) {
        
        NSMutableDictionary *fakeResponse = [NSMutableDictionary dictionary];
        
        [fakeResponse setObject:@YES forKey:@"isVip"];
        [fakeResponse setObject:@(4102358399.0) forKey:@"vipTime"];
        [fakeResponse setObject:@"2099-12-31" forKey:@"vipEnvaildTime"];
        [fakeResponse setObject:@"喜爱民谣破解 免费分享" forKey:@"uname"];
        [fakeResponse setObject:@(999999) forKey:@"vipOverDay"];
        [fakeResponse setObject:@(1) forKey:@"vipState"];
        [fakeResponse setObject:@(999999) forKey:@"limitbook"];
        [fakeResponse setObject:@(999999) forKey:@"limitcollect"];
        [fakeResponse setObject:@(999999) forKey:@"limitfocus"];
        [fakeResponse setObject:@(999999.0) forKey:@"coin"];
        [fakeResponse setObject:@(999999.0) forKey:@"cgold"];
        [fakeResponse setObject:@(999999) forKey:@"kmhCoins"];
        [fakeResponse setObject:@(999999) forKey:@"starCoin"];
        
        NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:request.URL statusCode:200 HTTPVersion:@"HTTP/1.1" headerFields:@{@"Content-Type": @"application/json"}];
        NSData *data = [NSJSONSerialization dataWithJSONObject:fakeResponse options:0 error:nil];
        
        [queue addOperationWithBlock:^{
            if (handler) {
                handler(response, data, nil);
            }
        }];
        
        return;
    }
    
    %orig;
}

%end

%hook ZYMKUserInfoManager

+ (BOOL)isVip {
    return YES;
}

+ (BOOL)showVIPReadAlert:(id)a0 {
    return NO;
}

+ (BOOL)isNetworkNeedAddVipKey {
    return NO;
}

+ (BOOL)isCanUpLevel {
    return YES;
}

+ (void)saveInfo:(id)a0 {
    if ([a0 isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dict = [a0 mutableCopy];
        [dict setObject:@YES forKey:@"isVip"];
        [dict setObject:@(4102358399.0) forKey:@"vipTime"];
        [dict setObject:@"2099-12-31" forKey:@"vipEnvaildTime"];
        [dict setObject:@"喜爱民谣破解 免费分享" forKey:@"uname"];
        [dict setObject:@(999999) forKey:@"vipOverDay"];
        [dict setObject:@(1) forKey:@"vipState"];
        [dict setObject:@(999999) forKey:@"limitbook"];
        [dict setObject:@(999999) forKey:@"limitcollect"];
        [dict setObject:@(999999) forKey:@"limitfocus"];
        [dict setObject:@(999999.0) forKey:@"coin"];
        [dict setObject:@(999999.0) forKey:@"cgold"];
        %orig(dict);
        return;
    }
    %orig;
}

+ (void)saveSimpleUInfo:(id)a0 {
    if ([a0 isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dict = [a0 mutableCopy];
        [dict setObject:@YES forKey:@"isVip"];
        [dict setObject:@(4102358399.0) forKey:@"vipTime"];
        [dict setObject:@"2099-12-31" forKey:@"vipEnvaildTime"];
        [dict setObject:@(1) forKey:@"vipState"];
        %orig(dict);
        return;
    }
    %orig;
}

+ (void)getUserInfoWithPlat:(id)a0 token:(id)a1 uid:(long long)a2 completion:(id)a3 {
    if (a3) {
        void (^block)(id) = a3;
        NSDictionary *fakeInfo = @{
            @"isVip": @YES,
            @"vipTime": @(4102358399.0),
            @"vipEnvaildTime": @"2099-12-31",
            @"uname": @"喜爱民谣破解 免费分享",
            @"vipOverDay": @(999999),
            @"vipState": @(1),
            @"limitbook": @(999999),
            @"limitcollect": @(999999),
            @"limitfocus": @(999999),
            @"coin": @(999999.0),
            @"cgold": @(999999.0),
            @"kmhCoins": @(999999),
            @"starCoin": @(999999)
        };
        block(fakeInfo);
        return;
    }
    %orig;
}

+ (void)getRealTimeUserData:(id /* block */)a0 {
    if (a0) {
        NSDictionary *fakeData = @{
            @"isVip": @YES,
            @"vipTime": @(4102358399.0),
            @"vipEnvaildTime": @"2099-12-31",
            @"uname": @"喜爱民谣破解 免费分享",
            @"vipOverDay": @(999999),
            @"vipState": @(1)
        };
        ((void (^)(id))a0)(fakeData);
        return;
    }
    %orig;
}

+ (id)getUserInfo {
    return @{
        @"isVip": @YES,
        @"vipTime": @(4102358399.0),
        @"vipEnvaildTime": @"2099-12-31",
        @"uname": @"喜爱民谣破解 免费分享",
        @"vipOverDay": @(999999),
        @"vipState": @(1),
        @"limitbook": @(999999),
        @"limitcollect": @(999999),
        @"limitfocus": @(999999),
        @"coin": @(999999.0),
        @"cgold": @(999999.0),
        @"kmhCoins": @(999999),
        @"starCoin": @(999999)
    };
}

+ (id)shareInstance {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = %orig;
    });
    return instance;
}

%end

%hook UserDataData

- (BOOL)isVip {
    return YES;
}

- (double)vipTime {
    return 4102358399.0;
}

- (NSString *)vipEnvaildTime {
    return @"2099-12-31";
}

- (NSString *)uname {
    return @"喜爱民谣破解 免费分享";
}

- (id)getUserName {
    return @"喜爱民谣破解 免费分享";
}

- (unsigned long long)vipState {
    return 1;
}

- (id)getVipDate {
    return @"2099-12-31";
}

- (long long)vipOverDay {
    return 999999;
}

- (long long)limitbook {
    return 999999;
}

- (long long)limitcollect {
    return 999999;
}

- (long long)limitfocus {
    return 999999;
}

- (double)coin {
    return 999999.0;
}

- (double)cgold {
    return 999999.0;
}

- (long long)kmhCoins {
    return 999999;
}

- (long long)starCoin {
    return 999999;
}

%end

%hook AccountUser

- (BOOL)isVip {
    return YES;
}

- (NSString *)Uname {
    return @"喜爱民谣破解 免费分享";
}

- (long long)overduecoin {
    return 999999;
}

%end

%hook ZYComicDetailInfo

- (BOOL)isVipFreeWithModel:(id)a0 {
    return YES;
}

- (BOOL)isVipFreeWithChapterID:(unsigned long long)a0 {
    return YES;
}

%end

%hook ComicReaderViewController

- (BOOL)isVipFree {
    return YES;
}

+ (id)showReaderVCWithNavc:(id)a0 ComicId:(double)a1 comicName:(id)a2 chapterId:(long long)a3 isVipFree:(BOOL)a4 readPage:(long long)a5 fromType:(unsigned long long)a6 ignoreFilterExtra:(BOOL)a7 {
    return %orig(a0, a1, a2, a3, YES, a5, a6, a7);
}

%end

%hook MineViewController

- (void)checkVIPExpiry {
    return;
}

- (void)showVipExpireHintAlertTitle:(id)a0 subTitle:(id)a1 {
    return;
}

%end

%hook MineHeaderView

- (void)config:(id)a0 {
    if ([a0 isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *mutableInfo = [(NSDictionary *)a0 mutableCopy];
        [mutableInfo setObject:@YES forKey:@"isVip"];
        [mutableInfo setObject:@(4102358399.0) forKey:@"vipTime"];
        [mutableInfo setObject:@"2099-12-31" forKey:@"vipEnvaildTime"];
        [mutableInfo setObject:@"喜爱民谣破解 免费分享" forKey:@"uname"];
        [mutableInfo setObject:@(999999) forKey:@"vipOverDay"];
        [mutableInfo setObject:@(1) forKey:@"vipState"];
        %orig(mutableInfo);
        return;
    }
    %orig;
}

%end

%hook KMVipDeadAlertView

- (void)show {
    return;
}

%end

%hook KMVipInvaildAlertView

- (void)show {
    return;
}

%end

%hook VipSubscribePopView

- (void)show {
    return;
}

%end

%hook NSObject

- (id)valueForKey:(id)a0 {
    id result = %orig;
    if ([a0 isEqualToString:@"isVip"] || [a0 isEqualToString:@"isvip"]) {
        return @YES;
    }
    if ([a0 isEqualToString:@"vipTime"] || [a0 isEqualToString:@"vip_time"]) {
        return @(4102358399.0);
    }
    if ([a0 isEqualToString:@"vipEnvaildTime"] || [a0 isEqualToString:@"vipEnvaild_time"]) {
        return @"2099-12-31";
    }
    if ([a0 isEqualToString:@"vipState"] || [a0 isEqualToString:@"vip_state"]) {
        return @(1);
    }
    if ([a0 isEqualToString:@"vipOverDay"] || [a0 isEqualToString:@"vip_over_day"]) {
        return @(999999);
    }
    if ([a0 isEqualToString:@"uname"] || [a0 isEqualToString:@"username"]) {
        return @"喜爱民谣破解 免费分享";
    }
    return result;
}

%end

%ctor {
}
