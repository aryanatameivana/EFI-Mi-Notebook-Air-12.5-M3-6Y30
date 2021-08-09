# EFI Mi Notebook Air 12.5 M3 6Y30
[![macOS](https://img.shields.io/badge/macOS-11.4-blue)](https://developer.apple.com/documentation/macos-release-notes)
[![OpenCore](https://img.shields.io/badge/OpenCore-0.7.2-green)](https://github.com/acidanthera/OpenCorePkg)
</br>
**EFI (Extensible Firmware Interface) system partition for Mi Notebook Air 12.5 M3 6Y30**

| Component          | Specifications                                                                                            |
| :----------------- | :-------------------------------------------------------------------------------------------------------- |
| Processor          | Intel Core m3-6Y30 2 x 0.9 - 2.2 GHz **Skylake**                                                          |
| Graphics           | Integrated Intel HD Graphics 515, NVIDIA GeForce MX150                                                    |
| Memory             | 44GB 2133MHz DDR4                                                                                         |
| Display            | 12.5-inch, full HD 1920 x 1080 resolution display                                                         |
| Storage            | 128GB SATA3 M2 SSD                                                                                        |
| WLAN               | Intel(R) Dual Band Wireless-AC 8260.                                                                      |
| Bluetooth          | Broadcom Bluetooth                                                                                        |
| Audio support      | Audio Realtek ALC235 with audio/microphone jack                                                           |
| Input              | Keyboard, Synaptics TouchPad                                                                              |

## Status
<details>  
<summary><strong>MacOS Supported</strong></summary>
</br>
 
- [x] BigSur 11.4 (Tested)
</details>  

<details>  
<summary><strong>What's working</strong></summary>
</br>
 
- [x] Sleep/Wake
- [x] Trackpad
- [x] Keyboard
- [x] iService (AppStore Download, Facetime, iMessage)
- [x] Intel Graphics
- [x] Audio
- [x] HDMI Video and Audio
- [x] USB 3.0
- [x] SATA SSD's
- [x] Battery Management
- [x] Brightness keys
- [x] Built-in camera
- [x] Built-in mic
- [x] Bluetooth
- [x] Native CPU Power Management
- [x] WiFi (Currently use [HeliPort](https://openintelwireless.github.io/HeliPort/) due Instant Hotspot from iPhone can be recognized but may likely fail to connect)

</details>

## Post Installations
<details>  
<summary><strong>Not properly sleep (Drain much battery on sleep)</strong></summary>
<br>
1.Open terminal
<br>
2.Enter commands below one by one
<br>
Settings for AC:

```
sudo pmset -c standby 1
sudo pmset -c hibernatemode 0
```

Setting for battery:

```
sudo pmset -b standby 1
sudo pmset -b standbydelayhigh 900
sudo pmset -b standbydelaylow 60
sudo pmset -b hibernatemode 25
sudo pmset -b highstandbythreshold 70
```

Settings for all:

```
sudo pmset -a acwake 0
sudo pmset -a lidwake 1
sudo pmset -a powernap 0
```

To restore default system settings run `pmset restoredefaults` command
 <br>
To test sleep mode run `pmset sleepnow` command

<details>  
<summary><strong>Commands description</strong></summary>
   
`acwake` - wake the machine when power source (AC/battery) is changed (value = 0/1)

`lidwake` - wake the machine when the laptop lid (or clamshell) is opened (value = 0/1)

`powernap` - enable/disable Power Nap on supported machines (value = 0/1)

`standbydelayhigh` and `standbydelaylow` specify the delay, in seconds,
before writing the hibernation image to disk and powering off memory for Standby.
standbydelayhigh is used when the remaining battery capacity is above `highstandbythreshold`(has a default value of 50 percent),
and standbydelaylow is used when the remaining battery capacity is below highstandbythreshold.

hibernatemode supports values of 0, 3, or 25.

To disable hibernation, set hibernatemode to 0.

`hibernatemode` = 0 by default on desktops. The system will not back memory up to persistent storage. The system must wake from the contents of memory; the system will lose context on power loss.

`hibernatemode` = 3 by default on portables. The system will store a copy of memory to persistent storage (the disk), and will power memory during sleep. The system will wake from memory, unless a power loss forces it to restore from hibernate image.

`hibernatemode` = 25 is only settable via pmset. The system will store a copy of memory to persistent storage (the disk), and will remove power to memory. The system will restore from disk image. If you want "hibernation" - slower sleeps, slower wakes, and better battery life, you should use this setting.<br><br>
[pmset Descriptions Source](https://www.dssw.co.uk/reference/pmset.html)

</details>
 </details>
 

## Credits
- [dortania](https://github.com/dortania) for [OpenCore instalation guide](https://dortania.github.io/OpenCore-Install-Guide/)
- [simprecicchiani](https://github.com/simprecicchiani) for [ThinkPad T460s macOS OpenCore](https://github.com/simprecicchiani/ThinkPad-T460s-macOS-OpenCore)
