# iTunr
This is a small utility script I wrote to solve a mindless problem - my iTunes library had accumulated several hundred missing file links. Astonishingly, there was no free, easy solution available on the internets to solve this problem. I looked through the available ruby gems, and there were a few duplicate removers, but nothing that could help me with this issue.

### Usage
```bash
bundle install && ruby itunr.rb
```

## Features
- Cleans out dead links to songs that are missing from your hard drive
- Creates backups of all files it modifies, just in case

## TODO:
- Incorporate features
    - [awesome OS X patch] to keep iTunes from monopolizing control over the pause/play media key (*remember to give due credit + linkback ofc*)
- Add tests
- Make this into a gem
- Add rake tasks
	- install as binary executable
	- output status of duplicates
- ADD CLI capability
- YAML config
- export log in JSON (and output YAML by default)


[awesome OS X patch]:http://www.thebitguru.com/projects/iTunesPatch