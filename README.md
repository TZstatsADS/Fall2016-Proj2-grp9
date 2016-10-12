# Project: Open Data NYC - an RShiny app development project
### [Project Description](doc/project2_desc.md)

Term: Fall 2016

+ Team #9
+ Projec title: All 4 Citi Bike users
+ Team members
	+ Jingjing Feng
	+ Yu Qin
	+ Hyung joon Choi 
	+ Kaisheng Wang
	
+ Project summary: There are more than 100,000 citi bike users in New York City. Our project focuses on using citi bike data and Google map API to recommend nearby bike stations and routes for users. We also provide station information based on different time. The datasets we used were collected from citi bike official website from 6am to 10pm. Users can select the time when they would like to use the citi bikes and they can see the avaibility of all the bike stations. After inputting addresses of the start point and the desitination, the users will see three recommended avalable stations around the start point and destination. Unlike google map or citi bike station map, we only show three nearest stations around the start location and destination on the map, and let users to make their own choices. In this way, the users have greater flexibility of the choices and pick an optimal station to use bikes.Besides, we also showed a heatmap of bike stations, which shows location informations of citi bike stations.

In this second project of Applied Data Science, we will carry out *Exploratory Data Analysis and Visualization* via a shiny app on a topic about open data released from the [New York City open data portal](https://nycopendata.socrata.com/). See [Project 2 Description](doc/project2_desc.md) for more details.  

![screenshot](doc/screenshot2.png)

The **learning goals** for this project is 
- business intelligence for data science
- systems development/design life cycle
- shiny app/shiny server
	
**Contribution statement**: ([default](doc/a_note_on_contributions.md)) All team members approve our work presented in this GitHub repository including this contributions statement. At the beginning, All team members analyzed functions and packages to be used. Jingjing Feng, Yu Qin and Hyung joon Choi discussed the method to recommend stations and routes. Yu Qin scaped the data from cibi bike official website. Kaisheng Wang cleaned and manipulated the data. During the progress, everyone contributed to R code. Hyung joon Choi and Yu Qin were mainly responsible for the calculation in server.R. Jingjing was mainly responsible for the 'heapmap' part and designed the first ui.R. Kaisheng Wang was the presenter.In a word,the code was modified several times based on team work and discussion. All team members contributed to the GitHub repository and prepared the presentation. By collaborating with each other, all team members contributed equally to whole project. 
Here is our shinyapp url: https://krozzzz.shinyapps.io/Final_vision/

Following [suggestions](http://nicercode.github.io/blog/2013-04-05-projects/) by [RICH FITZJOHN](http://nicercode.github.io/about/#Team) (@richfitz). This folder is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.

