//
//  Deck.m
//  CardGame
//
//  Created by qiaohaibin on 05/02/2017.
//  Copyright © 2017 qiaohaibin. All rights reserved.
//

#import "Deck.h"

@interface Deck ()
@property (strong, nonatomic) NSMutableArray *cards; // of cards
@end

@implementation Deck

- (NSMutableArray *)cards{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(Card *)card{
    [self addCard:card atTop:false];
}

- (Card *)drawRandomCard{
    Card *card = nil;
    
    if([self.cards count]){
        NSUInteger index = arc4random() % [self.cards count];
        card = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return card;
}

@end
