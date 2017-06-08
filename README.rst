.. image:: https://travis-ci.org/shoeb751/fileserve.svg?branch=master
   :target: https://travis-ci.org/shoeb751/fileserve

.. image:: https://coveralls.io/repos/github/shoeb751/fileserve/badge.svg?branch=master
   :target: https://coveralls.io/github/shoeb751/fileserve?branch=master

About
=====

The main purpose of this module is to make sure that we can rely on hieradata
even for adding standalone files and directories in Puppet. I am trying to implement the
functionality that the file resource gives using a modular approach. 

Work has just started on this with only use cases that are commonly used. A lot of
testcases remain.

Feel free to contribute and et this up in proper order.


Goals
=====

fileserve module should have the following functionality with proper test cases:

* Add files

  - From Content

  - From a source

    - puppet://

    - http://

  - From a template

    - single template

    - multiple templates combined

* Add directories

  - ensure present with no changes inside

  - copy all content from a specific directory in puppet

  - selective files based on a directory hierarchy

    - Only file from the first directory

    - Files from all directories merged (With preference to the higher
      directory)

In addition to this the following parameters also need to be exposed:

* mode

* owner

* group

Default permissions:

* files

  - read by everyone, write by owner and group, execute by no-one

* directory

  - read by everyone, write by owner and group, execute by everyone (Required
    to traverse in the directory and do writes even by the owner)
