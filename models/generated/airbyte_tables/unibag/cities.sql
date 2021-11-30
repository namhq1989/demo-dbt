{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'hash'}],
    unique_key = '_airbyte_ab_id',
    schema = "unibag",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('cities_ab3') }}
select
    _id AS id,
    code,
    {{ adapter.quote('name') }},
    slug,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_cities_hashid
from {{ ref('cities_ab3') }}
-- cities from {{ source('unibag', '_airbyte_raw_cities') }}
where 1 = 1

