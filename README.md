## Summary
This script will **trash** all your CloudApp drops regardless of type or public/private visibility, so proceed with caution. It's handy for when you've built up a lot of cruft when sharing drops. This will give you a nice clean slate to work with.

There doesn't seem to be a way to empty the trash from the [CloudApp API](https://github.com/cloudapp/api/blob/master/README.md), but you can empty the trash from the site. Still, this will get your non-trash folders in nice, clean slate though.

![A Clean Slate](http://dankim.org/cloudapp-cleaner/clean-slate.png)

## Setup

1. `gem install httparty`
1. Change the @username and @password values to your's.

## Run
1. From the command line, run `ruby cloudapp_cleaner.rb`