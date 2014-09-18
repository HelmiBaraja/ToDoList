//
//  SaveDataViewController.m
//  ToDoList
//
//  Created by Helmi Hasan on 9/18/14.
//  Copyright (c) 2014 Terato Tech. All rights reserved.
//

#import "SaveDataViewController.h"
#import "MTodo.h"
@interface SaveDataViewController ()

@end

@implementation SaveDataViewController
static NSString *todoFilename = @"todo";
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    if (self.selectedIndex>=0)
    {
        //meaning this in EDIT mode
        NSMutableArray *todoArray= [self loadCustomObjectWithKey:todoFilename];
        
        MTodo *todo = [todoArray objectAtIndex:self.selectedIndex];
        
        NSLog(@"Editing task = %@",todo.name);

        self.nameField.text = todo.name;
        self.descField.text = todo.desc;
        self.dateField.date = todo.date;
        
        [self.deleteButton setHidden:NO];
    }
    else{
        // ADD mode
        [self.deleteButton setHidden:YES];
 
    }

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)saveButton:(id)sender
{
    MTodo *todo = [MTodo new];
    
    todo.name = self.nameField.text;
    todo.desc = self.descField.text;
    todo.date = self.dateField.date;
    
    NSMutableArray *todoArray= [self loadCustomObjectWithKey:todoFilename];
    
    if (todoArray ==nil)
        todoArray = [[NSMutableArray alloc] init];
    
    if (self.selectedIndex>=0)
    {
        //in EDIT Mode
        [todoArray replaceObjectAtIndex:self.selectedIndex withObject:todo];
    }
    else{
        //in ADD mode
        [todoArray addObject:todo];
    }
    
    [self saveCustomObject:todoArray key:todoFilename];
    
    NSLog(@"Succesfully saved");

    //Go to previous page
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)deleteButton:(id)sender
{
    NSLog(@"Succesfully deleted");
    
    NSMutableArray *todoArray= [self loadCustomObjectWithKey:todoFilename];

    [todoArray removeObjectAtIndex:self.selectedIndex];
    
    [self saveCustomObject:todoArray key:todoFilename];
    
    //Go to previous page
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveCustomObject:(NSMutableArray *)array key:(NSString *)key {

    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:array];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:key];
    [defaults synchronize];
    
}

- (NSMutableArray *)loadCustomObjectWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    NSMutableArray *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
