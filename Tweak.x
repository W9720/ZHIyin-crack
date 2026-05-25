#import <Foundation/Foundation.h>

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

%end

%hook ZYComicDetailInfo

- (BOOL)isVipFreeWithModel:(id)a0 {
    return YES;
}

- (BOOL)isVipFreeWithChapterID:(unsigned long long)a0 {
    return YES;
}

%end

%hook ComicReaderView

- (BOOL)isVipFree {
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

%hook ProductData

- (BOOL)isVipProduct {
    return YES;
}

%end

%hook BookHeader

- (BOOL)isVip {
    return YES;
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

%hook ZYMKLiShiDetailVC

- (void)toReadWith:(id)a0 chapters:(id)a1 isVipFree:(BOOL)a2 {
    %orig(a0, a1, YES);
}

%end

%hook SupportDetailModel

- (BOOL)isVip {
    return YES;
}

- (NSString *)uname {
    return @"喜爱民谣破解 免费分享";
}

%end
