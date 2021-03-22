//
//  ViewController.m
//  Search
//
//  Created by admin on 22.03.2021.
//

#import "ViewController.h"
#import "ResultsTableViewController.h"

@interface ViewController () <UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) ResultsTableViewController *resultsViewController;

@property (nonatomic, copy) NSArray *monthOfYear;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Search";
//    self.view.backgroundColor = [UIColor greenColor];

    self.monthOfYear = @[@"Январь",
                         @"Февраль",
                         @"Март",
                         @"Апрель",
                         @"Май",
                         @"Июнь",
                         @"Июль",
                         @"Август",
                         @"Сентябрь",
                         @"Октябрь",
                         @"Ноябрь",
                         @"Декабрь"];
    
    self.resultsViewController = [ResultsTableViewController new];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsViewController];
    self.searchController.searchResultsUpdater = self;
    
    self.navigationItem.searchController = self.searchController;
    
    //    self.searchController = [ResultsTableViewController new];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.monthOfYear.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *id = @"id";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:id];
    }
    cell.textLabel.text = self.monthOfYear[indexPath.row];
    return cell;
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(nonnull UISearchController *)searchController {
    if (searchController.searchBar.text.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", searchController.searchBar.text];
        self.resultsViewController.results = [self.monthOfYear filteredArrayUsingPredicate:predicate];
        [self.resultsViewController update];
    }
}

@end
