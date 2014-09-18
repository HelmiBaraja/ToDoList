//
//  ViewController.h
//  ToDoList
//
//  Created by Helmi Hasan on 9/18/14.
//  Copyright (c) 2014 Terato Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic,weak) IBOutlet UITableView *myTableView;
-(IBAction)addTask:(id)sender;
@end
