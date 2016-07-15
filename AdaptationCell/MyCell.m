//
//  MyCell.m
//  AdaptationCell
 

#import "MyCell.h"

@interface MyCell()

@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
    
    self.contentLabel.numberOfLines = 0;
    [self.contentLabel sizeToFit];
}

- (void)setDataDict:(NSDictionary *)dataDict
{
    _dataDict = dataDict;
    
    self.headImageView.image = [UIImage imageNamed:dataDict[@"image"]];
    
    self.titleLabel.text = dataDict[@"title"];
    
    self.contentLabel.text = dataDict[@"content"];
    
}
@end
