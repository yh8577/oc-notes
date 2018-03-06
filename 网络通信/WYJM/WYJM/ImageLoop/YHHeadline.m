//
//Created by ESJsonFormatForMac on 18/03/05.
//

#import "YHHeadline.h"
#import "YHNeteorkTools.h"

@implementation YHHeadline

+ (instancetype)headlineWithDic:(NSDictionary *)dic {
    YHHeadline *headline = [self new];
    [headline setValuesForKeysWithDictionary:dic];
    return headline;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}
    
+ (void)headlinesWithSuccess:(void(^)(NSArray *))Success error:(void(^)(void))error {
    
    [[YHNeteorkTools sharedManager] GET:@"ad/headline/0-4.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
         //获取字典的第一个键responseObject.keyEnumerator.nextObject
        NSString *rootKey = responseObject.keyEnumerator.nextObject;
        NSArray *arr = responseObject[rootKey];

        // 字典转模型
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:4];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            YHHeadline *headline = [YHHeadline headlineWithDic:obj];
            [arrM addObject:headline];
        }];
        if (Success) {
            Success(arrM.copy);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull errors) {
        if (error) {
            error();
        }
    }];
}
    
    

@end


