```markdown
# Password Cracking Tools on Ubuntu

## John the Ripper

### Installation
```sh
sudo apt-get update
sudo apt-get install john
```

### Usage Example
```sh
john --wordlist=/usr/share/wordlists/rockyou.txt /home/sysadmin/shadow_copy
john --show /home/sysadmin/shadow_copy
```

## Hashcat

### Installation
```sh
sudo apt-get update
sudo apt-get install hashcat
```

### Usage Example
```sh
hashcat -m 0 -a 0 -o cracked.txt hashes.txt /usr/share/wordlists/rockyou.txt
```

## Hydra

### Installation
```sh
sudo apt-get update
sudo apt-get install hydra
```

### Usage Example
```sh
hydra -l username -P /usr/share/wordlists/rockyou.txt ftp://target_ip
```

## Cain and Abel

### Note
Cain and Abel is a Windows-based tool and does not run natively on Ubuntu. You can use Wine to run it on Ubuntu.

### Installation with Wine
```sh
sudo apt-get update
sudo apt-get install wine
wget http://www.oxid.it/downloads/cainsetup.exe
wine cainsetup.exe
```

## Aircrack-ng

### Installation
```sh
sudo apt-get update
sudo apt-get install aircrack-ng
```

### Usage Example
```sh
airmon-ng start wlan0
airodump-ng wlan0mon
aireplay-ng -0 0 -a <BSSID> wlan0mon
aircrack-ng -w /usr/share/wordlists/rockyou.txt -b <BSSID> capture_file.cap
```

## Ophcrack

### Installation
```sh
sudo apt-get update
sudo apt-get install ophcrack
```

### Usage Example
```sh
ophcrack -g
```

## RainbowCrack

### Installation
```sh
sudo apt-get update
sudo apt-get install rainbowcrack
```

### Usage Example
```sh
rtgen md5 loweralpha-numeric 1 7 0 2400 8000000 all
rtsort .
rcrack . -h <hash>
```


This document provides installation and usage examples for popular password cracking tools on an Ubuntu server. Use these commands to practice and learn how to use each tool effectively.

```markdown
# Password Cracking Tools on Ubuntu

## Aircrack-ng

### What is Aircrack-ng?
Aircrack-ng is a tool that helps you test the security of Wi-Fi networks. It can help you see if your Wi-Fi password is strong or if someone else can guess it easily.

### Installation
First, we need to install Aircrack-ng on our Ubuntu computer. Open the terminal and type the following commands:

```sh
sudo apt-get update
sudo apt-get install aircrack-ng
```

### How to Use Aircrack-ng

1. **Start Monitoring Mode**
   - We need to put our Wi-Fi adapter into "monitor mode" so it can listen to all the Wi-Fi traffic around us.
   - Type this command in the terminal:
     ```sh
     sudo airmon-ng start wlan0
     ```
   - `wlan0` is the name of the Wi-Fi adapter. It might be different on your computer. You can check the name by typing `ifconfig`.

2. **Capture Wi-Fi Traffic**
   - Now, we need to capture the Wi-Fi traffic. This means we will listen to all the data being sent over the Wi-Fi network.
   - Type this command in the terminal:
     ```sh
     sudo airodump-ng wlan0mon
     ```
   - `wlan0mon` is the name of the Wi-Fi adapter in monitor mode. This command will show a list of all the Wi-Fi networks around you.

3. **Select a Target Network**
   - Find the Wi-Fi network you want to test and note down its BSSID (a unique identifier for the network) and channel number.
   - Type this command in the terminal to start capturing data from the target network:
     ```sh
     sudo airodump-ng --bssid <BSSID> --channel <channel> -w capture wlan0mon
     ```
   - Replace `<BSSID>` with the BSSID of the target network and `<channel>` with the channel number.

4. **Deauthenticate a Client (Optional)**
   - To speed up the process, we can disconnect a device from the Wi-Fi network temporarily. This will force the device to reconnect and send the password again.
   - Type this command in the terminal:
     ```sh
     sudo aireplay-ng --deauth 0 -a <BSSID> wlan0mon
     ```
   - Replace `<BSSID>` with the BSSID of the target network.

5. **Crack the Password**
   - Once we have captured enough data, we can try to guess the Wi-Fi password using a wordlist (a list of possible passwords).
   - Type this command in the terminal:
     ```sh
     sudo aircrack-ng -w /usr/share/wordlists/rockyou.txt -b <BSSID> capture-01.cap
     ```
   - Replace `<BSSID>` with the BSSID of the target network. `capture-01.cap` is the file where the captured data is saved.

### Summary
Aircrack-ng is a powerful tool that helps you test the security of Wi-Fi networks. By following these steps, you can see if your Wi-Fi password is strong enough to keep others from guessing it. Remember, always use this tool responsibly and only on networks you have permission to test.

---

This document provides a detailed explanation of how to use Aircrack-ng, written in a way that a 5th grader can understand. Use these steps to practice and learn how to test Wi-Fi network security.
```