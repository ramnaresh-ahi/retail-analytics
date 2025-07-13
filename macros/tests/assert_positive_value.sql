
{% test assert_positive_value(model, column_name, min_value=0) %}
  SELECT *
  FROM {{ model }}
  WHERE {{ column_name }} < {{ min_value }} OR {{ column_name }} IS NULL
{% endtest %}
