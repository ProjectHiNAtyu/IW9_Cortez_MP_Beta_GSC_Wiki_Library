# IW9_Cortez_MP_Beta_GSC_Wiki_Library

[ About ]


These functions and implementations have been reconstructed and utilized based on the code by Mr. Sku, who conceived, developed, and released the GSC Injection process in Project Donetsk.

I express my heartfelt respect and gratitude to Mr. Sku-111, who devised and implemented this injection process.
- Official GSCBIN Dumper
- Custom GSC Injector


I also used Mr. xensik's gsc-tool to decompile GSCBIN, extract source code, and create custom GSC.

Thank you Mr. Xensik for always providing cutting edge CoD GSC analysis.
- GSC Compiler
- GSC Decompiler


I would also like to express my sincere gratitude to Mr. ATE47, who has released features such as the asset pool and has diligently researched and disclosed information about new CoD GSC titles such as MWIII and BO6.
- Asset Pool


Thank you as always, I support you all.


----------


[ Support environment ]


- Game title : Call of Duty Modern Warfare II
- Game code : IW9 / CoD19 / MW22 / MWII / MW2022 / CoD:MWII / Cortez
- Game release year : 2022
- Build version : Public Beta ( Version )
- Platform : PC ( BattleNet )
- Application environment : PC ( Windows 10 , Windows 11 )
- Product type: GSC Loader ( GSC Injector / GSC Dumper / GSC Mod Menu / Real Time Editing )
- Custom injector support : MP ( Multiplayer )
- GSC Mod Menu title : Project HiNAtyu
- GSC creator : HiNAtyu
- Mod Menu support : MP ( Multiplayer )


----------


[ Video ]


If you’d like to learn more about this GSC Mod Menu, please check out the YouTube video below.

coming soon...


----------


[ Implemented ]


The following items are currently completed:

- Official GSCBIN Dump Data
- Official GSC Source Decompiled Data
- GSC Loader ( Custom GSC Injector / GSCBIN Dumper / GSC Mod Menu / Real Time Editing ) * unfinished...
- gsc-tool * unfinished...
- GSC Mod Menu - Project HiNAtyu * unfinished...


----------


< GSC Loader - How to use >


For detailed operation instructions, You can read it by pressing various buttons after launching the Loader application.
Or read the included readme.txt


----------


< gsc-tool >


This app is a command-line tool operated via cmd.

HiNAtyu does not accept questions regarding the tool.

Please direct your questions to xensik.

https://github.com/xensik/gsc-tool


and Please use my own tweaked version of gsc-tool for this build.

Regarding the GSC compiler and decompiler functions, many of the instructions are incorrect because we have not analyzed all of the hash tokens.

Since I play MWII at Retail, I don't intend to make many modifications to the gsc-tool for the Beta build.

If you want to seriously create GSC for the Beta build, please modify the gsc-tool's hash tokens on your own


----------


[ Caution ]


< Generic >

* This software was created for research, development, and educational purposes.
* This software was created as part of technical verification and educational learning of C++ programming.
* This software was created as software for creating and testing original mods for programming learning purposes such as coding scripts in C++.
* This software was not created for the purpose of increasing the number of cheaters (users who use cheats), hackers, or trolls.
* This software was created on the premise that it will only work in private spaces (private matches, offline builds, offline modes), not in environments with an unspecified number of users such as public matches.
* The operation of this software has been verified only by me, the developer, in the above private space, and is mainly for personal purposes, fun, and play.
* The functions performed by this software do not affect the current server (network with general users).
* It is not recommended to use this software in public places other than the above private spaces, so please be sure to run it in a private space.
* If you use this software in an environment or for purposes other than those recommended, I, the developer, will not be held responsible for any problems or risks that may occur, or serious measures such as account bans. Please use at your own risk.
* If you are banned from Call of Duty (account ban) that may occur when using this software, I, the developer, will not be held responsible for any such measures. All responsibility is the user's responsibility.


* This software is designed to work with the game "Call of Duty Modern Warfare II (IW9 / CoD19 / MW22 / MWII / MW2022 / CoD:MWII / Cortez)".
* This software is designed to work with "PC BatteNet Version Beta Build" of the above game.
* The custom GSC Injector function of this software is designed to work with the "MP" of the above games.
* When using this software, it is recommended to use the offline build (offline mode) of the above game or in private matches.
* If an offline build (offline mode) of the above game exists, we will not explain how to obtain or apply the offline state, please look into it yourself.
* This software is not intended to be used with game titles, environments, or platforms other than the above games.
* If you use this software in an environment other than the recommended environment or for purposes other than the recommended purpose, I, the developer, will not be held responsible in any case, and you do so at your own risk.


* This software is provided in Loader format, and you will need an account to log in to use it.\
* If you need an account to use this software, please contact me, the developer, via Discord or Twitter DM.
* This software may be detected as a virus and deleted, so be sure to disable Windows Security's "real-time protection" before using it.
* To prevent this software from being detected as a virus and deleted, we recommend that you specify this app's folder in the virus check exclusion folder from Windows Security.
* This software works with Windows 10 and 11. It does not work with other OS.
* To make this software work with Windows 11, please repair the system using the included .bat file.
* This software may not work properly if OneDrive is enabled, so disable OneDrive if a problem occurs.
* This software may reset GSC due to shader compilation that occurs when the game is started for the first time, even if a notification that GSC Inject was successful is displayed.
* If the custom GSC is not applied after the above shader compilation is displayed, restart the game after the shader compilation is complete and try injecting again.


* If this software is used online with the retail version of the above games, it will be detected by Ricoshet and you will be banned, so please use it at your own risk.
* After using this software, be sure to restart your PC before playing other games.
* If you shut down your PC or unplug and plug the power cord, the system will not be initialized, increasing the risk of being banned, so be sure to restart your PC.


----------


[ Promotion ]


- Discord : hinatapoko
- Twitter 1 (Main) : https://x.com/KonataGIF
- Twitter 2 (Sub) : https://x.com/H1NAtyu
- YouTube : HiNAtyu Studio ( https://www.youtube.com/@hinatyuproject/featured )


I’d be very happy if you could follow, subscribe, like, or comment on my various SNS accounts. 

If you like my work, I'd be happy if you could sponsor or donate.

This will help facilitate the development of new features and fixes.


- Ko-fi : https://ko-fi.com/hinatyustudio
- BTC : 32J66dfWi9dqqWHS2RYR9rFCUNBL88vgUR
- ETH : 0xaE5D5b3e8E865B2bA676a24eF41d5f4CBD315978.


----------


[ Custom GSC ( gsc-tool ) ]


< dump >

* A "GSCBIN" folder containing the gscbin for iw9 needs to be placed in the same directory hierarchy as gsc-tool_iw9beta.exe.

gsc-tool_iw9beta -m decomp -g iw9 -s pc GSCBIN


< compile >

* A folder containing the custom GSC source for iw9 needs to be placed in the same directory hierarchy as gsc-tool_iw9beta.exe.

gsc-tool_iw9beta -m comp -g iw9 -s pc YourCustomGSCFolder


You are free to modify the GSC Mod Menu source code I released.

However, I will not provide explanations on how to modify GSC, coding methods, or basic coding knowledge.

Please figure it out on your own.

Currently, the following GSC functions and tokens can be used.

All other commands are almost always incorrect and may cause a crash.
