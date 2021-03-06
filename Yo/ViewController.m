//
//  ViewController.m
//  Yo
//
//  Created by ohta tomotaka on 2014/06/23.
//  Copyright (c) 2014年 ohta tomotaka. All rights reserved.
//

#import "ViewController.h"
#import "FHSTwitterEngine.h"
@interface ViewController (){
    NSMutableArray *member;
}
@end
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //    [[FHSTwitterEngine sharedEngine]permanentlySetConsumerKey:@"Xg3ACDprWAH8loEPjMzRg" andSecret:@"9LwYDxw1iTc6D9ebHdrYCZrJP4lJhQv5uf4ueiPHvJ0"];
    //するやつーーーー
    [[FHSTwitterEngine sharedEngine]permanentlySetConsumerKey:@"zhYrTjnp7IQAcBGTN6r50OWZR" andSecret:@"VPblHDqGjFd5L0ahPWnQNRiYhed5eOjzKleYkKPgRUPX26L3gg"];
    [[FHSTwitterEngine sharedEngine]setDelegate:self];
    [[FHSTwitterEngine sharedEngine]loadAccessToken];
    member = [[NSMutableArray alloc] initWithObjects:@"@numpad0", @"@nurupoga", nil];
    [member addObject:@"➕"];
    
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (void)viewDidAppear:(BOOL)animated
{
}
- (void)loginOAuth {
    UIViewController *loginController = [[FHSTwitterEngine sharedEngine]loginControllerWithCompletionHandler:^(BOOL success) {
        NSLog(success?@"L0L success":@"O noes!!! Loggen faylur!!!");
    }];
    [self presentViewController:loginController animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
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
    if ([member count]==indexPath.row+1) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Hello!" message:@"Please enter your friend name:" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        UITextField * alertTextField = [alert textFieldAtIndex:0];
        //alertTextField.keyboardType = UIKeyboardTypeNumberPad;
        alertTextField.placeholder = @"@nurupoga";
        [alert show];
    }else{
        NSLog(@"post");
        NSString *yomessage=[NSString stringWithFormat:@"%@ Yo!!!",member[indexPath.row]];
        [[FHSTwitterEngine sharedEngine] postTweet:yomessage];
        NSLog(@"%d",indexPath.row);
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
    [member removeObject:@"➕"];
    [member addObject:[[alertView textFieldAtIndex:0] text]];
    [member addObject:@"➕"];
    [table reloadData];
}
- (IBAction)OAuth:(id)sender {
    [self loginOAuth];
}
@end
