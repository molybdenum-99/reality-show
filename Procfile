web: bundle exec puma -t 2:20 -p $PORT
resque: env TERM_CHILD=1 COUNT=7 QUEUE=default VVERBOSE=1 bundle exec rake resque:workers
