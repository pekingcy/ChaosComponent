//
//  ChaosBasicKnowledgeViewController.m
//  ChaosComponent
//
//  Created by jh on 2021/3/8.
//

#import "ChaosBasicKnowledgeViewController.h"
#include "MArray.cpp"

using namespace std;

@interface ChaosBasicKnowledgeViewController ()

@end

@implementation ChaosBasicKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    MArray<int> array = *new MArray<int>;
    array.init();
    array.add(1);
    array.insert(1,2);
    array.objectAt(1);
    array.clear();
    int value = array.objectAt(0);
    array.display();
}

@end
