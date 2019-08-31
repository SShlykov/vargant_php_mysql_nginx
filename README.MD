# Hey! This is my basic template of php mysql nginx vagrant machine

This is my vagrant machine template that I created to quickly and easily deploy a nginx server and work with php project and mysql.

## Istallation

I tried to make this server as easy to understand as possible, so I decided to combine all the settings for this server in one common init.sh file.

But I had a problem with the configuration file for the nginx server - the variables in the sh script are denoted in the same way as in the "default file" (\$var), so it is located separately as "example.default" file.

> Virtualbox and Vagrant should be installed in your system.

So you might need to:

- clone this repo

```sh
git clone https://github.com/SShlykov/vargant_php_mysql_nginx.git ./project
```

- use "exmple.default" or create your own configuration for nginx server and move it to ./src/default

```sh
mv example.default ./src/default
```

- You could change at the beginning of init.sh file:
  - php version (by default 7.3)
  - database name (by default project)
  - database username (by default admin)
  - password (by default secret)

As a result, you should have the following file structure:

```
  project_folder
  │   README.md
  │   Vagrantfile
  │   init.sh
  └─── src
  │     │   index.php
  │     │   default
```

So now u can just write:

```sh
Vagrant up
```

After installation process

> You should just open http://localhost:3000/ 

> ./src is your working folder
