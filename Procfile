web: bundle exec puma -t 5:10 -p $PORT
worker: bundle exec sidekiq -r ./jobs/query_job.rb -c 10
