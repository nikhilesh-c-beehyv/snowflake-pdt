connection: "snowflake_pdt"

# include all the views
include: "/views/**/*.view"

datagroup: flake_pdt_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: flake_pdt_default_datagroup

explore: account {}

explore: acquiredaccount__c {}

explore: feeditem {}

explore: opportunity {
  join: account {
    type: left_outer
    sql_on: ${opportunity.account_id} = ${account.id} ;;
    relationship: many_to_one
  }
}

explore: task {
  join: account {
    type: left_outer
    sql_on: ${task.account_id} = ${account.id} ;;
    relationship: many_to_one
  }
}
