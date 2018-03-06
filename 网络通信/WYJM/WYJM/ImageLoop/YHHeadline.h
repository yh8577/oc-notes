//
//Created by ESJsonFormatForMac on 18/03/05.
//

#import <Foundation/Foundation.h>

@interface YHHeadline : NSObject

@property (nonatomic, copy) NSString *imgsrc;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *tag;


+ (instancetype)headlineWithDic:(NSDictionary *)dic;
+ (void)headlinesWithSuccess:(void(^)(NSArray *))Success error:(void(^)(void))error;
@end

