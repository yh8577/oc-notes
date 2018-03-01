//
//  ViewController.m
//  加载 XML
//
//  Created by jyh on 2018/2/27.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "ViewController.h"
#import "Videos.h"
@interface ViewController ()<NSXMLParserDelegate>
@property(nonatomic,strong)NSMutableArray *videos;
@property(nonatomic,strong)Videos *currentVideo;
@property(nonatomic,copy)NSMutableString *stringM;
@end

@implementation ViewController

- (NSMutableString *)stringM {
    if (!_stringM) {
        _stringM = [NSMutableString string];
    }
    return _stringM;
}

- (NSMutableArray *)videos {
    if (!_videos) {
        _videos = [NSMutableArray arrayWithCapacity:10];
    }
    return _videos;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadXml];

}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    //NSLog(@"开始    = %@",parser);
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict {
    if ( [elementName isEqualToString:@"video"]) {
        self.currentVideo = [[Videos alloc] init];
        self.currentVideo.videoId = @([attributeDict[@"videoId"] intValue]);
        [self.videos addObject:self.currentVideo];
    }
    
    
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {

    [self.stringM appendString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName {
  
    if (![elementName isEqualToString:@"video"] && ![elementName isEqualToString:@"videos"]) {
        [self.currentVideo setValue:self.stringM forKey:elementName];
    }

    [self.stringM setString:@""];
}


- (void)parserDidEndDocument:(NSXMLParser *)parser {
    //NSLog(@"结束 = %@",parser);
    NSLog(@"%@",self.videos);
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    //NSLog(@"parseError = %@, %@",parser, parseError);
    
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
        NSXMLParser *xml = [[NSXMLParser alloc] initWithData:data];
        xml.delegate  =  self;
        [xml parse];;
        
    }] resume];
}


@end
