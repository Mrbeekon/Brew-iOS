<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
***
***
***
*** To avoid retyping too much info. Do a search and replace for the following:
*** github_username, repo_name, twitter_handle, email, project_title, project_description
-->

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h1 align="center">Bubbler</h1>
</p>



<!-- TABLE OF CONTENTS -->

  <details open="open"><summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This system was developed to allow users to track their homebrew gravity readings in a convinient place. Each brew has a set of gravity readings that can be added to and displayed as a graph. Additionally, the ABV is automatically calculated as you add readings. You can also set reminders to take a reading at a set time every day.

The app is designed to work on iPhone (X, XS, 11, 11 Pro, 11 Pro Max, 12, 12 Pro, 12 Pro Max, 12 Mini and SE 2nd gen).


### Built With

* []()SwiftUI
* []()Core Data
* []()SwiftUICharts by AppPear

Also, below are the links to tutorials and code used.

* []()SVG to Path converter: https://quassummanus.github.io/SVG-to-SwiftUI/
* []()Working with core data: https://blckbirds.com/post/core-data-and-swiftui/
* []()Expand and collapse brew item: https://www.vadimbulavin.com/expand-and-collapse-list-with-animation-in-swiftui/
* []()Local notifications: https://www.hackingwithswift.com/books/ios-swiftui/scheduling-local-notifications
* []()Lock to portrait: https://stackoverflow.com/questions/28938660/how-to-lock-orientation-of-one-view-controller-to-portrait-mode-only-in-swift
* []()Grpah library: https://github.com/AppPear/ChartView


<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Installation

1. Clone the repo
2. Install the dependancy (https://github.com/AppPear/ChartView) if needed


<!-- USAGE EXAMPLES -->
## Usage
Run the project in XCode and build to device or simulator.

1. Initially you will be take to the main screen, the brew list that contains the brew items
2. To add the first item press add
3. Enter a name press add
4. To delete the brew swipe to the left to show the delete button
5. To see more info tap the brew item
6. To set a reminder tap alerts
7. select a time and date and start the notification
8. Then tap set
9. To remove the reminder tap alerts
10. toggle start notificatio to off and tap set
11. To add a reaiding tap readings
12. Then press add
13. Enter the reading details and tap add
14. To delete a reading swipe to the left to show the delete button
16. Once you have enough readings (more than 2) the graph will start to function
17. Navigate back to the brews screen
18. There you will see the data displayed on the graph
19. To see the values tap and hold on the graph and move your finger left and right
20. To change the brew name go to the readings page and tap the name
21. Enter the new name and tap Change

That covers the Bubblers functionality, you will see that the ABV will be update with every new reading.


