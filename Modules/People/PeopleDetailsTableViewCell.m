#import "PeopleDetailsTableViewCell.h"
#import "MITUIConstants.h"

@implementation PeopleDetailsTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
        self.detailTextLabel.numberOfLines = 0;
        return self;
    }
    return nil;
}

// this adjusts the height of the cell to fit contents
- (void) layoutSubviews {
	[super layoutSubviews];
	
	self.textLabel.textColor = CELL_DETAIL_FONT_COLOR;
	
	CGSize labelSize = [self.detailTextLabel.text sizeWithFont:self.detailTextLabel.font 
											 constrainedToSize:CGSizeMake(self.detailTextLabel.frame.size.width, 2009.0f) 
												 lineBreakMode:UILineBreakModeWordWrap];

	self.detailTextLabel.frame = CGRectMake(self.detailTextLabel.frame.origin.x, 
											self.detailTextLabel.frame.origin.y,
											self.detailTextLabel.frame.size.width, 
											labelSize.height);
}

#pragma mark -

- (void)dealloc {
    [super dealloc];
}


@end
