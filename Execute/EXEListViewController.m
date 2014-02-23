//
//  EXEListViewController.m
//  Execute
//
//  Created by Charles Peach on 22/02/14.
//  Copyright (c) 2014 cub3y. All rights reserved.
//

#import "EXEListViewController.h"
#import "EXETaskTableViewCell.h"
#import "EXEEditViewController.h"

@interface EXEListViewController () <UITextFieldDelegate>

@property (nonatomic) NSMutableArray *tasks;
@property (nonatomic) NSMutableArray *completedTasks;

@end

@implementation EXEListViewController


#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[EXETaskTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 260.0f, 32.0f)];
    textField.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    textField.returnKeyType = UIReturnKeyGo;
    textField.placeholder = @"What do you want to execute?";
    textField.delegate = self;
    self.navigationItem.titleView = textField;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"✏️" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEdit:)];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *loadedTasks = [userDefaults arrayForKey:@"tasks"];
    self.tasks = [[NSMutableArray alloc] initWithArray:loadedTasks];
    
    loadedTasks = [userDefaults arrayForKey:@"completedTasks"];
    self.completedTasks = [[NSMutableArray alloc] initWithArray:loadedTasks];
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    
    if (editing) {
        self.navigationItem.rightBarButtonItem.title = @"👍";
    } else {
        self.navigationItem.rightBarButtonItem.title = @"✏️";
    }
}


#pragma mark - Actions

- (void)toggleEdit:(id)sender {
    [self setEditing:!self.editing animated:YES];
}


- (void)editTask:(UITapGestureRecognizer *)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)sender.view];
    NSLog(@"task: %@", [self arrayForSection:indexPath.section][indexPath.row]);
    
    EXEEditViewController *viewController = [[EXEEditViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}


#pragma mark - Private

- (void)save {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.tasks forKey:@"tasks"];
    [userDefaults setObject:self.completedTasks forKey:@"completedTasks"];
    [userDefaults synchronize];
}


- (NSMutableArray *)arrayForSection:(NSInteger)section {
    if (section == 0) {
        return self.tasks;
    }
    
    return self.completedTasks;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self arrayForSection:section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EXETaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.editGestureRecognizer addTarget:self action:@selector(editTask:)];
    
    cell.task = [self arrayForSection:indexPath.section][indexPath.row];
    cell.completed = indexPath.section == 1;

    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [[self arrayForSection:indexPath.section] removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
    [self save];
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSMutableArray *array = [self arrayForSection:fromIndexPath.section];
    
    NSString *task = array[fromIndexPath.row];
    [array removeObjectAtIndex:fromIndexPath.row];
    [array insertObject:task atIndex:toIndexPath.row];

    [tableView moveRowAtIndexPath:fromIndexPath toIndexPath:toIndexPath];

    [self save];
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section == 0;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [tableView beginUpdates];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
    // Tapped an uncompleted task. Lets complete it.
    if (indexPath.section == 0) {
        
        NSString *task = self.tasks[indexPath.row];
        [self.tasks removeObjectAtIndex:indexPath.row];
        [self.completedTasks insertObject:task atIndex:0];
        
        [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:1]] withRowAnimation:UITableViewRowAnimationTop];
    }
    
    // Tapped a completed task. Lets uncomplete it.
    else {
        NSString *task = self.completedTasks[indexPath.row];
        [self.completedTasks removeObjectAtIndex:indexPath.row];
        [self.tasks insertObject:task atIndex:0];
        

        [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
    }
    
    [tableView endUpdates];
    
    [self save];
}


#pragma mark - UITextFeildDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSString *text = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (text.length == 0) {
        textField.text = nil;
        [textField resignFirstResponder];
        return NO;
    }
    
    [self.tasks insertObject:text atIndex:0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];

    textField.text = nil;
    
    [self save];
    return NO;
}

@end
