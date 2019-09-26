//
//  WGAlgorithmViewController.m
//  CustomLearn
//
//  Created by wanggang on 2018/12/8.
//  Copyright © 2018 WG. All rights reserved.
//

#import "WGAlgorithmViewController.h"

#import "WGPerson.h"
#import "WGTeacher.h"

@interface WGAlgorithmViewController ()

@end

@implementation WGAlgorithmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setViewView];
    
    [WGTeacher new];
    
//    NSMutableArray *arr = @[@"2", @"1", @"3", @"4", @"7", @"5", @"6"].mutableCopy;
    
//    [self bubbleSort:arr];
//    [self bubbleSortNew:arr];
//    [self selecterSort:arr];
//    [self insertionSort:arr];
//    [self shellSort:arr];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [self testTargetQueue2];
}

//dispatch_set_target_queue除了能用来设置队列的优先级之外，还能够创建队列的层次体系，当我们想让不同队列中的任务同步的执行时，我们可以创建一个串行队列，然后将这些队列的target指向新创建的队列即可。
- (void)testTargetQueue2 {
    
    NSLog(@"----start-----当前线程---%@",[NSThread currentThread]);
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_apply(100, globalQueue, ^(size_t index) {
        NSLog(@"执行第%zd次的任务---%@",index, [NSThread currentThread]);
    });
    
    NSLog(@"----end-----当前线程---%@",[NSThread currentThread]);
    
}

#pragma mark -堆排序
- (void)heapSort:(NSMutableArray *)arr{
    //先把要排序数组构建成大顶堆
    //交换
}

#pragma mark -希尔排序
- (void)shellSort:(NSMutableArray *)resArr{
    
    NSLog(@"希尔排序前:%@", resArr);
    int space = (int)(resArr.count-1)/2;
    while (space>=1) {
        [self shellSort:resArr startIndex:space];
        space = space/2;
    }
    NSLog(@"希尔排序后:%@\n", resArr);
}

- (void)shellSort:(NSMutableArray *)resArr startIndex:(NSInteger)space{
    
    for (NSInteger i = space; i<resArr.count; i+=space) {
        NSInteger temp = [resArr[i] integerValue];
        for (NSInteger j = i-space; j >= 0 && temp < [resArr[j] integerValue]; j-=space) {
            resArr[j+space] = resArr[j];
            resArr[j] = [NSNumber numberWithInteger:temp];
        }
    }
}

#pragma mark -直接插入排序
- (NSArray *)insertionSort:(NSArray *)arr{
    
    NSInteger runtimes = 0;
    NSMutableArray *resArr = [[NSMutableArray alloc] initWithArray:arr];
    //默认第一个已经排好序了
    for (NSInteger i = 1; i<resArr.count; i++) {
        //准备排序的新元素
        NSInteger temp = [resArr[i] integerValue];
        //已经排好序的数组,倒序取出和新元素比较
        for (NSInteger j = i-1; j>= 0 && temp < [resArr[j] integerValue]; j--) {
            runtimes += 1;
            resArr[j+1] = resArr[j];
            resArr[j] = [NSNumber numberWithInteger:temp];
        }
    }
    NSLog(@"直接插入排序前:%@\n后:%@\n运行次数:%ld", arr, resArr, runtimes);
    return resArr;
}

#pragma mark -选择
- (NSArray *)selecterSort:(NSArray *)arr{
    
    NSInteger runtimes = 0;
    NSInteger k;
    NSMutableArray *resArr = [[NSMutableArray alloc] initWithArray:arr];
    for (NSInteger i = 0; i<resArr.count; i++) {
        
        k = i;
        for (NSInteger j = i+1; j<resArr.count; j++) {
            
            runtimes += 1;
            if ([resArr[k] integerValue] > [resArr[j] integerValue]) {
                //找最小下标
                k = j;
            }
        }
        if (i != k) {
            //交换两个下标对应的值
            NSInteger temp = [resArr[i] integerValue];
            resArr[i] = resArr[k];
            resArr[k] = [NSNumber numberWithInteger:temp];
        }
    }
    NSLog(@"选择排序前:%@\n后:%@\n运行次数:%ld", arr, resArr, runtimes);
    return resArr;
}

#pragma mark -冒泡
- (NSArray *)bubbleSort:(NSArray *)arr{
    //统计一下运行次数
    NSInteger runtimes= 0;
    NSMutableArray *resArr = [[NSMutableArray alloc] initWithArray:arr];
    for (NSInteger i = 0; i<resArr.count; i++) {
        for (NSInteger j = 0; j< resArr.count-1-i; j++) {
            //次数+1
            runtimes += 1;
            if ([resArr[j] integerValue]>[resArr[j+1] integerValue]) {
                ;
                NSInteger temp = [resArr[j] integerValue];
                resArr[j] = resArr[j+1];
                resArr[j+1] = [NSNumber numberWithInteger:temp];
            }
        }
    }
    NSLog(@"冒泡降序前:%@\n后:%@\n运行次数:%ld", arr, resArr, runtimes);
    return resArr;
}

- (NSArray *)bubbleSortNew:(NSArray *)arr{
    NSInteger runtimes = 0;
    
    BOOL flag = YES;
    NSMutableArray *resArr = [[NSMutableArray alloc] initWithArray:arr];
    for (NSInteger i = 0; i<resArr.count && flag; i++) {
        //默认为No,
        flag = NO;
        for (NSInteger j = 0; j< resArr.count-1-i; j++) {
            
            runtimes += 1;
            if ([resArr[j] integerValue]>[resArr[j+1] integerValue]) {
                ;
                NSInteger temp = [resArr[j] integerValue];
                resArr[j] = resArr[j+1];
                resArr[j+1] = [NSNumber numberWithInteger:temp];
                //如果有数据交换,说明还是无序元素,继续排序,为NO,说明已经有序了,就不要再进行i的循环了
                flag = YES;
            }
        }
    }
    NSLog(@"冒泡降序前:%@\n后:%@\n运行次数:%ld", arr, resArr, runtimes);
    return resArr;
}



- (void)setViewView{
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}



@end
