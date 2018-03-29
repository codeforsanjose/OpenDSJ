# Open Disclosure San Joséc

## About this project 
The goal of this web app is to help inform voters about local candidates' campaign contributions. 

Currently [Open Disclosure San José](http://www.codeforsanjose.com/opendisclosure/) outlines raw information about the 2014 San José California Mayoral race contributions. The app displays a heat map that visualizes the source of contributions--were candidates getting their donations from local donors, or donors external to San José (or the local neighborhood/district office they are running for?) This app was inspired by [opendisclosure.io.](http://www.opendisclosure.io)

## Why does this matter? 
Campaign finance information is public information. However, it's difficult to access the data and to make sense of the data. 
While you can access the data for [2018 San José, California elections here](https://www.southtechhosting.com/SanJoseCity/CampaignDocsWebRetrieval/), in order to access data about any election prior to 2018, requests must be made in person to the San José City Clerk's Office. The data for any election prior to 2018 will only be made available via CD-rom, in a PDF format.

Campaign finance data should be easy to access, and simple to understand. The goal of this project is to help voters make more informed decisions by understanding local candidates' campaign contributes:
1) Who donates to local candidates? 
2) Are donors from the same city that the election is held? Or are the donors from external neighborhoods/cities/states? 
3) Who are the major donors behind a local candidate? 
4) Are there common trends about a donor? Who else does the donor donate to? 

## How to Contribute 
We need help to get this web app to the next level with: 

1) An updated heat map data visualization with 2018 San José, California elections data. The heat map informs people if a candidate is accepting donations from more local donors or external donors.
- A user can filter a list of local elections by type of election
- A user can select an election and find a list of candidates
- A user can select the candidate's name, and find a heat map visualization of their donors
 
2)The website needs to include a new feature: a dashboard that displays a list of local 2018 elections (e.g. San José City Council District 9, various school boards) and addresses the following user stories:
- A user can filter that list by by type of election (city, school etc). 
- A user can select an election from the list, and view a list of candidates.
- A user can select a candidate's name, and view their list of donors, sorted by biggest to smaller donor (by amount donated). The user can filter the list of donors by amount donated, donor's city, donor's occupation, etc.
- A user clicks on the donor, and can see all the candidates they have donated to.

Resources: 
- [Free Software for Code for America brigades](http://brigade.codeforamerica.org/resources/software)
- Here is a link to download the [2018 San José, California election campaign finance data](https://www.southtechhosting.com/SanJoseCity/CampaignDocsWebRetrieval/)

We are now starting a new repository for the 2018 version of the [Open Disclosure project](https://github.com/codeforsanjose/OpenDSJ-2018). Join our discussion on [Slack](https://slackin-c4sj.herokuapp.com/): #open-disclosure channel. 

## Details about Version 1:
Process:
- We used publically available campaign finance data. 
- We use R scripts to clean the data and aggregate amounts by zip code.
- We built from scratch a CSS/JavaScript website
- and used a free map service, CartoDB.

Check out the data visualization demo [here](http://www.codeforsanjose.com/opendisclosure/)

Issues:
-This is only a one snapshot picture of the race --- doesn’t pull ongoing updated data -- we would like to display data over time
- CartoDB is not free and not a long-term option.
-We did not fully understand the campaign finance data and we could not find a key to explain what each of the data types mean.
