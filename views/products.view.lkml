# The name of this view in Looker is "Products"
view: products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Brand" in Explore.

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  measure: test_9 {
    type: number
    sql: (${retail_price}-${rank}) * 10000 ;;
    value_format_name: decimal_0
  }

  measure: test_10 {
    type: number
    sql: coalesce(${retail_price}/nullif(${retail_price},0),0) ;;
    value_format_name: percent_1
    html: {% if value == 0 %}
          {% elsif value <> 0 %} {{rendered_value}}
          {% endif %};;
  }

  measure: test_11 {
    type: number
    sql: coalesce((${retail_price}-${rank})*10000,0) ;;
    value_format_name: decimal_0
    html: {% if value == 0 %}
          {% elsif value <> 0 %} {{rendered_value}}
          {% endif %};;

  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_retail_price {
    type: number
    sql: sum(${retail_price}) ;;
    value_format: "[>=1000000]$#,##0.00,,\"M\"; [>=100]$0.00,\"K\"; $0.0"
    html:
    {% if value > 0 %} {{rendered_value}}
    {% elsif value <= 0 %} (${{value | divided_by: 1000000 | round: 2}}M)
    {% endif %};;}
  measure: average_retail_price {
    type: number
    sql: ${retail_price} ;;
    value_format: "[>=1000000]$#,##0.00,,\"M\"; [>=100]$0.00,\"K\"; $0.0"
    }

  measure: rate {
    type: number
    sql: ${total_retail_price}/nullif(${average_retail_price},0) ;;
    value_format_name: percent_2
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
    value_format_name: percent_1
  }

  measure: test_12 {
    type: number
    sql: sum(${retail_price}) ;;
    value_format: "[>=1000000]$#,##0.00,,\"M\"; [>=100]$0.00,\"K\"; $0.0"
  }

  measure: test_13 {
    type: number
    sql: (${retail_price}) ;;
    value_format: "[>=1000000]0.00,,\"M\"; [>=1000]0.00,\"K\"; 0"
  }

  measure: test_14 {
    type: number
     sql: (${retail_price}- ${total_retail_price} )/ nullif(${total_retail_price},0) ;;
    value_format_name: percent_1
    }
  measure: test_15 {
    type: number
    sql: (${rank}- ${total_retail_price} )/ nullif(${total_retail_price},0) ;;
    value_format_name: percent_1
  }

  measure: test_16 {
    type: number
    sql: (${rank}- ${average_retail_price} )/ nullif(${average_retail_price},0) ;;
    value_format_name: percent_1
  }

  measure: test_22 {
    type: number
    sql: (${id}- ${count}) / nullif(${count},0) ;;
    value_format_name: percent_1
  }

  measure: test_23 {
    type: number
    sql: (${id}- ${test_15}) / nullif(${test_15},0) ;;
    value_format_name: percent_1
  }
}
