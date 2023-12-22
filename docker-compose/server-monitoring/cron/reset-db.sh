#!/bin/sh

export TZ="Asia/Jakarta"
current_date=$(date +"%d-%m-%Y %H:%M:%S %Z")
echo "reset db -- $current_date"


# Execute SQL command to truncate the task table
# psql ${DATABASE_TYPE}://${DATABASE_USERNAME}:${DATABASE_PASSWORD}@${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_NAME} -c "TRUNCATE TABLE public.user cascade;"

# Anonymous code block
ANONYMOUS_CODE_BLOCK=$(cat <<EOF
DO \$\$
DECLARE
  row RECORD;
  table_names VARCHAR;
BEGIN
  FOR row IN SELECT table_name
    FROM information_schema.tables
    WHERE table_type='BASE TABLE'
    AND table_schema='public'
    AND table_name NOT IN ('migrations')
  LOOP
    table_names := row.table_name;
    EXECUTE format('TRUNCATE TABLE %I CASCADE;', table_names);
    RAISE NOTICE 'Table "%" truncated', table_names;
  END LOOP;
END;
\$\$;
EOF
)

# Execute the anonymous code block and then truncate the tables except migrations
psql ${DATABASE_TYPE}://${DATABASE_USERNAME}:${DATABASE_PASSWORD}@${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_NAME} <<EOF
${ANONYMOUS_CODE_BLOCK}
EOF
