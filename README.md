dogbrigade-v2
=============

dogbrigade version 2 opensource awesomeness

# Database
## Initial Database Setup with Postgres

    psql template1
    create role dogbrigade with createdb login password '[pwd]';
    \q
    rake db:create:all
    rake db:migrate
    
## database.yml

    development:
        adapter: postgresql
        encoding: unicode
        database: dogbrigade_development
        pool: 5
        username: uid
        password: pwd
        host: localhost

    # Warning: The database defined as "test" will be erased and
    # re-generated from your development database when you run "rake".
    # Do not set this db to the same as development or production.
    test: &test
        adapter: postgresql
        encoding: unicode
        database: dogbrigade_test
        pool: 5
        username: uid
        password: pwd
        host: localhost

    production:
        adapter: postgresql
        encoding: unicode
        database: dogbrigade_production
        pool: 20
        username: uid
        password: pwd
        host: localhost

    cucumber:
        <<: *test