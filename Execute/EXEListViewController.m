//
//  EXEListViewController.m
//  Execute
//
//  Created by Charles Peach on 22/02/14.
//  Copyright (c) 2014 cub3y. All rights reserved.
//

#import "EXEListViewController.h"

@interface EXEListViewController ()

@end

@implementation EXEListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Execute";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = @"Say Hi!";
    return cell;
}
@end
