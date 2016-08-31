### WebEdit

Do you run a server? Do you use SSH or some other CLI to manage it? 

Have you ever tried to edit a file over SSH, but a bad connection means nano/vim/vi LAGS OUT and its excruciating. 

Say goodbye to editing files with SSH & Nano/Vim/Vi; Say hello to WebEdit!

WebEdit is a HTML5 text editor, that you run on your server. (Still in development).

## Usage

`webedit file.txt`

This command will generate a unique link, that you can use to edit the file. It will start up a webserver, let you edit the file, save it, and then when you close webedit, the webserver shuts down. 
