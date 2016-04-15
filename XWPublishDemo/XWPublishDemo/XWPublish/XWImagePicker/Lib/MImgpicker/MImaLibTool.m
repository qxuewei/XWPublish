//
//  MImaLibTool.m
//  QQImagePicker
//
//  Created by mark on 15/9/11.
//  Copyright (c) 2015年 mark. All rights reserved.
//

#import "MImaLibTool.h"

@interface MImaLibTool ()

@end

@implementation MImaLibTool

+ (id)shareMImaLibTool {

    static MImaLibTool *tool;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
       
        tool = [[[self class] alloc] init];
        tool.lib = [[ALAssetsLibrary alloc] init];
    });
    
    return tool;
}



- (NSArray *)checkMarkSameSetWithArr:(NSArray *)arrSelected set:(ALAsset *)set {
    NSString *urlstring = set.defaultRepresentation.url.absoluteString;
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF.defaultRepresentation.url.absoluteString == %@",urlstring];
    NSArray *arr = [arrSelected filteredArrayUsingPredicate:pre];
    return arr;
}

- (BOOL)imaInArrImasWithArr:(NSArray *)arrIma set:(ALAsset *)set {

//    NSString *uti = set.defaultRepresentation.UTI;
//    NSString *UTI = [[[arrIma lastObject] defaultRepresentation] UTI];
    return [self checkMarkSameSetWithArr:arrIma set:set].count > 0;
}

- (void)getAllGroupWithArrObj:(arrBlock)block {

    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        NSMutableArray *arrGroup = [NSMutableArray array];
        [_lib enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            
            if (group) {
                [arrGroup addObject:group];
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (arrGroup.count > 0) {
                        (!block)?:block([arrGroup copy]);
                    }
                });
            }
            
            
        } failureBlock:^(NSError *error) {
            
        }];

        
    });
   
}

- (NSArray *)getAllAssetsWithGroup:(ALAssetsGroup *)group {

    NSMutableArray *arr = [NSMutableArray array];
    
    [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if (result) {
            [arr addObject:result];
        }
    }];
    return [arr copy];
}


@end
