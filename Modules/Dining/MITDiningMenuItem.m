#import "MITDiningMenuItem.h"
#import "MITDiningMeal.h"
#import "UIImage+PDF.h"

@implementation MITDiningMenuItem

@dynamic dietaryFlags;
@dynamic itemDescription;
@dynamic name;
@dynamic station;
@dynamic meal;

+ (RKMapping *)objectMapping
{
    RKEntityMapping *mapping = [[RKEntityMapping alloc] initWithEntity:[self entityDescription]];
    
    [mapping addAttributeMappingsFromArray:@[@"station", @"name"]];
    [mapping addAttributeMappingsFromDictionary:@{@"description" : @"itemDescription",
                                                  @"dietary_flags" : @"dietaryFlags"}];
    
    
    return mapping;
}

+ (NSString *)pdfNameForDietaryFlag:(NSString *)flag
{
    static NSDictionary *flagPdfs;
    if (!flagPdfs) {
        flagPdfs = @{
                     @"farm to fork": @"dining/farm_to_fork.pdf",
                     @"organic": @"dining/organic.pdf",
                     @"seafood watch": @"dining/seafood_watch.pdf",
                     @"vegan": @"dining/vegan.pdf",
                     @"vegetarian": @"dining/vegetarian.pdf",
                     @"for your well-being": @"dining/well_being.pdf",
                     @"made without gluten": @"dining/gluten_free.pdf",
                     @"halal": @"dining/halal.pdf",
                     @"kosher": @"dining/kosher.pdf",
                     @"humane": @"dining/humane.pdf",
                     @"in balance": @"dining/in_balance.pdf"
                     };
    }
    
    return flagPdfs[flag];
}

+ (NSString *)displayNameForDietaryFlag:(NSString *)flag
{
    static NSDictionary *flagDisplayNames;
    if (!flagDisplayNames) {
        flagDisplayNames = @{
                             @"farm to fork": @"Farm to Fork",
                             @"organic": @"Organic",
                             @"seafood watch": @"Seafood Watch",
                             @"vegan": @"Vegan",
                             @"vegetarian": @"Vegetarian",
                             @"for your well-being": @"For Your Well-Being",
                             @"made without gluten": @"Made Without Gluten",
                             @"halal": @"Halal",
                             @"kosher": @"Kosher",
                             @"humane": @"Humane",
                             @"in balance": @"In Balance"
                             };
    }
    return flagDisplayNames[flag];
}

+ (NSArray *)allDietaryFlagsKeys
{
    static NSArray *allFlagKeys;
    if (!allFlagKeys) {
        allFlagKeys = @[
                        @"farm to fork",
                        @"for your well-being",
                        @"halal",
                        @"humane",
                        @"in balance",
                        @"kosher",
                        @"made without gluten",
                        @"organic",
                        @"seafood watch",
                        @"vegan",
                        @"vegetarian"
                        ];
    }
    return allFlagKeys;
}

+ (NSMutableAttributedString *)dietaryFlagsStringForFlags:(NSArray *)flags atSize:(CGSize)size verticalAdjustment:(CGFloat)verticalAdjustment
{
    NSMutableAttributedString *flagsString = [[NSMutableAttributedString alloc] init];
    NSAttributedString *spacer = [[NSAttributedString alloc] initWithString:@" "];
    for (NSString *dietaryFlag in flags) {
        UIImage *dietaryFlagImage = [UIImage imageWithPDFNamed:[MITDiningMenuItem pdfNameForDietaryFlag:dietaryFlag] atSize:size];
        NSTextAttachment *dietaryFlagAttachment = [[NSTextAttachment alloc] init];
        dietaryFlagAttachment.image = dietaryFlagImage;
        dietaryFlagAttachment.bounds = CGRectMake(0, verticalAdjustment, size.width, size.height);
        
        NSAttributedString *imageString = [NSAttributedString attributedStringWithAttachment:dietaryFlagAttachment];
        [flagsString appendAttributedString:imageString];
        [flagsString appendAttributedString:spacer];
    }
    
    return flagsString;
}

- (NSAttributedString *)attributedNameWithDietaryFlagsAtSize:(CGSize)size verticalAdjustment:(CGFloat)verticalAdjustment
{
    NSMutableAttributedString *itemName = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ ", self.name]];
    
    [itemName appendAttributedString:[MITDiningMenuItem dietaryFlagsStringForFlags:self.dietaryFlags atSize:size verticalAdjustment:verticalAdjustment]];
    
    return itemName;
}

+ (NSAttributedString *)dietaryFlagsDisplayStringForFlags:(NSArray *)dietaryFlags atSize:(CGSize)size verticalAdjustment:(CGFloat)verticalAdjustment
{
    NSMutableAttributedString *dietaryFlagsString = [MITDiningMenuItem dietaryFlagsStringForFlags:dietaryFlags atSize:size verticalAdjustment:verticalAdjustment];
    if ([dietaryFlags count] == 1) {
        NSString *flagName = [MITDiningMenuItem displayNameForDietaryFlag:[dietaryFlags firstObject]];
        [dietaryFlagsString appendAttributedString:[[NSAttributedString alloc] initWithString:flagName attributes:nil]];
    }
    return dietaryFlagsString;
}

@end