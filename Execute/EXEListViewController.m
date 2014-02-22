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
    
    self.tasks = [[NSMutableArray alloc] init];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tasks count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.tasks[indexPath.row];
    return cell;
}

@end
