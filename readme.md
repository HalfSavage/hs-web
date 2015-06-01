# HalfSavage

You are still half savage. But there is hope. Welcome, developers!

## Local Development Setup: Thirty Minutes or Less!

You'll want to be running Linux or OSX.

If you're running Windows: install a friendly Linux VM using VirtualBox or HyperV and work from there.

Rails development on Windows is a fucking nightmare. The general story is that Ruby and Rails themselves work pretty well but you'll often be stuck on a non-current version. More importantly, gems -- particularly those with native extensions -- tend to be problematic. You will spend more time fighting with them than actually being productive.

The rest of this guid will assume you're running OSX or Linux.

### Installing Ruby

The best way to install Ruby is with [rbenv](https://github.com/sstephenson/rbenv). It will allow you to install multiple versions of Ruby. HalfSavage includes a `.ruby-version` file that will tell `rbenv` to switch to the correct
Ruby version automatically.

[rvm](https://rvm.io/) should work too. However, most people prefer the simplicity and ease of `rbenv` these days.

### Installing Homebrew, Postgres and Redis (OSX)

[Postgres](http://www.postgresql.org/) is a free, awesome, relational database. Compared to MySQL, it offers many more programmer-friendly features. Since MySQL was acquired by Oracle, Postgres has really been picking up steam. The only downside is that there's not a great GUI client available for it. Oh well.

[Redis](http://redis.io/) is fast as shit. We use this for caching and storing session state. Redis powers much of Reddit and a bunch of other stuff too.

**OSX:** Simply install the [Homebrew](http://brew.sh/) package manager. Once that's done, `brew install postgres; brew install redis` is all you need.

**Linux:** It's probably really easy. I suppose. Probably? Who wants to write the guide?

### Port Forwarding & Working With OmniAuth (Optional)

*Skip this part of the guide if you're just getting started, or if you're not using OmniAuth to create accounts in your local development environment. You can always do this part later.*

HalfSavage incorporates OmniAuth. This lets users seamlessly create HalfSavage accounts if they already have an account on Twitter, Facebook, Imgur, etc. This is awesome for our members.

The only catch is that to do this while running HalfSavage locally you need to temporarily fool your web browser into believing that "https://HalfSavage.com" is a website that's running *on your laptop* on port 80.

1. Edit your `hosts` file. On OSX, it's located at `/private/etc/hosts`. Add the following line.You'll be adding and removing this line a lot. You will probably want to create an alias in your `.bash_profile` to open your hosts file for editing.

        127.0.0.1 halfsavage.com

 2. Forward incoming requests on port 80 to port 31337 because that's the port that HalfSavage uses when you launch it with `rails s`. **OSX Yosemite:** Follow [this guide](http://salferrarello.com/mac-pfctl-port-forwarding/).

Note about port forwarding: We could simply run Rails on 80 instead of 31337 but I ran into permission issues trying to do this. Only a superuser can bind to port 80; but if I do `sudo rails s -p 80` then it can't find my Ruby environment. If somebody has a better solution, let me know.
