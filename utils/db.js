import knex from "knex";

export default knex({
  client: 'pg',
  connection: {
    host: 'aws-1-ap-southeast-2.pooler.supabase.com',
    port: 5432,
    user: 'postgres.zkrixezilogglwqdxool',
    password: 'qCtXU5K11VRXMk3i',
    database: 'postgres',
  },
  pool: { min: 0, max: 10 },
});
