//
//  ProfileTableViewCell.m
//  ACEExpandableTextCellDemo
//
//  Created by mac on 2017/5/4.
//  Copyright © 2017年 Stefano Acerbetti. All rights reserved.
//

#import "ProfileTableViewCell.h"
#import "CircleView.h"

@interface ProfileTableViewCell ()
@property (nonatomic) CircleView *circleView;
@end

@implementation ProfileTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.circleView];
    }
    return self;
}

- (CircleView *)circleView{
    if (!_circleView) {
        _circleView = [[CircleView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        _circleView.radius = 30;
        _circleView.lineWidth = .5;
        _circleView.color = [UIColor redColor];
        _circleView.fill = YES;
        _circleView.backgroundColor = [UIColor whiteColor];
        
    }
    return _circleView;
}
+ (ProfileTableViewCell *)expandTable:(UITableView *)tableView
{
    ProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProfileTableViewCell"];
    if (cell == nil) {
        cell = [[ProfileTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProfileTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
