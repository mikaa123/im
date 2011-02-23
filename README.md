whats
=====
whats is a persistent hash to use as a memo in your terminal.

* * *
Installation
------------

    gem install whats

* * *
Usage
-----
Add an entry

    whats -a myIP -m "192.168.0.1"

Or

    whats -add myIP

Retrieve an entry

    whats myIP
    # 192.168.0.1

List all entries

    whats -l

Delete an entry

    whats -d myIP

Execute (for shell script entries)

    whats -a files -m "ls -l"
    whats -e files
