```ruby
def format_duration(duration_in_seconds)
  hours = duration_in_seconds / 3600
  minutes = (duration_in_seconds % 3600) / 60
  formatted_duration = "#{hours} hours, #{minutes} minutes"
  formatted_duration
end

# Example usage:
duration_in_seconds = 18630
formatted_duration = format_duration(duration_in_seconds)
puts formatted_duration
```
