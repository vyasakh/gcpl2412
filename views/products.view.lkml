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




  dimension: show_my_dimension_filter2 {

    html: {% if _filters['category'] != "NULL" %} {{_filters['category']}}

            {% else %} no filter value {% endif %};;

    sql: 'this does nothing' ;;

  }





  dimension: filtersuggestion_test {
    sql: 1 ;;

    html:  {% if order_items.take_filter._rendered_value  > 0 %}
          {{ order_items.take_filter._rendered_value}}
        {% elsif order_items.take_filter._rendered_value < 0 %}
          {{ order_items.take_filter._rendered_value }}
        {% else %}
          "Null"
        {% endif %} ;;
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

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_retail_price {
    type: sum
    sql: ${retail_price} ;;  }
  measure: average_retail_price {
    type: average
    sql: ${retail_price} ;;  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
