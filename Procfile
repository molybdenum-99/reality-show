web: bundle exec puma -t 1:20 -p $PORT
resque: env TERM_CHILD=1 COUNT=7 QUEUE=default VERBOSE=1 bundle exec rake resque:workers
