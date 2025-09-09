> [!CAUTION]
> The only official places to download Wavestrap are this GitHub repository and [999msllc.pages.dev](https://999msllc.pages.dev/wavestrap). Any other websites offering downloads or claiming to be us are not controlled by us.

<p align="center">
    <img src="https://github.com/999MS-LLC/WaveStrap/raw/main/Images/wavestrap-dark.png#gh-dark-mode-only" width="420">
    <img src="https://github.com/999MS-LLC/WaveStrap/raw/main/Images/wavestrap-light.png#gh-light-mode-only" width="420">
</p>

<div align="center">

[![License][shield-repo-license]][repo-license]
[![GitHub Workflow Status][shield-repo-workflow]][repo-actions]
[![Downloads][shield-repo-releases]][repo-releases]
[![Version][shield-repo-latest]][repo-latest]
[![Discord][shield-discord-server]][discord-invite]

</div>

----

Wavestrap is a third-party replacement for the standard Roblox bootstrapper, providing additional useful features and improvements.

Running into a problem or need help with something? [Check out the Wiki](https://github.com/999MS-LLC/WaveStrap/wiki). If you can't find anything, or would like to suggest something, please [submit an issue](https://github.com/999MS-LLC/WaveStrap/issues).

Wavestrap is only supported for PCs running Windows.

## Frequently Asked Questions

**Q: Is this malware?**

**A:** No. The source code here is viewable to all, and it'd be impossible for us to slip anything malicious into the downloads without anyone noticing. Just be sure you're downloading it from an official source. The only two official sources are this GitHub repository and [999msllc.pages.dev](https://999msllc.pages.dev).

**Q: Can using this get me banned?**

**A:** No, it shouldn't. Wavestrap doesn't interact with the Roblox client in the same way that exploits do. [Read more about that here.](https://github.com/999MS-LLC/WaveStrap/wiki/Why-it's-not-reasonably-possible-for-you-to-be-banned-by-Wavetrap)

## Features

- Hassle-free Discord Rich Presence to let your friends know what you're playing at a glance
- Simple support for modding of content files for customizability (death sound, mouse cursor, etc)
- See where your server is geographically located (courtesy of [ipinfo.io](https://ipinfo.io))
- Ability to configure graphics fidelity and UI experience

## Installing
Download the [latest release of Wavestrap](https://github.com/999MS-LLC/WaveStrap/releases/latest), and run it. Configure your preferences if needed, and install. That's about it!

You will also need the [.NET 6 Desktop Runtime](https://aka.ms/dotnet-core-applaunch?missing_runtime=true&arch=x64&rid=win11-x64&apphost_version=6.0.16&gui=true). If you don't already have it installed, you'll be prompted to install it anyway. Be sure to install Wavestrap after you've installed this.

It's not unlikely that Windows Smartscreen will show a popup when you run Wavestrap for the first time. This happens because it's an unknown program, not because it's actually detected as being malicious. To dismiss it, just click on "More info" and then "Run anyway".

Once installed, Wavestrap is added to your Start Menu, where you can access the menu and reconfigure your preferences if needed.

## Code

Wavestrap uses the [WPF UI](https://github.com/lepoco/wpfui) library for the user interface design. We currently use and maintain our own fork of WPF UI at [999MS-LLC/wpfui](https://github.com/999MS-LLC/wpfui).


[shield-repo-license]:  https://img.shields.io/github/license/999MS-LLC/Wavestrap
[shield-repo-workflow]: https://img.shields.io/github/actions/workflow/status/999MS-LLC/Wavestrap/ci-release.yml?branch=main&label=builds
[shield-repo-releases]: https://img.shields.io/github/downloads/999MS-LLC/Wavestrap/latest/total?color=981bfe
[shield-repo-latest]:   https://img.shields.io/github/v/release/999MS-LLC/Wavestrap?color=7a39fb

[shield-discord-server]: https://img.shields.io/discord/1330274257996873779?logo=discord&logoColor=white&label=discord&color=4d3dff

[repo-license]:  https://github.com/999MS-LLC/WaveStrap/blob/main/LICENSE
[repo-actions]:  https://github.com/999MS-LLC/WaveStrap/actions
[repo-releases]: https://github.com/999MS-LLC/WaveStrap/releases
[repo-latest]:   https://github.com/999MS-LLC/WaveStrap/releases/latest

[discord-invite]:  https://discord.gg/ZsHEZS8Zta

## Code signing policy

Thanks to [SignPath.io](https://signpath.io/) for providing a free code signing service, and the [SignPath Foundation](https://signpath.org/) for providing the free code signing certificate.
