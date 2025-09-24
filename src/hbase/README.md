# HBase on Docker

NOTE: The docker-compose files don't work with the latest versions of Windows 10, due to an isue documented on [Stack Overflow](https://stackoverflow.com/questions/54181219/windows-cant-bind-to-port-above-49690).

A reasonable fix is to follow the details there and edit the range of dynamic ports available to Win10.  Changing the ports naively in the Docker Compose files don't Just Work, likely due to assumptions made in the containers

## Overview

* ./up.bash - Start the database
* ./down.bash - Shutdown and remove the database.
* ./save.bash TABLE DIRECTORY - Save table to a new directory.
    * To delete a saved directory: `sudo rm -rf DIRECTORY`
* ./load.bash TABLE DIRECTORY - Load directory into table.
* ./shell.bash - Connect to the database.
* ./shell.bash SCRIPT - Uses the shell to run scripts/SCRIPT in the database.
* ./bash.bash - Start a Bash shell in the database server (it's OS).

## volumes/

* This directory is created when you start the database.
* Services store files here.
* This directory will not be saved in your repository.
* If you need to delete it: `sudo rm -rf volumes`

## scripts/

* Use to run a JRuby script in the database shell.
* Drop a JRuby script in this directory.
* Then run `./shell.bash SCRIPT` to run the SCRIPT.

## Code from Textbook

JRuby scripts that appear in the text are available for download from the
text's website. I cannot distribute it as per their license, but you may
download it since you purchased the text.

See "Source Code" at <https://pragprog.com/titles/pwrdata/seven-databases-in-seven-weeks-second-edition/>