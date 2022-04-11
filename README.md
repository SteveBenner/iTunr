# iTunr
This is a small utility script I wrote to solve a simple yet ***ridiculous*** iTunes issue. The problem was that I had accumulated several hundred missing file links--songs that appear as normal in the UI, but fail to play due to a missing file. Astonishingly, my internet search failed to turn up a single free & effective solution. I looked through the available ruby gems, and there were a few duplicate removers, but nothing that could help me with this issue in particular. Enter iTunr!

### Usage
Right now the script only does one thing; just run it.

    bundle install && ruby itunr.rb


## Features
- Removes all songs from your iTunes Library that are dead links (missing original file)
- Creates backups of any files modified on your system, just in case

## TODO:
- New features
    - [awesome OS X patch] to keep iTunes from monopolizing control over the pause/play media key (*remember to give due credit + linkback ofc*)
- Add tests
- Make this into a gem?
- Add CLI capability
- Add YAML config
- Logging


[awesome OS X patch]:http://www.thebitguru.com/projects/iTunesPatch