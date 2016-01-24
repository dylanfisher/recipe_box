namespace :recipebox do
  desc "Download a Postgres database from Heroku and slurp it into local, replacing it."
    # See: https://devcenter.heroku.com/articles/heroku-postgres-import-export
    task :import_database_from_heroku => :environment do
      db = Rails.application.config.database_configuration[Rails.env]
      user = db['username']
      database = db['database']
      puts "Please run:"
      puts "heroku pg:backups capture; curl -o latest.dump `heroku pg:backups public-url`; pg_restore --verbose --clean --no-acl --no-owner -h localhost#{if user then " -U #{user}" end} -d #{database} latest.dump; rm latest.dump"
    end
    task :download_and_slurp_psql_database => :import_database_from_heroku
end
