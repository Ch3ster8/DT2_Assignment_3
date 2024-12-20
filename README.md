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
       * ![image](https://github.com/user-attachments/assets/90af57c4-3209-4e9b-ade7-c70e30d35c03)
       * This flow chart is the formula I use to create well-designed systems, it allows me to avoid moving forward and encountering vast difficulties that could have been accounted for prior to putting in all the work of implementing.
         
       * To start the planning I had to make a goal, which was to come up with a game idea that could be suitably made within a short period of time whilst also including advanced AI and being an engaging experience for the players to allow for testers who are genuinely intrigued by the game.
       
       * I used a [Trello planning board](https://trello.com/invite/b/671c2038b631c2b34dd67730/ATTI95abe02e27cbc3b28b403a40269ce9310F1771B6/stealth) to organise my idea into basic cards that I could complete step by step, this was to avoid trying to do everything at once and running into an issue that could affect large portions of my game simultaneously. Trello allows me to easily set goals for myself as I can say I want to complete "Movement" and "Map" by the end of the night and upon completion I can drag them to the "Done" tab.
       
       * I used [Draw.io](https://drive.google.com/file/d/1UX8MGpArBnDSuwOPo4BcVhbL8r7_uIQn/view?usp=sharing) to make a flow chart of my enemys' state machines, planning out each state and the transition condition will become very useful when coding the official state machine that my enemies would use, I would able to refer back to the flow chart at any time I needed to know what state I had to make and what states transition into the new states and vice versa.
    
       * [Table of Contents](#Table-of-Contents)



   <a name="Implementation"></a>
   * ### Implementation
       <a href="url"><img src="https://github.com/user-attachments/assets/9750114c-dcef-4d1e-a43d-cd018059bb24" align="right" height=25% width=25% ></a>
       * The implementation of my plan went like this, I started with designing the state machine, it needed to be modular and easy to work with, whilst also being understandable from a third party's perspective. Code designed this way has the best future application due to its ease of use and because its understandability to third parties allows it to be shared around even without the original coder.
         
       * Using the state machine I opened up my flow chart for referencing but before I could make the enemy states I had to make basic functions for the enemy, so I made an empty node with a movement script that I could reference and use the functions of to move my enemy, I did this so that I didn't have to recode the movement for each state that required the enemy to move.
    
       * Using [DebugDraw3D](https://godotengine.org/asset-library/asset/1766) I was able to debug more information that allowed me to troubleshoot issues in a more timely manner. Using this addon I drew lines that showed me the ray cast that I was casting from the enemy to the player and it would turn from blue to red if the enemy could see me.
    
       * [Table of Contents](#Table-of-Contents)
   
   <a name="Testing"></a>
   * ### Testing
       * Unfortunately all of the player experiences were negative however this resulted in some good feedback on how to improve my game and will ultimately increase the playability and technicality of my game.
         
       * | Person      | Good or Bad? | What did I do well? | What could I improve on? | What could I add in a short amount of time? |
         | :---:       |  :----:     |     :----:    |     :----:    |     :----:    |
         | Ethan Perkins | Bad | I liked how your enemy incorporated hearing states which influenced the state machine of the enemy | Visual indicators for the state that the enemy is in would be cool. However, I think that if you were to incorporate this some sort of other objective rather than just running would have to be implemented. Such as missions or other tasks and as a result of what you do in these tasks they reveal something like the state of the enemy | An actual ending please because right now it's not very intuitive |
         | Blake Rushworth | Bad | Its pathfinding is good | No real objective, missing collisions on borders, the player movement needs improving | You said that the enemy's location is shown every now and again but I didn't notice so make it easier to understand and find the enemy using it. |
         | Jamie Potter | Bad | It followed the player well and was always able to get to me with no trouble | The player's movement was way too fast, it allowed me to run away from the NPC way too easily. | A Real objective to complete in the game, An actual map, have the NPC attack. |
         | Cameron Furlan | Good | The game's main enemy is well-made and mimics a human well. | When the enemy touches the player the game lags out and completely breaks, it doesn't crash but it has major frame drops. | Some audio when walking would be nice. |

       * [Table of Contents](#Table-of-Contents)
         <a href="url"><img src="https://github.com/user-attachments/assets/b0842a11-cab8-4394-b25d-552e52e3db0a" align="right" height=50% width=50% ></a>
   
   <a name="Evaluation"></a>
   * ### Evaluation
       * Everyone liked how the enemy could hear and see the player however it took them a while to notice this due to a lack of visual indicators.
         
       * The game as of this playtesting was not really a game, it did not have a specific start or finish and whilst this is okay for the assignment task, adding a start and finish could be used to influence the enemy states and increase further complexity. In addition to this adding intractable tasks for the player to play around with could add an extra state to the enemy allowing them to assassinate the player from behind as an example of how adding gameplay features could affect the states.
         
       * There were a few minor collision issues resulting in the player being able to escape the boundaries and avoid the enemy entirely which is a simple fix.
    
       * The player movement felt wrong to Blake but I think this is because of the bobbing effect that I applied to the camera, I only applied this effect to the x-axis resulting in wrong-looking motions when moving in any other axis.
    
       * Jamie thought the movement was too fast and I agree, I think the enemy should be faster than the player but then this causes the issue of when your seen there is no escaping the enemy. Taking more inspiration from [Dead By Daylight](https://deadbydaylight.com) as my game concept is much the same, in [Dead By Daylight](https://deadbydaylight.com) the player can use pallets to stun the enemy for a little bit allowing the player to run away and hopefully escape, there is also a flashlight that can be used to blind the enemy also giving the player another chance to escape.
    
       * The game could go through a major bug test to iron out all of the issues, removing many awful encounters that the player could have and overall making the game more fun and playable, to test this I will need to run into every possible spot to see if the player can get stuck I will also try to break the AI with certain wall structures and how the player moves around them.
    
       * [Table of Contents](#Table-of-Contents)
   
   <a name="Iteration"></a>
   * ### Iteration
   * **Most of these features did not get added to the final game and are instead what I would have added given more time**
       * To start off fixing the issue of not seeing the original visual indicators for the player I added an icon in the bottom right of the screen that pops up temporarily depending on whether the enemy has heard or seen you, then I also added arrows pointing "left" or "right" towards the enemy when either of these states has come into effect, this should hopefully be enough to allow the player to understand what the enemy is up to and avoid them as per the game's design.
         
       * I needed to add the enemy attack state allowing the enemy to kill the player to give actual consequences for getting caught by the enemy, dying would show a death screen allowing the player to restart the game, then I needed to have some form of task that the player needs to complete without getting caught. Before making the enemy I designed the map to have two specific gates, taking inspiration from [Dead By Daylight](https://deadbydaylight.com) when I complete all the necessary tasks two gates will open on each side of the map allowing the player to escape and giving the game an ending. When all the tasks are complete the enemies will go into a frantic search mode ignoring all patrol points and instead going in random directions in order to search for the player and stop them from escaping. Due to the unpredictability when the enemies are in the frantic state, it makes the enemies harder to avoid, in turn, this gives the player a higher sense of satisfaction upon escaping.
    
       * The collisions were as simple as using an inbuilt godot feature that allowed me to add collisions based on the mesh instance attached to the object, doing this allowed me to create proper collisions for the boundaries and stop the player from leaving the map unwillingly which avoided the issue of falling off the map or being able to stand still forever with no consequences.
    
       * As mentioned in **Testing** fixing the movement was as simple as copying the camera bobbing on the x-axis which uses sine waves to mimic a bobbing motion and changing it to the y-axis resulting in the bobbing being on both axes, giving the player a more realistic feel and hopefully immersing them more into the game, this is because when we run in real life we bob up and down but also move side to side, all I'm doing is recreating this effect in-game.
    
       * I decided to add a flashlight to the player allowing them to blind the enemy, this would trigger a blind state on the enemy causing them to run in the player's general direction rather than straight at them until they can see again, the flashlight will have a limited battery and so the player must use it sparingly and it will also have a cooldown. This solves the issue of the enemy having higher movement speed whilst still giving the player a fair chance to escape.
    
       * To solve the terrible frame drops when touching the enemy I added an Area3D to detect when the player is too close to the enemy, then I apply a force to the player pushing them away from the enemy which allows the collisions to avoid touching and patching the bug in its entirety. It's important to patch game-breaking bugs like this one because this bug is not fun, it's just annoying and doesn't bring any extra gameplay or amusement to the player, inversely if this bug was amusing and brought extra gameplay I wouldn't bother to fix it as it would most likely help the game be fun.
    
       * [Table of Contents](#Table-of-Contents)
         
<a name="Future-Application"></a>
# Future Application
   
   * I have coded the state machine in my game to be modular meaning rather than having to alter the code every time I want to do something new I instead just have to add a fictional module of sorts to the state machine. Having a modular design lets future applications utilise the state machine however needed.
   
   * An example of a future application for my state machine could be a user interface as only one interface should be open at any point in time to avoid overlapping information, this is almost identical to the function of a state machine. Only one state can be active at any point in time and can only switch between states if it meets a certain condition, like state machines it's required for an input to be pressed for the interface to change, converting each interface into a state and putting them into a state machine would make for a very effective user interface that wouldn't run into any overlapping issues.

   * State machines are not just used for UI and AI, they can be used in a variety of ways considering the versatility of their core concept as mentioned previously. Whilst state machines are used mechanically they can also be used theoretically, when planning out a task it can be useful to draw out each state and the transition to those states, for example when designing the player movement I would draw each action as a state and then each input as the transitions, then instead of coding a state machine for this I would code the player movement with this functionality in mind, so whilst the final product wasn't actually a state machine it still came in useful for planning out the task at hand and helps to avoid bugs by drawing out all the possible edge conditions.

   * State machines can also be used <a href="url"><img src="https://github.com/user-attachments/assets/02354c2f-f549-425c-8a3b-94914db9a30b" align="right" height=50% width=50% ></a>as a basis for other types of AI systems, an example of this is the Behaviour Tree, much like the state machine only one state can be active at any time, the difference is that the state machine is non-linear whereas the behaviour tree is linear, we can use a state machine to move between states but rather than moving all over the place we can move down the tree, treating each state more like an "If statement" until we get to the function that needs to be executed. This example shows that state machines are much bigger than first expected and are the basis of many AI systems, this allows for the state machine to be applied all across the field and can be used in many varying ways to create maximum capabilities. The image on the right is a behaviour tree for example aswell.


   * [Table of Contents](#Table-of-Contents)
         
# References
  ### These are completely free to use in any project of your choosing (yes, also commercially):
   * “KayKit: Halloween Bits.” Itch.io, 2024, [halloween-bits](kaylousberg.itch.io/halloween-bits). Accessed 9 Nov. 2024.
   * “KayKit - Character Pack: Skeletons by Kay Lousberg.” Itch.io, [kaykit-skeletons](kaylousberg.itch.io/kaykit-skeletons). Accessed 9 Nov. 2024.
   * "Researchgate", N/A, [Researchgate](https://www.researchgate.net/figure/A-behavior-tree-including-selector-sequence-condition-and-action-nodes_fig4_312869797). Accessed 15 Nov. 2024.
   * **These aren't referenced in Harvard format because this is how the creator explicitly wanted them referenced and they wanted them referenced in-game which I have done:**
   * <a href="https://www.flaticon.com/free-icons/hearing" title="hearing icons">Hearing icons created by Prashanth Rapolu 15 - Flaticon</a>
   * <a href="https://www.flaticon.com/free-icons/exclamation-mark" title="exclamation mark icons">Exclamation mark icons created by flatart_icons - Flaticon</a>
  
   
