web: bundle exec puma -t 2:20 -p $PORT
resque: env TERM_CHILD=1 COUNT=20 QUEUE=default bundle exec rake resque:workers
