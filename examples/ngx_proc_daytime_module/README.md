# Name #

**ngx\_proc\_daytime\_module**

Example for proc module of Tengine

# Examples #

    processes {
        process daytime {
            daytime on;
            listen 8888;
        }
    }


## listen ##

Syntax: **listen** `port`

Default: `none`

Context: `process`
