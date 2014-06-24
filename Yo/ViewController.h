//
//  ViewController.h
//  Yo
//
//  Created by ohta tomotaka on 2014/06/23.
//  Copyright (c) 2014年 ohta tomotaka. All rights reserved.
//
#define kCONSUMER_KEY @"zhYrTjnp7IQAcBGTN6r50OWZR"
#define kCONSUMER_SEC @"VPblHDqGjFd5L0ahPWnQNRiYhed5eOjzKleYkKPgRUPX26L3gg"
#define kOAUTH_TOK    @"67198004-PmjFRCMdd4yG2yrqoOK1w9uCFCYY5wkPTdgV4snS4"
#define kOAUTH_SEC    @"PDIDalPck0nBO82cmSL8nXyC1T4EJkiagcVfXjVpz06h4"
#import <UIKit/UIKit.h>
@interface ViewController : UIViewController{
    IBOutlet UITableView *table;
    NSMutableArray *postsArray;
}
- (IBAction)OAuth:(id)sender;
@end
