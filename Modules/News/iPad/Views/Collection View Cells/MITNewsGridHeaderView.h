#import <UIKit/UIKit.h>

@interface MITNewsGridHeaderView : UICollectionReusableView
@property (nonatomic,weak) IBOutlet UIView *separatorView;
@property (nonatomic,weak) IBOutlet UILabel *headerLabel;
@property (nonatomic,weak) IBOutlet UIView *accessoryView;
@end