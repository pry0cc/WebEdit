# WebEdit

Do you run a server? Do you use SSH or some other CLI to manage it? 

Have you ever tried to edit a file over SSH, but a bad connection means nano/vim/vi LAGS OUT and its excruciating. 

Say goodbye to editing files with SSH & Nano/Vim/Vi; Say hello to WebEdit!

WebEdit is a HTML5 text editor, that you run on your server. You'll see how it works.

Its like, python -m http.server and a text editor had a baby, and their baby grew new limbs. 

#### Installation...

Firstly clone the repo
`git clone https://github.com/pry0cc/WebEdit.git`

Secondly install any pre-requisites
`bundle install`

Thirdly actually install it!
`sudo ./install.sh`

#### Usage

`webedit file.txt`

This command will generate a unique link, that you can use to edit the file. It will start up a webserver, let you edit the file, save it, and then when you close webedit, the webserver shuts down. 

#### Screenshots
![Editing Vagrant File](https://i.imgur.com/EQu5r8c.png)
![Syntax selection is fancy!](https://i.imgur.com/KdmQCXL.png)

#### Mentions 
[Ace.JS](http://ace.c9.io/) for the editor frontend, Sinatra for as the base, [Keypress](https://dmauro.github.io/Keypress/) for shortcuts.


