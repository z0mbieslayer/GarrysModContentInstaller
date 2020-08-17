# GarrysModContentInstaller
My extremely terrible and inefficient code
## About
Okay so basically what this thing does is it will install any Valve game's content for gmod should you not have that game in your library and installed. It also installs addons from the steam workshop and extracts them for you.

It's an exe because I want an icon.

This thing took me months to make (granted I took like a month off out of frustration) and it's still garbage and inefficient, so I hope to fix these things in the future. I kind of just published this now to gte it out there and off of my pc.
## Features:<br>
-Installs content from the following games: CS:S, HL2 EP1, HL2 EP2, TF2, L4D2, Portal, and Portal 2.<br>
-Installs addons from steam workshop directly to addons directory (extracts the addon as well).<br>
-Able to detect whether it should use the ISteamRemoteStorage interface or the ISteamUGC interface for downloading addons.<br>
-Has many useless PING commands that I need to clean up.
## Features I want to add:<br>
-Ability to run from a separate drive as your Garry's Mod installation
## Dependencies:<br>
This thing uses some other programs so I thought I should list them here:<br>
-[JQ](https://stedolan.github.io/jq/) for parsing the json from the the steam api.<br>
-[SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD) for downloading the addons that require using the ISteamUGC interface.<br>
-[7Zip](https://www.7-zip.org/) for helping extract the addons.
