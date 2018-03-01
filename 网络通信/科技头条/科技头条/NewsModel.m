//
//  NewsModel.m
//  科技头条
//
//  Created by jyh on 2018/2/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "NewsModel.h"

@interface NewsModel ()

@end

@implementation NewsModel

- (NSString *)time {
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.addtime.intValue];
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents *components = [calender components:(NSCalendarUnitMinute) fromDate:date toDate:[NSDate date] options:0];
    if (components.minute < 60) {
        return [NSString stringWithFormat:@"%zd分钟以前",components.minute];
    }
    
    components = [calender components:(NSCalendarUnitHour) fromDate:date toDate:[NSDate date] options:0];
    if (components.hour < 24) {
        return [NSString stringWithFormat:@"%zd小时以前",components.hour];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM-dd HH:mm";
    return [formatter stringFromDate:date];

}

+ (void)loadNewsWithSuccess:(void(^)(NSArray*))success erroe:(void(^)(void))error {
    
    
    NSURL *url = [NSURL URLWithString:@"http://news.coolban.com/Api/Index/news_list/app/2/cat/0/limit/20/time/1519355163/type/0?channel=appstore&uuid=79014CD9-5BC4-4CA2-AA6D-FE004D37C12F&net=5&model=iPhone&ver=1.0.5"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable netError) {
        if (netError) {
            NSLog(@"%@",netError);
            if (error) {
                error();
            }
            return ;
        }
        
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:20];
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NewsModel *model = [NewsModel newsModelWithDict:obj];
            [arrM addObject:model];
        }];
        
        if (success) {
            success(arrM.copy);
        }
        
    }] resume];
    
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)newsModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    // 字典属性和获取的 key 不一致.会报错
}

- (NSString *)description {
    
    /*
     @property(nonatomic,copy)NSString *title;
     @property(nonatomic,copy)NSString *summary;
     @property(nonatomic,copy)NSString *img;
     @property(nonatomic,copy)NSString *sitename;
     @property(nonatomic,strong)NSNumber *addtime;
     
     @property(nonatomic,strong)NSNumber *ids; //id
     @property(nonatomic,strong)NSNumber *type_id;
     @property(nonatomic,copy)NSString *src_img;
     @property(nonatomic,assign)BOOL use_thumb;
     */
    
    return [NSString stringWithFormat:@"%@, { title: %@, summary: %@, img: %@, sitename: %@, addtime: %d, ids: %d, type_id: %d, src_img: %@, use_thumb: %d}", [super description], self.title, self.summary, self.img, self.sitename, self.addtime.intValue, self.ids.intValue, self.type_id.intValue, self.src_img, self.use_thumb];
}

@end
