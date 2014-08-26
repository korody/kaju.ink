jQuery ->
  $('#job_client_name').autocomplete
    source: $('#job_client_name').data('autocomplete-source')
    messages:
        noResults: ''
        results: ->