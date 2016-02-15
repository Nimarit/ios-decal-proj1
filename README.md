# Project 1: To-Do List App

## Due
Thursday, February 25 at 11:59 PM

## Description 
In Project 1, you will build your own Utility app - a To-Do List.  As you would
expect, the app is simple. You are able to view your existing tasks, mark a task
as completed, delete a task, add a new task, and view stats about how many tasks
you have completed in 24 hours. As long as your application conforms every one
of our required criteria (see below), you can add whatever additional features,
views, UI, etc. you want. 

## Instructions
1. Fork the assignment's repository from (https://github.com/iosdecal).
2. Clone your forked repository to your local machine (the URL should contain
   YOUR_USERNAME/ios-decal-..).
3. Add an upstream remote that points to our original repository.
4. **Create a To-Do List app**
  * Required
    * General
      * Create a Universal app when you construct your Xcode project.
      * UI must scale to iPhone 6 and up and all iPads in both Portait and
      Landscape orientations.
        * Hint: Think Auto-Layout. For UILabels, autoshrink in the Attributes
        Inspector is also useful. 
    * To-Do List Table View
      * Ability to visually mark a task as completed
      * Tasks must automatically clear 24 hours after they are marked as
      completed
      * Ability to delete a task
      * Button to add a To-Do Item (goes to Add To-Do Item View)
      * Button to view Stats (goes to Daily Stats View)
    * Add To-Do Item View
      * Ability to add a task, where entering text and confirming returns to the
      To-Do List Table View, now updated with the new task added
      * Ability to cancel and return to To-Do List Table View without adding a
      task
    * Daily Stats View 
      * Displays the number of tasks completed in the past 24 hours
      * Ability to return to To-Do List Table View
  * Optional
    * Make the data persistent, so that when you close the application and
    reopen it, your preexisting tasks are restored.
5. Add, commit, and push your modified file(s) to your forked remote repository.
