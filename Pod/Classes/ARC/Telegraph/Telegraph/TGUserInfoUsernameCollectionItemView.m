#import "TGUserInfoUsernameCollectionItemView.h"

#import "TGImageUtils.h"
#import "TGFont.h"
#import "TGCommon.h"

@interface TGUserInfoUsernameCollectionItemView ()
{
    CALayer *_separatorLayer;
    
    UILabel *_labelView;
    UILabel *_usernameLabel;
}

@end

@implementation TGUserInfoUsernameCollectionItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        self.selectionInsets = UIEdgeInsetsMake(TGIsRetina() ? 0.5f : 1.0f, 0.0f, 0.0f, 0.0f);
        
        _separatorLayer = [[CALayer alloc] init];
        _separatorLayer.backgroundColor = TGSeparatorColor().CGColor;
        [self.backgroundView.layer addSublayer:_separatorLayer];
        
        _labelView = [[UILabel alloc] init];
        _labelView.backgroundColor = [UIColor clearColor];
        _labelView.textColor = TGAccentColor();
        _labelView.font = TGSystemFontOfSize(14.0f);
        [self addSubview:_labelView];
        
        _usernameLabel = [[UILabel alloc] init];
        _usernameLabel.backgroundColor = [UIColor clearColor];
        _usernameLabel.textColor = [UIColor blackColor];
        _usernameLabel.font = TGSystemFontOfSize(17.0f);
        [self addSubview:_usernameLabel];
    }
    return self;
}

- (void)setLabel:(NSString *)label
{
    _labelView.text = label;
    [self setNeedsLayout];
}

- (void)setUsername:(NSString *)username
{
    _usernameLabel.text = username;
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect bounds = self.bounds;
    
    CGFloat separatorHeight = TGIsRetina() ? 0.5f : 1.0f;
    _separatorLayer.frame = CGRectMake(35.0f, bounds.size.height - separatorHeight, bounds.size.width - 35.0f, separatorHeight);
    
    CGFloat leftPadding = 35.0f + TGRetinaPixel;
    
    CGSize labelSize = [_labelView sizeThatFits:CGSizeMake(bounds.size.width - leftPadding - 10.0f, CGFLOAT_MAX)];
    _labelView.frame = CGRectMake(leftPadding, 13.0f, labelSize.width, labelSize.height);
    
    CGSize usernameSize = [_usernameLabel sizeThatFits:CGSizeMake(bounds.size.width - leftPadding - 10.0f, CGFLOAT_MAX)];
    _usernameLabel.frame = CGRectMake(leftPadding, 32.0f, usernameSize.width, usernameSize.height);
}

@end
