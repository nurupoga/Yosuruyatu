//
//  ViewController.m
//  Yo
//
//  Created by ohta tomotaka on 2014/06/23.
//  Copyright (c) 2014年 ohta tomotaka. All rights reserved.
//

#import "ViewController.h"
#import "FHSTwitterEngine/FHSTwitterEngine.h"
@interface ViewController (){
    NSArray *member;
}
@end
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[FHSTwitterEngine sharedEngine]showOAuthLoginControllerFromViewController:self withCompletion:^(BOOL success) {
        if (success) {
            NSLog(@"L0L success");
        } else {
            NSLog(@"O noes!!! Logen falyur!!!");
        }
    }];
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    member = [[NSArray alloc] initWithObjects:@"NUMPAD0", @"KIR1CA", @"TEHU", @"AWO1", nil];
    return [member count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //セルのスタイルを標準のものに指定
    static NSString *CellIdentifier = @"list";
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    UILabel *name = (UILabel*)[cell viewWithTag:2];
    name.text=member[indexPath.row];
    //    cell.textLabel.text=member[indexPath.row];
    //    base.image=[UIImage imageNamed:@"base.jpg"];
    //    UIButton *button = (UIButton*)[cell viewWithTag:2];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d",indexPath.row);
}
@end
