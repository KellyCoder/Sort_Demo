//
//  ViewController.m
//  Sort_Demo
//
//  Created by Kelly on 2018/9/6.
//  Copyright © 2018年 杨凯. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



#pragma mark - 插入排序,时间复杂度 O (n^2)
/*插入排序不适合对于数据量比较大的排序应用。但是，如果需要排序的数据量很小，例如，量级小于千，那么插入排序还是一个不错的选择。*/
// 升序
- (void)insertSortAsc{
    NSMutableArray *array = [NSMutableArray array];
//    NSLog(@"测试时间");
    for (int i = 0; i < 10; i++) {
        int j = arc4random() % 100;
        [array addObject:@(j)];
    }
    
    for (int i = 1; i < array.count; i ++) {
        id value = array[i];
        int j = i - 1;
        while (j >= 0 && array[j] > value) {
            array[j + 1] = array[j];
            j--;
        }
        array[j + 1] = value;
    }
//    NSLog(@"测试时间2");
//    NSLog(@"插入排序升序array= %@",array);
}
// 降序
- (void)insertSortDes{
    NSMutableArray *array = [@[@(10),@(2),@(6),@(0),@(3)] mutableCopy];
    for (int i = 1; i < array.count; i++) {
        id value = array[i];
        int j = i - 1;
        while (j >= 0 && array[j] < value) {
            array[j + 1] = array[j];
            j--;
        }
        array[j + 1] = value;
    }
//    NSLog(@"插入排序降序array= %@",array);
}

#pragma mark - 分治算法
//求最大值
- (id)getMaxValue:(NSArray *)array beginIndex:(NSInteger)begin endIndex:(NSInteger)end{
    id max1 = 0;
    id max2 = 0;
    if (begin == end) { //划分到最后，剩余1个数
        return array[begin];
    }else if (begin + 1== end){//划分到最后，剩余2个数
        return array[begin] > array[end] ? array[begin] : array[end];
    }else{ //如果剩余的数多于2个，划分成两段，选出这两段的最大值
        NSInteger mid = (begin + end) / 2;
//        NSLog(@"mid= %ld",mid);
        max1 = [self getMaxValue:array beginIndex:begin endIndex:mid];
//        NSLog(@"max1= %@",max1);
        max2 = [self getMaxValue:array beginIndex:mid + 1 endIndex:end];
//        NSLog(@"max2= %@",max2);
        return max1 > max2 ? max1 : max2;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*插入排序*/
    [self insertSortAsc];
    [self insertSortDes];
    
    /*分治算法*/
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        int j = arc4random() % 10;
        [array addObject:@(j)];
    }
    id max = [self getMaxValue:array beginIndex:0 endIndex:array.count - 1];
    NSLog(@"max= %@",max);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
