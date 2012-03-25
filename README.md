# Print to Google Docs

This is a Print Plugin for OS X that takes the printed file and uploads it to Google Docs. The file is shown in Google Docs after it is uploaded.
This means you can upload anything to Google Docs from every Print dialog in OS X.

### Install gdata-python

Go to the [gdata-python download page][1] and download the latest version. Unpack the archive, and navigate to the folder in Terminal. Then enter:

    python setup.py install

You're done.

### Install Google Command line tools

First, install `pip`.

    easy_install pip

Then, install the [Google Command Line tools][3] over it.

    pip install googlecl

Now, GoogleCL [has a bug][4] occurring when uploading to Google Docs. We need to manually fix the following file (replace `2.6` with the actual version you have):

    /Library/Python/2.6/site-packages/googlecl-0.9.13-py2.6.egg/googlecl/docs/client.py

With the contents from this file from the GoogleCL repo (click the "raw" link):

> [http://code.google.com/p/googlecl/source/browse/trunk/src/googlecl/docs/client.py?r=589][5]


### Authorize GoogleCL

The Google Command line tools allow you to access Google services over the command line. To do that, you have to first authorize your computer to access Google.

Enter the following

    google docs list

It will prompt you for your username first. After you've entered it, you'll get to your Google account page. Click "Grant Access" and then copy the bold verification code that looks something like `x9rS2qPNUb` from the website.

Paste it into the Terminal again and hit enter. Now GoogleCL is authorized and will list all your Google Docs. Neat.

## Installation

This repository offers a workflow. Copy the `workflow` file you want to `/Users/username/Library/PDF Services`. You're done.

The workflow is now available in the PDF menu when you print anything. From anywhere. You can now "print" to Google Docs from your Mac.

## Known Issues

I tested this on OS X 10.6.7. The scripts in the workflows are written to use GoogleCL from `/usr/local/bin/google`. If that path changes, you might want to manually adjust the scripts.

## Acknowledgements

The script to upload the file was originally written by Daniel Simmons, [dan at dans.im](dan@dans.im). I made some minor adjustments.


[1]: http://code.google.com/p/gdata-python-client/downloads/list
[2]: https://github.com/mxcl/homebrew
[3]: http://code.google.com/p/googlecl
[4]: http://code.google.com/p/googlecl/issues/detail?id=463
[5]: http://code.google.com/p/googlecl/source/browse/trunk/src/googlecl/docs/client.py?r=589