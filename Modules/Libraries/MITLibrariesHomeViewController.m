#import "MITLibrariesHomeViewController.h"
#import "MITLibrariesWebservices.h"
#import "MITLibrariesLink.h"
#import "UIKit+MITAdditions.h"
#import "UIKit+MITLibraries.h"

static NSInteger const kMITLibrariesHomeViewControllerNumberOfSections = 2;

static NSInteger const kMITLibrariesHomeViewControllerMainSection = 0;
static NSInteger const kMITLibrariesHomeViewControllerLinksSection = 1;

static NSInteger const kMITLibrariesHomeViewControllerMainSectionCount = 4;
static NSInteger const kMITLibrariesHomeViewControllerMainSectionYourAccountRow = 0;
static NSInteger const kMITLibrariesHomeViewControllerMainSectionLocationHoursRow = 1;
static NSInteger const kMITLibrariesHomeViewControllerMainSectionAskUsRow = 2;
static NSInteger const kMITLibrariesHomeViewControllerMainSectionTellUsRow = 3;

typedef NS_ENUM(NSInteger, MITLibrariesHomeViewControllerLinksStatus) {
    MITLibrariesHomeViewControllerLinksStatusLoaded,
    MITLibrariesHomeViewControllerLinksStatusLoading,
    MITLibrariesHomeViewControllerLinksStatusFailed
};

static NSString * const kMITLibrariesHomeViewControllerDefaultCellIdentifier = @"kMITLibrariesHomeViewControllerDefaultCellIdentifier";

@interface MITLibrariesHomeViewController () <UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate>

@property (nonatomic, strong) NSArray *links;
@property (nonatomic, assign) MITLibrariesHomeViewControllerLinksStatus linksStatus;

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation MITLibrariesHomeViewController


#pragma mark - Init/Setup

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Libraries";
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.opaque = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor librariesNavBarTintColor];
    self.edgesForExtendedLayout = UIRectEdgeLeft | UIRectEdgeBottom | UIRectEdgeRight;
    
    [self registerCells];

    self.linksStatus = MITLibrariesHomeViewControllerLinksStatusLoading;
    [MITLibrariesWebservices getLinksWithCompletion:^(NSArray *links, NSError *error) {
        if (links) {
            self.links = links;
            self.linksStatus = MITLibrariesHomeViewControllerLinksStatusLoaded;
            [self.tableView reloadData];
            NSLog(@"links: %@", links);
        }
        else {
            self.links = nil;
            self.linksStatus = MITLibrariesHomeViewControllerLinksStatusFailed;
            [self.tableView reloadData];
        }
    }];
    
    [MITLibrariesWebservices getLibrariesWithCompletion:^(NSArray *libraries, NSError *error) {
        
    }];
    
    [MITLibrariesWebservices getResultsForSearch:@"bananas" startingIndex:0 completion:^(NSArray *items, NSInteger nextIndex, NSInteger totalResults, NSError *error) {
        if (items.count > 0) {
            [MITLibrariesWebservices getItemDetailsForItem:items[0] completion:^(MITLibrariesItem *item, NSError *error) {
                
            }];
        }
    }];
}

- (void)registerCells
{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kMITLibrariesHomeViewControllerDefaultCellIdentifier];
}

#pragma mark - TableView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return kMITLibrariesHomeViewControllerNumberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case kMITLibrariesHomeViewControllerMainSection: {
            return kMITLibrariesHomeViewControllerMainSectionCount;
            break;
        }
        case kMITLibrariesHomeViewControllerLinksSection: {
            if (self.linksStatus == MITLibrariesHomeViewControllerLinksStatusLoaded) {
                return self.links.count;
            } else {
                return 1;
            }
            break;
        }
        default: {
            return 0;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case kMITLibrariesHomeViewControllerMainSection: {
            return [self cellForMainSectionAtRow:indexPath.row];
            break;
        }
        case kMITLibrariesHomeViewControllerLinksSection: {
            return [self cellForLinksSectionAtRow:indexPath.row];
            break;
        }
        default: {
            return [UITableViewCell new];
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.section) {
        case kMITLibrariesHomeViewControllerMainSection: {
            [self mainSectionCellSelectedAtRow:indexPath.row];
            break;
        }
        case kMITLibrariesHomeViewControllerLinksSection: {
            [self linksSectionCellSelectedAtRow:indexPath.row];
            break;
        }
    }
}

