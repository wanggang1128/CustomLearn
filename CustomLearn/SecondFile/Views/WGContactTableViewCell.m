//
//  WGContactTableViewCell.m
//  CustomLearn
//
//  Created by wanggang on 2017/8/7.
//  Copyright © 2017年 CSII. All rights reserved.
//

#import "WGContactTableViewCell.h"

#define cellWith self.frame.size.width
#define cellHeight self.frame.size.height

@interface WGContactTableViewCell()

@property (nonatomic, strong) UIImageView *avaterView;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *desLab;
@property (nonatomic, strong) UILabel *timeLab;

@end

@implementation WGContactTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.avaterView];
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.desLab];
        [self.contentView addSubview:self.timeLab];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.avaterView.frame = CGRectMake(15, 2, cellHeight-4, cellHeight-4);
    self.nameLab.frame = CGRectMake(15+(cellHeight-4)+5, 2, cellWith-15-(cellHeight-4)-100, (cellHeight-4)*0.5);
    self.desLab.frame = CGRectMake(15+(cellHeight-4)+5, 2+(cellHeight-4)*0.5, cellWith-15-(cellHeight-4)-100, (cellHeight-4)*0.5);
    self.timeLab.frame = CGRectMake(cellWith-100, 10, 100, cellHeight-10);
}

- (void)setContactModel:(WGContactsModel *)contactModel{
    _contactModel = contactModel;
    _avaterView.image = [UIImage imageNamed:contactModel.contactAvater];
    _nameLab.text = contactModel.contactName;
    _desLab.text = contactModel.contactDes;
    _timeLab.text = contactModel.contactTime;
}

- (UIImageView *)avaterView{
    if (!_avaterView) {
        _avaterView = [[UIImageView alloc] init];
    }
    return _avaterView;
}

- (UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] init];
    }
    return _nameLab;
}

- (UILabel *)desLab{
    if (!_desLab) {
        _desLab = [[UILabel alloc] init];
    }
    return _desLab;
}

- (UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab = [[UILabel alloc] init];
    }
    return _timeLab;
}




















@end
