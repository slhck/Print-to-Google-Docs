# Print to Google Docs

This is a Print Plugin for OS X that takes the printed file and uploads it to Google Docs. The file is shown in Google Docs after it is uploaded.
This means you can upload anything to Google Docs from every Print dialog in OS X.

## Prerequisites

First, install `pip`.

    easy_install pip

Then, install the [Google Command Line tools][2] over it.

    pip install googlecl

### Authorize GoogleCL

The Google Command line tools allow you to access Google services over the command line. To do that, you have to first authorize your computer to access Google.

Enter the following

    google docs list

It will prompt you for your username first. After you've entered it, you'll get to your Google account page. Click "Grant Access" and then copy the bold verification code that looks something like `x9rS2qPNUb` from the website.

Paste it into the Terminal again and hit enter. Now GoogleCL is authorized and will list all your Google Docs. Neat.

## Installation

This repository offers two workflows. One opens the file after uploading, the other one doesn't. Copy the `workflow` file you want to `/Users/username/Library/PDF Services`. You're done.

The workflow is now available in the PDF menu when you print anything. From anywhere. You can now "print" to Google Docs from your Mac.

![Print to Google Docs][7]

## Known Issues

I tested this on OS X 10.6.7. The scripts in the workflows are written to use GoogleCL from `/usr/local/bin/google`. If that path changes, you might want to manually adjust the scripts.

## Acknowledgements

The script to upload the file was originally written by Daniel Simmons, [dan at dans.im](dan@dans.im). I made some minor adjustments.

  [2]: http://code.google.com/p/googlecl
  [7]: http://i.stack.imgur.com/qNkIh.png