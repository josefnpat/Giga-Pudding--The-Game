YOU ARE GIGA PUDDI!

You travel the city scape, consuming donuts

Every once in a while, puddi eats some of himself.

As he gets bigger, puddi grows larger, and city becoomes smaller

Background Color: #0370c2
Bar Color: ff9f17

gamelib:
  puddi
    This controls the character. Also makes himself eat some of himself every once in a while.
    draw puddi proportional to his point value
    walking, use img 4 & 5
    donut collect use img 6
    when point decrease, use img 7 -> 11, then 1 ->3
    
  donut
    creates donuts randomly to the right of puddi, forcing him to move right.
    if puddi gets close enough to one, he eats it.
    
  city
    draws city based on point value
  
debug:
  draws puddi's size
  
intro:
  Draws rainbow, title and title-puddi with "press space to start!"
  Starts "Giga Pudding.mp3" and plays in loop.
  
end:
  If puddi is too small, show soniam.png with "SON I AM GIGAPUDDI"
  If puddi is big, show puddi-title with "Puddi Puddi" and time it took to win.

