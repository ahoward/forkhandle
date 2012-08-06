NAME
----
  forkhandle

SYNOPSIS
--------

  connection = ForkHandle.get(:db_connection){ Db.connect(config) }


DESCRIPTION
-----------

  managing connection across forks and threads is tricky.  most libraries use
  and icky idiom that requires each and every client to configure it's own
  forking logic, something like

    MyLameLib.after_fork do

      # close handles you should close

    end

  many libs also do not provide you with per-thread connection, making MT a
  manual process.

  a teeny bit of code can solve both.  the concept is simple:

  maintain a table of connections scoped by process id and thread id.  any
  miss will trigger auto-scrubbing the table, but only connections from
  another process (we've been forked) will be closed.  this gives

  * per thread connections

  * per process connections

  * auto-matic cleanup after a fork

