# HalfSavage

Welcome, developers! Pretty standard development setup here. It's fast, proven, and stays the fuck out of your way as much as possible.

New to this? We'll help! This setup does take a small time investment to learn, particularly if you've only done "cowboy coding" in the past. Booty or one of the other devs will be happy to walk you through everything over a screen share session. We promise that after a small initial time investment things will feel pretty awesome.

If you run into issues this guide doesn't cover: please update the guide with your experiences. Help out the next person.

## Git Strategy: GitHub Flow

There are an infinite number of ways to use git. We use [GitHub Flow](https://guides.github.com/introduction/flow/) which basically has two simple rules:

1. **"Everything in the `master` branch is deployable."** Once we have continuous deployment, commits to `master` will trigger a test run followed by a deployment if the tests pass. Your fellow developers will also assume that everything in `master` is golden; they will pull `master` and assume that it's a known-good version of the code. Don't break `master`.

2. **Everything else goes into a `feature/foo` or `hotfix/foo` branch.** Create as many of these as you want. There's no functional difference between `feature` and `hotfix` branches; they're just naming conventions. Once you think one of these is ready, create a pull request on GitHub.


## Local Development Setup: Thirty Minutes or Less!

**OSX or Linux:** Sweet. You're good to go.

**Windows:** Install a friendly Linux VM using VirtualBox or HyperV and work from there. Native Rails development on Windows is a fucking nightmare. Ruby and Rails themselves work pretty well but lag months or years behind the latest versions, which means you will not be able to integrate with the rest of the team.

The rest of this guide will assume you're running OSX or Linux.

### Installing Ruby

The best way to install Ruby is with [rbenv](https://github.com/sstephenson/rbenv). It will allow you to install multiple versions of Ruby. HalfSavage includes a `.ruby-version` file that will tell `rbenv` to switch to the correct
Ruby version automatically.

[rvm](https://rvm.io/) should work too. However, most people prefer the simplicity and ease of `rbenv`.

### Installing Homebrew, Postgres and Redis (OSX)

[Postgres](http://www.postgresql.org/): free, awesome, programmer-friendly relational database. Compared to MySQL, it offers many more programmer-friendly features. Google "Postgres vs. MySQL" if you want to know more. Since MySQL was acquired by Oracle, Postgres has really been picking up steam. The only downside is that there's not a great GUI client available for Postgres. Oh well.

[Redis](http://redis.io/): blazing fast temporary storage. We use this for caching and storing session state. Redis powers much of Reddit and a bunch of other stuff too.

**OSX:** Simply install the [Homebrew](http://brew.sh/) package manager. Once that's done, `brew install postgres; brew install redis` is all you need. For convenience, you may wish to install [LaunchRocket](https://github.com/jimbojsb/launchrocket) which allows you to easily stop/start launchd services like postgres and redis that you install via Homebrew.

**Linux:** It's probably really easy. I suppose. Probably? Who wants to write the guide?

### Port Forwarding & Working With OmniAuth (Optional; Do This Later)

*Skip this part of the guide if you're just getting started. It's only needed if you're working on our OmniAuth implementation. If you skip this step, you can run Half Savage locally and create local HS accounts by signing up manually.*

HalfSavage incorporates OmniAuth. This lets users seamlessly create HalfSavage accounts if they already have an account on Twitter, Facebook, Imgur, etc. This is awesome for our members.

The only catch is that to do this while running HalfSavage locally you need to temporarily fool your web browser into believing that "https://HalfSavage.com" is a website that's running *on your laptop* on port 80.

1. Edit your `hosts` file. On OSX, it's located at `/private/etc/hosts`. Add the following line.You'll be adding and removing this line a lot. You will probably want to create an alias in your `.bash_profile` to open your hosts file for editing.

        127.0.0.1 halfsavage.com

2. Forward incoming requests on port 80 to port 31337 because that's the port that HalfSavage uses when you launch it with `rails s`. **OSX Yosemite:** Follow [this guide](http://salferrarello.com/mac-pfctl-port-forwarding/).

 - Note about port forwarding: We could simply run Rails on 80 instead of 31337 but I ran into permission issues trying to do this. Only a superuser can bind to port 80; but if I do `sudo rails s -p 80` then it can't find my Ruby environment. If somebody has a better solution, let me know.