#pragma mark - Custom Cell Creation

- (UITableViewCell *)cellForMainSectionAtRow:(NSInteger)row
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kMITLibrariesHomeViewControllerDefaultCellIdentifier];
    
    switch (row) {
        case kMITLibrariesHomeViewControllerMainSectionYourAccountRow: {
            cell.textLabel.text = @"Your Account";
            cell.accessoryView = [UIImageView accessoryViewWithMITType:MITAccessoryViewSecure];
            break;
        }
        case kMITLibrariesHomeViewControllerMainSectionLocationHoursRow: {
            cell.textLabel.text = @"Locations & Hours";
            cell.accessoryView = nil;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        }
        case kMITLibrariesHomeViewControllerMainSectionAskUsRow: {
            cell.textLabel.text = @"Ask Us!";
            cell.accessoryView = nil;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        }
        case kMITLibrariesHomeViewControllerMainSectionTellUsRow: {
            cell.textLabel.text = @"Tell Us!";
            cell.accessoryView = [UIImageView accessoryViewWithMITType:MITAccessoryViewSecure];
            break;
        }
        default: {
            cell.textLabel.text = nil;
            cell.accessoryType = nil;
            cell.accessoryView = nil;
        }
    }
    
    return cell;
}

- (UITableViewCell *)cellForLinksSectionAtRow:(NSInteger)row
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kMITLibrariesHomeViewControllerDefaultCellIdentifier];
    
    switch (self.linksStatus) {
        case MITLibrariesHomeViewControllerLinksStatusLoaded: {
            if (row < self.links.count) {
                MITLibrariesLink *link = self.links[row];
                cell.textLabel.text = link.title;
                cell.accessoryView = [UIImageView accessoryViewWithMITType:MITAccessoryViewExternal];
            } else {
                cell.textLabel.text = nil;
                cell.accessoryView = nil;
            }
            break;
        }
        case MITLibrariesHomeViewControllerLinksStatusLoading: {
            cell.textLabel.text = @"Loading...";
            cell.accessoryView = nil;
            break;
        }
        case MITLibrariesHomeViewControllerLinksStatusFailed: {
            cell.textLabel.text = @"Could not load links.";
            cell.accessoryView = nil;
            break;
        }
    }
    
    return cell;
}

#pragma mark - Custom Cell Selection Handling

- (void)mainSectionCellSelectedAtRow:(NSInteger)row
{
    switch (row) {
        case kMITLibrariesHomeViewControllerMainSectionYourAccountRow: {
            // TODO: Go to "My Account" VC
            break;
        }
        case kMITLibrariesHomeViewControllerMainSectionLocationHoursRow: {
            // TODO: Go to "Locations & Hours" VC
            break;
        }
        case kMITLibrariesHomeViewControllerMainSectionAskUsRow: {
            // TODO: Go to "Ask Us" VC
            break;
        }
        case kMITLibrariesHomeViewControllerMainSectionTellUsRow: {
            // TODO: Go to "Tell Us" VC
            break;
        }
    }
}

- (void)linksSectionCellSelectedAtRow:(NSInteger)row
{
    if (self.linksStatus == MITLibrariesHomeViewControllerLinksStatusLoaded && row < self.links.count) {
        MITLibrariesLink *link = self.links[row];
        NSURL *linkURL = [NSURL URLWithString:link.url];
        
        if ([[UIApplication sharedApplication] canOpenURL:linkURL]) {
            [[UIApplication sharedApplication] openURL:linkURL];
        }
    }
}

// TODO: Set these all up for the actual libraries search controller
#pragma mark - UISearchDisplayDelegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    return NO;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    return NO;
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView
{
    tableView.delegate = nil;
    tableView.dataSource = nil;
}

@end