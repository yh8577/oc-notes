//
//  NewsModel.h
//  科技头条
//
//  Created by jyh on 2018/2/26.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *summary;
@property(nonatomic,copy)NSString *img;
@property(nonatomic,copy)NSString *sitename;
@property(nonatomic,strong)NSNumber *addtime;
@property(nonatomic,copy,readonly)NSString *time;

@property(nonatomic,strong)NSNumber *ids; //id
@property(nonatomic,strong)NSNumber *type_id;
@property(nonatomic,copy)NSString *src_img;
@property(nonatomic,assign)BOOL use_thumb;

-  (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)newsModelWithDict:(NSDictionary *)dict;
+ (void)loadNewsWithSuccess:(void(^)(NSArray*))success erroe:(void(^)(void))error;
@end
