//
//  SaveDataViewController.h
//  ToDoList
//
//  Created by Helmi Hasan on 9/18/14.
//  Copyright (c) 2014 Terato Tech. All rights reserved.
//

#import "ViewController.h"

@interface SaveDataViewController : ViewController
@property (nonatomic,weak) IBOutlet UITextField *nameField;
@property (nonatomic,weak) IBOutlet UITextView *descField;
@property (nonatomic,weak) IBOutlet UIDatePicker *dateField;
@property (nonatomic,weak) IBOutlet UIButton *deleteButton;
@property (nonatomic) int selectedIndex;
-(IBAction)saveButton:(id)sender;
-(IBAction)deleteButton:(id)sender;
@end
