//
//  ViewController.m
//  DOM 加载解析 XML
//
//  Created by jyh on 2018/2/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"
#import "Videos.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
        注意点, dom 只能 使用在 mac 上使用.
     */
    
    [self loadXml];
}


- (void)loadXml {
    
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/videos.xml"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:15];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            return ;
        }
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (httpResponse.statusCode != 200 && httpResponse.statusCode != 304) {
            return;
        }
        
        GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data error:nil];
        
        GDataXMLElement *element = doc.rootElement;
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:10];
        for (GDataXMLElement *supE in element.children) {
            
            Videos *v = [[Videos alloc] init];
            
            [arrM addObject:v];
            
            for (GDataXMLElement *subE in supE.children) {
                [v setValue:subE.stringValue forKey:subE.name];
            }
            
            for (GDataXMLNode *attr in supE.attributes) {
                [v setValue:attr.stringValue forKey:attr.name];
            }
            
        }
        
        NSLog(@"%@",arrM);
      
        
    }] resume];
}

@end
