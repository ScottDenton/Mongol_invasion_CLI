def harass
  puts """
  You decided to harass the enemy with your archers
  A wise move considering the speed and range advantage your horesman have over the enemy.
  """

  if $mongol_lances > 0
    puts """  Keeping your Lancers safe, you send your horseman towards the enemy,
  with orders to stay just out of range or their archers.
    """
  else
    puts '  You send your horseman towards the enemy, keeping just out of range or their archers.'
  end

  # Work out how many horseman killed based on how many times strategy used.
  if $harass_counter <= 1
    soldiers_killed = ($mongol_horsemen / 5).to_i
    horseman_killed = ($mongol_horsemen * 0.01).to_i
  elsif $harass_counter == 2
    soldiers_killed = ($mongol_horsemen / 10).to_i
    horseman_killed = ($mongol_horsemen * 0.07).to_i
  elsif $harass_counter == 3
    soldiers_killed = ($mongol_horsemen / 15).to_i
    horseman_killed = ($enemy_archers/ 2).to_i
    $mongol_horsemen -= horseman_killed
    puts """
  Did you not think they would figure out what you were doing sooner or later.
  This time they were ready for you. Your horseman were engulfed
  and you lost #{horseman_killed} horeseman.
    """

     remaining
  end

  puts """
  You horseman release a wave of arrows straight at the enemy
  foot soldiers, killing #{soldiers_killed}."""
  $enemy_soldiers -= soldiers_killed


  puts """
  The enemy got a few lucky shots off killing #{horseman_killed} of your
  horseman as some got a little too close.  """

  $mongol_horsemen -= horseman_killed

  $harass_counter += 1

  remaining
end
