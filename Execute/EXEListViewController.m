//
//  EXEListViewController.m
//  Execute
//
//  Created by Charles Peach on 22/02/14.
//  Copyright (c) 2014 cub3y. All rights reserved.
//

#import "EXEListViewController.h"

@interface EXEListViewController () <UITextFieldDelegate>

@property (nonatomic) NSMutableArray *tasks;

@end

@implementation EXEListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 280.0f, 32.0f)];
    textField.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    textField.returnKeyType = UIReturnKeyGo;
    textField.placeholder = @"What do you want to execute?";
    textField.delegate = self;
    self.navigationItem.titleView = textField;
    
    NSArray *loadedTasks = [[NSUserDefaults standardUserDefaults] arrayForKey:@"tasks"];
    self.tasks = [[NSMutableArray alloc] initWithArray:loadedTasks];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tasks count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.tasks[indexPath.row];
    
    return cell;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField.text isEqual: @""]) {
        return NO;
    } else {
        [self.tasks insertObject:textField.text atIndex:0];
        
        [self.tableView beginUpdates];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
        [self.tableView endUpdates];
    
        textField.text = nil;
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:self.tasks forKey:@"tasks"];
        [userDefaults synchronize];
    
        return NO;
    }
}

@end
