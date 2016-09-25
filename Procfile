web: bundle exec puma -t 2:20 -p $PORT
resque: env TERM_CHILD=1 COUNT=5 QUEUE=default bundle exec rake resque:workers
