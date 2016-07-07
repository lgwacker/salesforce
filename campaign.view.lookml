- view: _campaign
  sql_table_name: salesforce.sf_campaign
  fields:
  
# dimensions #

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: actual_cost
    type: number
    sql: ${TABLE}.actualcost

  - dimension: amount_all_opportunities
    type: number
    sql: ${TABLE}.amountallopportunities

  - dimension: amount_won_opportunities
    type: number
    sql: ${TABLE}.amountwonopportunities

  - dimension: created_by_id
    type: string
    hidden: true
    sql: ${TABLE}.createdbyid

  - dimension_group: created
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.createddate

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension_group: end
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.enddate

  - dimension: is_active
    type: yesno
    sql: ${TABLE}.isactive

  - dimension: is_deleted
    type: yesno
    sql: ${TABLE}.isdeleted

  - dimension: last_modified_by_id
    type: string
    sql: ${TABLE}.lastmodifiedbyid

  - dimension_group: last_modified
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.lastmodifieddate

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: number_of_contacts
    type: number
    sql: ${TABLE}.numberofcontacts

  - dimension: number_of_converted_leads
    type: number
    sql: ${TABLE}.numberofconvertedleads

  - dimension: number_of_leads
    type: number
    sql: ${TABLE}.numberofleads

  - dimension: number_of_opportunities
    type: number
    sql: ${TABLE}.numberofopportunities

  - dimension: number_of_responses
    type: number
    sql: ${TABLE}.numberofresponses

  - dimension: number_of_won_opportunities
    type: number
    sql: ${TABLE}.numberofwonopportunities

  - dimension: number_sent
    type: number
    hidden: true
    sql: ${TABLE}.numbersent

  - dimension: owner_id
    type: string
    sql: ${TABLE}.ownerid

  - dimension_group: start
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.startdate

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension_group: system_modstamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.systemmodstamp

  - dimension: type
    type: string
    sql: ${TABLE}.type
    
# measures #

  - measure: count
    type: count
    filters:
      campaign.is_deleted: 0
    drill_fields: [id, name]
    
  - measure: total_number_of_converted_leads
    type: sum
    sql: ${TABLE}.number_of_converted_leads
    filters:
      campaign.is_deleted: 0

  - measure: total_number_of_leads
    type: sum
    sql: ${TABLE}.number_of_leads
    filters:
      campaign.is_deleted: 0

  - measure: total_number_of_opportunities
    type: sum
    sql: ${TABLE}.number_of_opportunities
    filters:
      campaign.is_deleted: 0

  - measure: total_number_of_responses
    type: sum
    sql: ${TABLE}.number_of_responses
    filters:
      campaign.is_deleted: 0

  - measure: total_number_of_won_opportunities
    type: sum
    sql: ${TABLE}.number_of_won_opportunities
    filters:
      campaign.is_deleted: 0

  - measure: total_number_sent
    type: sum
    hidden: true
    sql: ${TABLE}.number_sent
    filters:
      campaign.is_deleted: 0

  - measure: total_actual_cost
    type: sum
    sql: ${TABLE}.actual_cost
    filters:
      campaign.is_deleted: 0

  - measure: total_amount_all_opportunities
    type: sum
    sql: ${TABLE}.amount_all_opportunities
    filters:
      campaign.is_deleted: 0

  - measure: total_amount_won_opportunities
    type: sum
    sql: ${TABLE}.amount_won_opportunities
    filters:
      campaign.is_deleted: 0