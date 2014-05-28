#import "MITShuttleRouteViewController.h"
#import "MITShuttleRoute.h"
#import "MITShuttleStop.h"
#import "MITShuttleStopCell.h"
#import "MITShuttleRouteStatusCell.h"

static const NSInteger kEmbeddedMapPlaceholderCellRow = 0;

static const CGFloat kEmbeddedMapPlaceholderCellEstimatedHeight = 100.0;
static const CGFloat kRouteStatusCellEstimatedHeight = 60.0;
static const CGFloat kStopCellHeight = 45.0;

static NSString * const kMITShuttleRouteStatusCellNibName = @"MITShuttleRouteStatusCell";

@interface MITShuttleRouteViewController ()

@property (strong, nonatomic) UITableViewCell *embeddedMapPlaceholderCell;
@property (strong, nonatomic) MITShuttleRouteStatusCell *routeStatusCell;

@end

@implementation MITShuttleRouteViewController

- (instancetype)initWithRoute:(MITShuttleRoute *)route
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        _route = route;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setupTableView
{
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView registerNib:[UINib nibWithNibName:kMITShuttleStopCellNibName bundle:nil] forCellReuseIdentifier:kMITShuttleStopCellIdentifier];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshControlActivated:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

#pragma mark - Refresh Control

- (void)refreshControlActivated:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(routeViewControllerDidRefresh:)]) {
        [self.delegate routeViewControllerDidRefresh:self];
    }
}

#pragma mark - Embedded Map Placeholder Cell

- (UITableViewCell *)embeddedMapPlaceholderCell
{
    if (!_embeddedMapPlaceholderCell) {
        _embeddedMapPlaceholderCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        _embeddedMapPlaceholderCell.backgroundColor = [UIColor clearColor];
        _embeddedMapPlaceholderCell.textLabel.text = nil;
        _embeddedMapPlaceholderCell.separatorInset = UIEdgeInsetsMake(0, _embeddedMapPlaceholderCell.frame.size.width, 0, 0);
    }
    return _embeddedMapPlaceholderCell;
}

#pragma mark - Route Status Cell

- (MITShuttleRouteStatusCell *)routeStatusCell
{
    if (!_routeStatusCell) {
        _routeStatusCell = [[NSBundle mainBundle] loadNibNamed:kMITShuttleRouteStatusCellNibName owner:self options:nil][0];
        [_routeStatusCell setRoute:self.route];
    }
    return _routeStatusCell;
}

#pragma mark - UITableViewDataSource Helpers

- (NSInteger)headerCellCount
{
    return [self.dataSource isMapEmbeddedInRouteViewController:self] ? 2 : 1;
}

- (NSInteger)rowIndexForRouteStatusCell
{
    return [self.dataSource isMapEmbeddedInRouteViewController:self] ? 1 : 0;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.route.stops count] + [self headerCellCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dataSource isMapEmbeddedInRouteViewController:self] && indexPath.row == kEmbeddedMapPlaceholderCellRow) {
        return self.embeddedMapPlaceholderCell;
    } else if (indexPath.row == [self rowIndexForRouteStatusCell]) {
        return self.routeStatusCell;
    } else {
        MITShuttleStopCell *cell = [tableView dequeueReusableCellWithIdentifier:kMITShuttleStopCellIdentifier forIndexPath:indexPath];
        NSInteger stopIndex = indexPath.row - [self headerCellCount];
        MITShuttleStop *stop = self.route.stops[stopIndex];
        [cell setStop:stop prediction:nil];
        [cell setCellType:MITShuttleStopCellTypeRouteDetail];
        return cell;
    }
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dataSource isMapEmbeddedInRouteViewController:self] && indexPath.row == kEmbeddedMapPlaceholderCellRow) {
        return [self.dataSource embeddedMapHeightForRouteViewController:self];
    } else if (indexPath.row == [self rowIndexForRouteStatusCell]) {
        CGFloat height = [self.routeStatusCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        ++height;   // add pt for cell separator;
        return height;
    } else {
        return kStopCellHeight;
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dataSource isMapEmbeddedInRouteViewController:self] && indexPath.row == kEmbeddedMapPlaceholderCellRow) {
        return kEmbeddedMapPlaceholderCellEstimatedHeight;
    } else if (indexPath.row == [self rowIndexForRouteStatusCell]) {
        return kRouteStatusCellEstimatedHeight;
    } else {
        return kStopCellHeight;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row > [self rowIndexForRouteStatusCell];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.delegate respondsToSelector:@selector(routeViewController:didSelectStop:)]) {
        NSInteger stopIndex = indexPath.row - [self headerCellCount];
        MITShuttleStop *stop = self.route.stops[stopIndex];
        [self.delegate routeViewController:self didSelectStop:stop];
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([self.delegate respondsToSelector:@selector(routeViewController:didScrollToContentOffset:)]) {
        [self.delegate routeViewController:self didScrollToContentOffset:scrollView.contentOffset];
    }
}

@end
