#import <Foundation/Foundation.h>

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
        [dict setObject:@YES forKey:@"isvip"];
        [dict setObject:@(4102358399.0) forKey:@"vipTime"];
        [dict setObject:@"2099-12-31" forKey:@"vipValidTime"];
        [dict setObject:@"2099-12-31" forKey:@"vipEnvaildTime"];
        [dict setObject:@"喜爱民谣破解 免费分享" forKey:@"uname"];
        [dict setObject:@"喜爱民谣破解 免费分享" forKey:@"username"];
        [dict setObject:@(999999) forKey:@"vipOverDay"];
        [dict setObject:@(1) forKey:@"vipState"];
        [dict setObject:@(999999) forKey:@"limitbook"];
        [dict setObject:@(999999) forKey:@"limitcollect"];
        [dict setObject:@(999999) forKey:@"limitfocus"];
        [dict setObject:@(999999.0) forKey:@"coin"];
        [dict setObject:@(999999.0) forKey:@"cgold"];
        [dict setObject:@(999999) forKey:@"kmhCoins"];
        [dict setObject:@(999999) forKey:@"starCoin"];
        %orig(dict);
        return;
    }
    %orig;
}

+ (void)saveSimpleUInfo:(id)a0 {
    if ([a0 isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dict = [a0 mutableCopy];
        [dict setObject:@YES forKey:@"isVip"];
        [dict setObject:@YES forKey:@"isvip"];
        [dict setObject:@(4102358399.0) forKey:@"vipTime"];
        [dict setObject:@"2099-12-31" forKey:@"vipValidTime"];
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
            @"isvip": @YES,
            @"vipTime": @(4102358399.0),
            @"vipValidTime": @"2099-12-31",
            @"vipEnvaildTime": @"2099-12-31",
            @"uname": @"喜爱民谣破解 免费分享",
            @"username": @"喜爱民谣破解 免费分享",
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
            @"isvip": @YES,
            @"vipTime": @(4102358399.0),
            @"vipValidTime": @"2099-12-31",
            @"vipEnvaildTime": @"2099-12-31",
            @"uname": @"喜爱民谣破解 免费分享",
            @"username": @"喜爱民谣破解 免费分享",
            @"vipOverDay": @(999999),
            @"vipState": @(1)
        };
        ((void (^)(id))a0)(fakeData);
        return;
    }
    %orig;
}

+ (id)getUserInfo {
    id info = %orig;
    if ([info isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dict = [info mutableCopy];
        [dict setObject:@YES forKey:@"isVip"];
        [dict setObject:@YES forKey:@"isvip"];
        [dict setObject:@(4102358399.0) forKey:@"vipTime"];
        [dict setObject:@"2099-12-31" forKey:@"vipValidTime"];
        [dict setObject:@"2099-12-31" forKey:@"vipEnvaildTime"];
        [dict setObject:@"喜爱民谣破解 免费分享" forKey:@"uname"];
        [dict setObject:@"喜爱民谣破解 免费分享" forKey:@"username"];
        [dict setObject:@(999999) forKey:@"vipOverDay"];
        [dict setObject:@(1) forKey:@"vipState"];
        return dict;
    }
    return info;
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

- (NSString *)vipValidTime {
    return @"2099-12-31";
}

- (NSString *)vipEnvaildTime {
    return @"2099-12-31";
}

- (NSString *)uname {
    return @"喜爱民谣破解 免费分享";
}

- (NSString *)username {
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

- (void)setIsVip:(BOOL)isVip {
    _isVip = YES;
}

- (void)setVipTime:(double)vipTime {
    _vipTime = 4102358399.0;
}

- (void)setVipValidTime:(NSString *)vipValidTime {
    if (self->vipValidTime) [self->vipValidTime release];
    self->vipValidTime = [@"2099-12-31" copy];
}

- (void)setVipEnvaildTime:(NSString *)vipEnvaildTime {
    if (self->vipEnvaildTime) [self->vipEnvaildTime release];
    self->vipEnvaildTime = [@"2099-12-31" copy];
}

- (void)setUname:(NSString *)uname {
    if (self->uname) [self->uname release];
    self->uname = [@"喜爱民谣破解 免费分享" copy];
}

- (void)setUsername:(NSString *)username {
    if ([self respondsToSelector:@selector(username)]) {
        objc_setAssociatedObject(self, @selector(username), @"喜爱民谣破解 免费分享", OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}

%end

%hook AccountUser

- (BOOL)isVip {
    return YES;
}

- (NSString *)Uname {
    return @"喜爱民谣破解 免费分享";
}

- (NSString *)username {
    return @"喜爱民谣破解 免费分享";
}

- (long long)overduecoin {
    return 999999;
}

- (void)setIsVip:(BOOL)isVip {
    _isVip = YES;
}

- (void)setUname:(NSString *)uname {
    if (self->Uname) [self->Uname release];
    self->Uname = [@"喜爱民谣破解 免费分享" copy];
}

- (void)setUsername:(NSString *)username {
    if ([self respondsToSelector:@selector(username)]) {
        objc_setAssociatedObject(self, @selector(username), @"喜爱民谣破解 免费分享", OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
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
        [mutableInfo setObject:@YES forKey:@"isvip"];
        [mutableInfo setObject:@(4102358399.0) forKey:@"vipTime"];
        [mutableInfo setObject:@"2099-12-31" forKey:@"vipValidTime"];
        [mutableInfo setObject:@"2099-12-31" forKey:@"vipEnvaildTime"];
        [mutableInfo setObject:@"喜爱民谣破解 免费分享" forKey:@"uname"];
        [mutableInfo setObject:@"喜爱民谣破解 免费分享" forKey:@"username"];
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

%hook ComicBarrageModel

- (BOOL)isVip {
    return YES;
}

%end

%hook ComicBarrageSendModel

- (BOOL)isVip {
    return YES;
}

%end

%hook ForceModel

- (BOOL)isVip {
    return YES;
}

- (NSString *)uname {
    return @"喜爱民谣破解 免费分享";
}

- (NSString *)username {
    return @"喜爱民谣破解 免费分享";
}

%end

%hook MyDynamicModel

- (BOOL)isVip {
    return YES;
}

%end

%hook OtherDynamicResponse

- (BOOL)isVip {
    return YES;
}

- (NSString *)username {
    return @"喜爱民谣破解 免费分享";
}

- (NSString *)uname {
    return @"喜爱民谣破解 免费分享";
}

- (double)coins {
    return 999999.0;
}

%end

%hook ZYFensFocusList

- (BOOL)isVip {
    return YES;
}

%end

%hook ZYMessageUserInfoModel

- (BOOL)isVip {
    return YES;
}

%end

%hook SupportDetailModel

- (BOOL)isVip {
    return YES;
}

- (NSString *)uname {
    return @"喜爱民谣破解 免费分享";
}

- (NSString *)username {
    return @"喜爱民谣破解 免费分享";
}

%end

%hook BookHeader

- (BOOL)isVip {
    return YES;
}

%end

%hook ProductData

- (BOOL)isVipProduct {
    return YES;
}

%end

%hook ZYMKLiShiDetailVC

- (void)toReadWith:(id)a0 chapters:(id)a1 isVipFree:(BOOL)a2 {
    %orig(a0, a1, YES);
}

%end

%hook ComicReaderView

- (BOOL)isVipFree {
    return YES;
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
    if ([a0 isEqualToString:@"vipValidTime"] || [a0 isEqualToString:@"vip_valid_time"] || 
        [a0 isEqualToString:@"vipEnvaildTime"] || [a0 isEqualToString:@"vipEnvaild_time"]) {
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
