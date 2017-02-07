//
//  Card.m
//  CardGame
//
//  Created by qiaohaibin on 05/02/2017.
//  Copyright © 2017 qiaohaibin. All rights reserved.
//

#import "Card.h"

@implementation Card

- (NSInteger)match:(NSArray *)otherCards{
    NSInteger score = 0;
    
    for (Card *card in otherCards) {
        if([self.contents isEqualToString:card.contents]){
            score = 1;
        }
    }
    
    return score;
}

@end
