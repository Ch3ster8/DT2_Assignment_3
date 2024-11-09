# Info for writing this guide (Will be deleted)
   * **ANALYSIS OF DEVELOPMENT PROCESS IS KEY**
   * **TESTING IS REALLY IMPORTANT AND RAW DATA IS NOT INCLUDED IN WORD COUNT**
   * **ANALYSES OPPORTUNITIES FOR FUTURE APPLICATIONS**

<a name="Table-of-Contents"></a>
# Table of Contents
   * ## [Development Process](#Development-Process-1)
        * [Planning](#Planning)
        * [Implementation](#Implementation)
        * [Testing](#Testing)
        * [Evaluation](#Evaluation)
        * [Iteration](#Iteration)
   * ## [Future Application](#Future-Application-1)
   * ## [References](#References-1)
     
<a name="Development-Process"></a>
# Development Process
   <a name="Planning"></a>
   * ### Planning
       * To start I decided to plan, the goal was to come up with a game idea that could be suitably made within a short period of time whilst also including advanced AI and being an engaging experience for the players to allow for testers who are genuinely intrigued by the game.
       
       * I used a [Trello planning board](https://trello.com/invite/b/671c2038b631c2b34dd67730/ATTI95abe02e27cbc3b28b403a40269ce9310F1771B6/stealth) to organise my idea into basic cards that I could complete step by step, this was to avoid trying to do everything at once and running into an issue that could affect large portions of my game simultaneously. Trello allows me to easily set goals for myself as I can say I want to complete "Movement" and "Map" by the end of the night and upon completion I can drag them to the "Done" tab.
       
       * I used [Draw.io](https://drive.google.com/file/d/1UX8MGpArBnDSuwOPo4BcVhbL8r7_uIQn/view?usp=sharing) to make a flow chart of my enemys' state machines, **If I make multiple enemies insert more flow charts** planning out each state and the transition condition will become very useful when coding the official state machine that my enemies would use, I would able to refer back to the flow chart at any time I needed to know what state I had to make and what states transition into the new states and vice versa.
    
       * [Table of Contents](#Table-of-Contents)

   <a name="Implementation"></a>
   * ### Implementation
       * The implementation of my plan went like this, I started with designing the state machine, it needed to be modular and easy to work with, whilst also being understandable from a third party's perspective. Code designed this way has the best future application due to its ease of use and because its understandability to third parties allows it to be shared around even without the original coder.
         
       * Using the state machine I opened up my flow chart for reference but before I could make the enemy states I had to make basic functions for the enemy, so I made an empty node with a movement script that I could reference and use the functions of to move my enemy, I did this so that I didn't have to recode the movement for each state that required the enemy to move.
    
       * [Table of Contents](#Table-of-Contents)
   
   <a name="Testing"></a>
   * ### Testing
       * Unfortunately all of the player experiences were negative however this resulted in some good feedback on how to improve my game and will ultimately increase the playability of my game.
         
       * | Person      | Good or Bad? | What did I do well? | What could I improve on? | What could I add in a short amount of time? |
         | :---:       |  :----:     |     :----:    |     :----:    |     :----:    |
         | Ethan Perkins | Bad | I liked how your enemy incorporated hearing states which influenced the state machine of the enemy | Visual indicators for the state that the enemy is in would be cool. However, I think that if you were to incorporate this some sort of other objective rather than just running would have to be implemented. Such as missions or other tasks and as a result of what you do in these tasks they reveal something like the state of the enemy | An actual ending please because right now it's not very intuitive |
         | Blake Rushworth | Bad | Its pathfinding is good | No real objective, missing collisions on borders, the player movement needs improving | You said that the enemy's location is shown every now and again but i didn't notice so make it easier to understand and find the enemy using it. |
         | Jamie Potter | Bad | It followed the player well and was always able to get to me with no trouble | The player's movement was way too fast, it allowed me to run away from the npc way too easily. | A Real objective to complete in the game, An actual map, have the npc attack. |

       * [Table of Contents](#Table-of-Contents)
   
   <a name="Evaluation"></a>
   * ### Evaluation
       * Everyone liked how the enemy could hear and see the player however it took them a while to notice this due to a lack of visual indicators.
         
       * The game as of this playtesting was not really a game, it did not have a specific start or finish and whilst this is okay for the assignment task, adding a start and finish could be used to influence the enemy states and increase further complexity. In addition to this adding intractable tasks for the player to play around with could add an extra state to the enemy allowing them to assassinate the player from behind as an example of how adding gameplay features could affect the states.
         
       * There were a few minor collision issues resulting in the player being able to escape the boundaries and avoid the enemy entirely which is a simple fix.
    
       * The player movement felt wrong to Blake but I think this is because of the bobbing effect that I applied to the camera, I only applied this effect to the x-axis resulting in wrong-looking motions when moving in any other axis.
    
       * [Table of Contents](#Table-of-Contents)
   
   <a name="Iteration"></a>
   * ### Iteration
   * **RE-ITERATE OVER THIS TO SEE IF I ADDED EVERYTHING HERE**
       * To start off fixing the issue of not seeing the original visual indicators for the player I added an icon in the bottom right of the screen that pops up temporarily depending on whether the enemy has heard or seen you, then I also added arrows pointing "left" or "right" towards the enemy when either of these states has come into effect, this should hopefully be enough to allow the player to understand what the enemy is up to and avoid them as per the game's design.
         
       * To start off I needed to add the enemy attack state allowing the enemy to kill the player, this gave actual consequences for getting caught by the enemy, this in turn would show a death screen allowing the player to restart the game, then I needed to have some form of task that the player needs to complete without getting caught. Before making the enemy I designed the map to have two specific gates, taking inspiration from [Dead By Daylight](https://deadbydaylight.com) when I complete all the necessary tasks two gates will open on each side of the map allowing the player to escape and giving the game an ending. When all the tasks are complete the enemies will go into a frantic search mode ignoring all patrol points and instead going in random directions in order to search for the player and stop them from escaping.
    
       * The collisions were as simple as using an inbuilt godot feature that allowed me to add collisions based on the mesh instance attached to the object, doing this allowed me to create proper collisions for the boundaries and stop the player from leaving the map unwillingly.
    
       * As mentioned in **Testing** fixing the movement was as simple as copying the camera bobbing on the x-axis which uses sine waves to mimic a bobbing motion and changing it to the y-axis resulting in the bobbing being on both axis.
    
       * [Table of Contents](#Table-of-Contents)
         
<a name="Future-Application"></a>
# Future Application
   * I have coded the state machine in my game to be modular meaning rather than having to alter the code every time I want to do something new I instead just have to add a fictional module of sorts to the state machine. Having a modular design lets future applications utilise the state machine however needed.
   
   * An example of a future application for my state machine could be a user interface as only one interface should be open at any point in time to avoid overlapping information, this is almost identical to the function of a state machine. Only one state can be active at any point in time and can only switch between states if it meets a certain condition, like state machines it's required for an input to be pressed for the interface to change, converting each interface into a state and putting them into a state machine would make for a very effective user interface that wouldn't run into any overlapping issues.

   * **Analyze technology concepts and strategies** State machines are not just used for UI and AI, they can be used in a variety of ways considering the versatility of their core concept as mentioned previously. Whilst state machines are used mechanically they can also be used theoretically, when planning out a task it can be useful to draw out each state and the transition to those states, for example when designing the player movement I would draw each action as a state and then each input as the transitions, then instead of coding a state machine for this I would code the player movement with this functionality in mind, so whilst the final product wasn't actually a state machine it still came in useful for planning out the task at hand and helps to avoid bugs by drawing out all the possible edge conditions.

   * [Table of Contents](#Table-of-Contents)
         
# References
   * 
