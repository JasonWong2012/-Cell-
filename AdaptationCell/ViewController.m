//
//  ViewController.m
//  AdaptationCell
 

#import "ViewController.h"
#import "MyCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *datas;
@end

@implementation ViewController

static NSString *const myCellID = @"myCellID";

- (NSMutableArray *)datas
{
    if (!_datas) {
        _datas = [NSMutableArray array];
        
        [_datas addObject:@{
                            @"image": @"headImage.jpeg",
                            @"title": @"title111111111111111",
                            @"content": @"left1:111111111\nleft2:2222222222\n"
                            }];
        [_datas addObject:@{
                            @"image": @"headImage.jpeg",
                            @"title": @"title22222222222222222",
                            @"content": @"left1:111111111\nleft2:2222222222\nleft3:3333333333"
                            }];
        [_datas addObject:@{
                            @"image": @"headImage.jpeg",
                            @"title": @"title333333333333333",
                            @"content": @"left1:111111111\nleft2:2222222222\nleft3:3333333333\nleft4:44444444\nleft5:5555555"
                            }];
        [_datas addObject:@{
                            @"image": @"headImage.jpeg",
                            @"title": @"title44444444444444444444",
                            @"content": @"left1:111111111\nleft2:2222222222\nleft3:3333333333\nleft4:44444444\nleft5:5555555\neft1:111111111\nleft2:2222222222\nleft3:3333333333\nleft4:44444444\nleft5:5555555"
                            }];
    }
    return _datas;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style: UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundView = nil;
    self.tableView.separatorStyle = YES;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 0;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyCell class]) bundle:nil] forCellReuseIdentifier:myCellID];
    
    
}

#pragma mark - 代理
#pragma mark UITableViewDataSource
//多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.datas count];
}

//cell显示内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:myCellID];
    cell.dataDict = self.datas[indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    // top高度 = 头像高度 + 线 + 上下间距 (这里高度是固定的)
    CGFloat topHeight = 40;
    
    // UILabel左边距(约束)。。。。
    CGFloat contentMarginLeft = 5;
    // UILabel右间距(约束)。。。
    CGFloat contentMarginRight = 5;
    // UILabel字体大小(xib已经设好的文字大小)。。。
    CGFloat fontSize = 20;
    // UILabel 内容。。。
    NSString *content = self.datas[indexPath.row][@"content"];
    // 计算UILabelsize
    CGSize contentSize = [content boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - contentMarginLeft - contentMarginRight, MAXFLOAT)
                                             options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                                          attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}
                                             context:nil].size;
    return topHeight + contentSize.height + fontSize;
}



@end
