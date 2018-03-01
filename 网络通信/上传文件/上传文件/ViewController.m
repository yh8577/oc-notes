//
//  ViewController.m
//  上传文件
//
//  Created by jyh on 2018/3/1.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1.jpg" ofType:nil];

    [self uploadFile:@"http://127.0.0.1/upload/upload.php" fieldName:@"file" fieldPath:path];

}

//{"userfile":{"name":["3.jpg","","","",""],"type":["image\/jpeg","","","",""],"size":[184453,0,0,0,0],"tmp_name":["\/private\/var\/tmp\/phpOcI8dQ","","","",""],"error":null,"message":null}}

#define kBoundary @"FormBoundaryHv2i3sj780"

- (void)uploadFile:(NSString *)urlStr fieldName:(NSString *)fieldName fieldPath:(NSString *)fieldPath {
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15];
    
    request.HTTPMethod = @"post";
    
    //Content-Type:multipart/form-data; boundary=----WebKitFormBoundaryHv2i3sj7802sQSYg
    [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@",kBoundary] forHTTPHeaderField:@"Content-Type"];
    
    request.HTTPBody = [self makeBody:fieldName fieldPath:fieldPath];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return ;
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200 && httpResponse.statusCode != 304) {
            return;
        }
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        [dict[@"userfile"] enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"%@ : %@",key, obj);
        }];
        
        NSLog(@"加载数据");
        
    }] resume];
}

- (NSData *)makeBody:(NSString *)fieldName fieldPath:(NSString *)fieldPath {
    
    /*
     ------WebKitFormBoundaryHv2i3sj7802sQSYg
     Content-Disposition: form-data; name="file"; filename="9.jpg"
     Content-Type: image/jpeg
     .. 空行..
     ..文件二进制数据..
     ------WebKitFormBoundaryHv2i3sj7802sQSYg--
     */
    NSMutableData *dataM = [NSMutableData data];
    NSMutableString *strM = [NSMutableString string];

    [strM appendFormat:@"--%@\r\n",kBoundary];
    [strM appendFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",fieldName,[fieldPath lastPathComponent]];
    
    [strM appendString:@"Content-Type: application/octet-stream\r\n"];
    [strM appendString:@"\r\n"];
    

    [dataM appendData:[strM dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSData *data = [NSData dataWithContentsOfFile:fieldPath];
    [dataM appendData:data];
    
    NSString *endStr = [NSString stringWithFormat:@"\r\n--%@--",kBoundary];
    [dataM appendData:[endStr dataUsingEncoding:NSUTF8StringEncoding]];
    return dataM.copy;
}

@end















