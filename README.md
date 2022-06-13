## Description
This is a Debian Live distribution for bypassing locks, an analogue of mofolinux, the difference is xfce4 instead of i3.
### Package List:
Base System: ~~Ubuntu~~ Debian Latest
~~MATE Desktop Environment~~
~~Alacritty~~
Bleachbit ✅
~~Castero~~
~~eCryptfs-utils~~
Element Desktop ✅
~~Freenet Installer~~
~~i3 Window Manager~~
~~i3ass~~
~~IPFS-Desktop~~
irssi ✅
Kodi Media Center ✅
**Lantern ✅**
NextCloud ✅
Newsboat ✅
OnionShare ✅
~~Openjdk-11-jre~~
Outline-Client ✅ and Manager
Proxychains ✅
**Psiphon-Tunnel-Core Linux Client ✅**
PulseEffects ✅
Python 2✅
Python 3✅
Signal Desktop ✅
Telegram-cli ✅
Telegram-desktop ✅
~~Telegram-purple~~
Thunderbird ✅
**Tor ✅**
Torsocks ✅
VeraCrypt ✅
~~Vivaldi~~ Firefox-ESR
W3M ✅
Zathura ✅
## How to use.
Lantern or Psyphon must be running.
Next, in the browser settings, specify the local proxy.
For Psiphon http://127.0.0.1:8081 or Socks://127.0.0.1:1081
In the case of Lantern, you will need to check the ports in the Lantern management console as they change.
## Step 1:
Installing docker, go to the [docker site](https://docs.docker.com/engine/install/) and follow the instructions.
**Warning user must be in the docker group:**
```sh
sudo usermod -aG docker user
```
## Step 2:
Cloning repository:
```sh
git clone https://github.com/roylind/psiphon_lantern_live.git
cd ./psiphon_lantern_live
chmod +x ./build_docker.sh
chmod +x ./build_Psiphon_Lantern_live.sh
```
## Step 3:
Build an image of the container docker:
```sh
./build_docker.sh
```
## Step 4:
Build live ClamAV:
```sh
./build_Psiphon_Lantern_live.sh
```
After answering a few questions and wait for the image assembly.
Ready image in the directory:
```
~/build_live_clamav
``` 
