namespace :refresh do

  desc "Replace the local development database with the contents of the production database"
  task :development_database do
    @timestamp = Time.now.to_i

    on roles(:db) do

      within shared_path do
        @db = YAML::load(ERB.new(IO.read(File.join("config", "database.yml"))).result)['production']
        @env = YAML::load(ERB.new(IO.read(File.join("config", 'application.yml'))).result)['production']
      end

      @filename = "#{@db['database']}_#{@timestamp}.sql"
      folder = "db_backup"
      execute :mkdir, "-p", folder

      within folder do
        execute :mysqldump, "-u #{@db['username']} --password=#{@env['harmanpro_database_password']} #{@db['database']} > #{@filename}"
        curr = capture(:pwd)
        download! "#{curr}/#{@filename}", "./#{@filename}"
        execute :rm, @filename
      end
    end

    run_locally do
      with rails_env: :development do
        db = YAML::load(ERB.new(IO.read(File.join(File.dirname(__FILE__), "../../../config", "database.yml"))).result)
        prd_db = db['production']
        dev_db = db['development']
        filename = "#{prd_db['database']}_#{@timestamp}.sql"

        rake 'db:drop'
        rake 'db:create'

        execute :mysql, "-u #{dev_db['username']} #{dev_db['database']} < ./#{filename}"
        execute :rm, filename
      end
    end
  end
end
