Git LOC tracker
===============
Git LOC tracker is a tool that counts **new**, **deleted** and **modified** Lines Of Code(LOC). The problem with git log and git diff is that it counts only added and removed lines in all git generated summaries and there is no way of knowing which line is really new, deleted, or modified so that is what Git LOC tracker does.

Usage
---------------
`gem install git_loc_tracker`  
and type `git-loc-tracker` in any git repo  
For help type `git-loc-tracker -h`  

Options
---------------
**-p, --path PATH** - Specify path to git repo root or sub directory. By default it is working directory from which you call the command.  
**-f, --from TIME** - Specify from date ex. '2012-10-29'  
**-t, --till TIME** - Specify till date ex. '2012-10-29 12:44:01'  
**-u, --author AUTHOR** - Specify git author  
**-s, --searchscope DIRS** - Specify search scope for which to gather statistics, default: 'app config extras db lib spec Gemfile'  
**-h, --help** - Show help  

Complex example
---------------
`git-loc-tracker --path=path/to/git/repo --from="1 week ago"  
--till="1 hour ago" --author="Janis" --searchscope="app/controllers app/models"`

Boring details
---------------
Gem uses standard `git log -p --word-diff` command with additional parameters described earlier and greps out only interesting lines. Then iterates through all found lines and checks the code in specific line to detect whether it's completely new, deleted or contains deleted or new parts and accordingly counts them as new, deleted, modified. 
