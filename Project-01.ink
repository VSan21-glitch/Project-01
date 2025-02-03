/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR coins = 0
VAR sword = 0

-> Dungeon

== Dungeon ==
You find yourself in a dark dungeon. In front of you are multiple tunnels to go through.

You currently have {coins} coins and {sword} swords.

+[Take the First Tunnel] -> First_Tunnel
+[Take the Second Tunnel] -> Second_Tunnel
+[Take the Third Tunnel] -> Third_Tunnel


== First_Tunnel ==
You decided to take the first tunnel. It's a dead end. {not sword_pickup: Although there is a sword on ground, pick it up?} 
*[Pick up sword] -> sword_pickup
+[Go back] -> Dungeon

== Second_Tunnel == 
You decided to take the Second tunnel. {not dead_monster: There is a black scaley creature that is blocking the way.}
*{sword > 0} [Slay monster] -> dead_monster
+[Go Back] -> Dungeon

== Third_Tunnel == 
You decided to take the Third Tunnel. Due to the darkness, you can see that well. Though you think you may have found...something, or maybe nothing. It seems you found a large, gleaming gold chest {not get_coins:and a small, timeworn wooden one}.
*[Open gold chest] -> troll_ending
*[Open wooden chest] -> get_coins
+[Go Back] -> Dungeon

== sword_pickup == 
You grasp the hilt of an ancient sword, worn and covered in grime. Its edge is dull, but you can feel a faint pulse—one last strike before it shatters.
~sword = sword + 1 
*[Go back] -> Dungeon

== dead_monster ==
You killed the monster with the sword but your sword shatters.
~sword = sword - 1
+[Keep going] -> deeper_second

== deeper_second ==
You see a door and open it. You made it out the dungeon!
You have {sword} swords.
-> END

== troll_ending ==
When you opened the golden chest, you actiated a bomb in the chest that killed you instantly.
You just got trolled.
-> END

== get_coins ==
When you opened the wooden chest, you found 10 gold coins inside. Lucky you.
~coins = coins + 10
-> Dungeon




