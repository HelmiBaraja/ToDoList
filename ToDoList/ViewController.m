//
//  ViewController.m
//  ToDoList
//
//  Created by Helmi Hasan on 9/18/14.
//  Copyright (c) 2014 Terato Tech. All rights reserved.
//

#import "ViewController.h"
#import "MTodo.h"
#import "SaveDataViewController.h"
@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *todoArray;
@end

@implementation ViewController
static NSString *todoFilename = @"todo";
- (void)viewDidLoad
{
    //this is comment.
    //this is comment2.
    NSLog(@"MOBILE APPLICATION DEVELOPMENT WORKSHOP (19 SEPT 2014)");
    NSLog(@"HELMI BARAJA SO HANDSOME TODAY :P");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.todoArray= [self loadCustomObjectWithKey:todoFilename];
    [self.myTableView reloadData];
    [super viewWillAppear:animated];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.todoArray count];    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier];
    }
    
    cell.textLabel.text = ((MTodo*)[self.todoArray objectAtIndex:indexPath.row]).name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SaveDataViewController *save = [self.storyboard instantiateViewControllerWithIdentifier:@"savedata"];
    save.selectedIndex = indexPath.row;
    [self.navigationController pushViewController:save animated:YES];
    
    
}

- (NSMutableArray *)loadCustomObjectWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    NSMutableArray *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}

-(IBAction)addTask:(id)sender
{
    SaveDataViewController *save = [self.storyboard instantiateViewControllerWithIdentifier:@"savedata"];
    save.selectedIndex = -1;
    [self.navigationController pushViewController:save animated:YES];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
