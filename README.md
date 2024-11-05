# Info for writing this guide (Will be deleted)
   * **ANALYSIS OF DEVELOPMENT PROCESS IS KEY**
   * **TESTING IS REALLY IMPORTANT AND RAW DATA IS NOT INCLUDED IN WORD COUNT**
   * **ANALYSES OPPORTUNITIES FOR FUTURE APPLICATIONS**

<a name="Table-of-Contents"></a>
# Table of Contents
   * ### [Development Process](#Development-Process)
        * [Planning](#Planning)
   * [References](#References)
     
<a name="Development-Process"></a>
# Development Process
   <a name="Planning"></a>
   * ### Planning
       * To start I decided to plan, the goal was to come up with a game idea that could be suitably made within a short period of time whilst also including advanced AI and being an engaging experience for the players to allow for testers who are genuinely intrigued by the game.
       * I used a [Trello planning board](https://trello.com/invite/b/671c2038b631c2b34dd67730/ATTI95abe02e27cbc3b28b403a40269ce9310F1771B6/stealth) to organise my idea into basic cards that I could complete step by step, this was to avoid trying to do everything at once and running into an issue that could affect large portions of my game simultaneously. Trello allows me to easily set goals for myself as I can say I want to complete "Movement" and "Map" by the end of the night and upon completion I can drag them to the "Done" tab.
       * I used [Draw.io](https://drive.google.com/file/d/1UX8MGpArBnDSuwOPo4BcVhbL8r7_uIQn/view?usp=sharing) to make a flow chart of my enemys' state machines, **If I make multiple enemies insert more flow charts** planning out each state and the transition condition will become very useful when coding the official state machine that my enemies would use, I would able to refer back to the flow chart at any time I needed to know what state I had to make and what states transition into the new states and vice versa.

   <a name="Implementation"></a>
   * ### Implementation
       * Implementations of plans don't always go according to plan
         
   <a name="Future-Application"></a>
   * ### Future Application
       * I have coded the state machine in my game to be modular meaning rather than having to alter the code every time I want to do something new I instead just have to add a fictional module of sorts to the state machine. Having a modular design lets future applications utilise the state machine however needed.
       *  An example of a future application for my state machine could be a user interface as only one interface should be open at any point in time to avoid overlapping information, this is almost identical to the function of a state machine. Only one state can be active at any point in time and can only switch between states if it meets a certain condition, like state machines it's required for an input to be pressed for the interface to change, converting each interface into a state and putting them into a state machine would make for a very effective user interface that wouldn't run into any overlapping issues.
# References
   * 
