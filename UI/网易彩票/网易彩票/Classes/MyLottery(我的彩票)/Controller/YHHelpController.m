//
//  YHHelpController.m
//  网易彩票
//
//  Created by jyh on 2018/2/21.
//  Copyright © 2018年 jyh. All rights reserved.
//

#import "YHHelpController.h"
#import "YHNavigationController.h"
#import "YHHelp.h"
#import "YHHelpWebController.h"
@interface YHHelpController ()
@property(nonatomic,strong)NSArray *helps;
@end

@implementation YHHelpController

- (NSArray *)helps {
    if (!_helps) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"help" ofType:@"json"];
        
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            YHHelp *model= [YHHelp helpWithDict:dict];
            [arrM addObject:model];
        }
        _helps = arrM;
    }
    return _helps;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"常见问题";

    
}
- (void)colseClcik {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YHHelp *model = self.helps[indexPath.row];
    YHHelpWebController *web = [[YHHelpWebController alloc] init];
    YHNavigationController *nav = [[YHNavigationController alloc] initWithRootViewController:web];
    
    
    UIBarButtonItem *close = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemCancel) target:self action:@selector(colseClcik)];
    web.navigationItem.leftBarButtonItem = close;
    web.navigationItem.title = model.title;
    
    web.model = model;
    
    
    [self presentViewController:nav animated:YES completion:nil];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.helps.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *helpID = @"helpID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:helpID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:helpID];
    }
    
    YHHelp *model = self.helps[indexPath.row];
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    cell.textLabel.text = model.title;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
