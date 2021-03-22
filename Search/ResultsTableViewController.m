//
//  ResultsTableViewController.m
//  Search
//
//  Created by admin on 22.03.2021.
//

#import "ResultsTableViewController.h"

@interface ResultsTableViewController ()

@end

@implementation ResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Public
- (void) update {
    [self.tableView reloadData];
    
};

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *id = @"id";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:id];
    }
    cell.textLabel.text = self.results[indexPath.row];
    return cell;
}

@end
