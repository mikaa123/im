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

    whats -a my_ip -m "192.168.0.1"
    whats -a some_directory -m "/some/deep/directory"
    whats my_ip
    > 192.168.0.1
    whats some_directory
    > /some/deep/directory
    whats -l
    > my_ip
    > some_directory
    whats -d my_ip
    whats -l
    > some_directory
