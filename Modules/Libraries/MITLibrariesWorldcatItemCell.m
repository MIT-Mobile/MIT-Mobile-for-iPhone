#import "MITLibrariesWorldcatItemCell.h"
#import "MITLibrariesWorldcatItem.h"
#import "UIKit+MITLibraries.h"
#import "UIImageView+WebCache.h"

@interface MITLibrariesWorldcatItemCell ()

@property (nonatomic, assign) UIEdgeInsets separatorInsetsBeforeHiding;

@end

@implementation MITLibrariesWorldcatItemCell

- (void)awakeFromNib
{
    _showsSeparator = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.itemTitleLabel setLibrariesTextStyle:MITLibrariesTextStyleBookTitle];
    [self.yearAndAuthorLabel setLibrariesTextStyle:MITLibrariesTextStyleSubtitle];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.itemTitleLabel.preferredMaxLayoutWidth = self.itemTitleLabel.bounds.size.width;
    self.yearAndAuthorLabel.preferredMaxLayoutWidth = self.yearAndAuthorLabel.bounds.size.width;
    
    if (!self.showsSeparator) {
        self.separatorInset = UIEdgeInsetsMake(0, self.bounds.size.width, 0, 0);
    }
}

- (void)setItem:(MITLibrariesWorldcatItem *)item
{
    if ([_item isEqual:item]) {
        return;
    }
    
    self.itemImageView.image = nil;
    if (item.coverImages.count > 0) {
        MITLibrariesCoverImage *coverImage = item.coverImages[0];
        [self.itemImageView sd_setImageWithURL:[NSURL URLWithString:coverImage.url]];
    }
    
    self.itemTitleLabel.text = item.title;
    NSString *authorString = [item authorsString];
    self.yearAndAuthorLabel.text = authorString ? [NSString stringWithFormat:@"%@; %@", [item yearsString], [item authorsString]] : [item yearsString];
    
    _item = item;
}

- (void)setShowsSeparator:(BOOL)showsSeparator
{
    if (_showsSeparator == showsSeparator) {
        return;
    }
    
    _showsSeparator = showsSeparator;
    
    if (_showsSeparator) {
        self.separatorInset = self.separatorInsetsBeforeHiding;
    } else {
        self.separatorInsetsBeforeHiding = self.separatorInset;
        self.separatorInset = UIEdgeInsetsMake(0, self.bounds.size.width, 0, 0);
    }
}

#pragma mark - Cell Sizing

+ (CGFloat)heightForItem:(MITLibrariesWorldcatItem *)item tableViewWidth:(CGFloat)width
{
    [[[self class] sizingCell] setItem:item];
    return [[self class] heightForCell:[[self class] sizingCell] tableWidth:width];
}

+ (CGFloat)heightForCell:(MITLibrariesWorldcatItemCell *)cell tableWidth:(CGFloat)width
{
    CGRect frame = cell.frame;
    frame.size.width = width;
    cell.frame = frame;
    
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    ++height; // add pixel for cell separator
    return MAX(105, height);
}

+ (instancetype)sizingCell
{
    static MITLibrariesWorldcatItemCell *sizingCell;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
        sizingCell = [cellNib instantiateWithOwner:nil options:nil][0];
    });
    return sizingCell;
}

@end