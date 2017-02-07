//
//  ViewController.m
//  CardGame
//
//  Created by qiaohaibin on 05/02/2017.
//  Copyright © 2017 qiaohaibin. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "UIImage+Utility.h"
#import "CardGame.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *senders;
@end

@implementation ViewController

- (CardGame *)game{
    if (!_game) {
        _game = [[CardGame alloc] initWithCardCount:self.senders.count usingDeck:self.deck];
    }
    
    return _game;
}

- (Deck *)deck{
    if(!_deck){
        _deck = [self createDeck];
    }
    
    return _deck;
}

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger index = [self.senders indexOfObject:sender];
    [self.game chooseCardAtIndex:index];
    [self updateUI];
}

- (void)updateUI{
    for (UIButton *sender in self.senders) {
        NSUInteger index = [self.senders indexOfObject:sender];
        Card *card = [self.game cardAtIndex:index];
        [sender setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [sender setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        sender.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %li", (long)self.game.score];
}

- (NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    return !card.isChosen ? [UIImage imageNamed:@"cardback"] : [UIImage imageFromColor:[UIColor whiteColor]];
}

@end
