def charge
  puts "\n"
  if $mongol_lances > 0
    puts "  You decided to charge the enemy head on, with your Lancers up front leading the way."

  else
    puts "  Your Mongol Horesmen charge the enemy head on with the bows drawn and ready."
  end
if $mongol_horsemen > 0
  puts """
  Your horeseman use the advantage of their mighty bows and stike the enemy foot soldiers
  before they even reach the enemy lines.
  Your horseman each release 3 or 4 arrows before they reach the enemy lines
  The initial vollies kill #{($mongol_horsemen * 0.7).to_i} enemy soldiers, leaving #{$enemy_soldiers - ($mongol_horsemen * 0.7).to_i} still on the field of battle.
  Now that your Mongol Warriors have reached the enemy, how will they fare ?

  """
end
#calculates the remaining enemy soldiers
  $enemy_soldiers = $enemy_soldiers - ($mongol_horsemen * 0.7).to_i

#armies initially collide
  if $enemy_archers / 4 < $mongol_lances
    puts "  As your army reaches the enemy lines their archers let loose, taking down #{$enemy_archers / 4} of your Lancers "
    $mongol_lances -= ($enemy_archers / 4)
  elsif $mongol_lances == 0
    horseman_lost = ($mongol_lances - ($enemy_archers / 4)).abs

    puts "  You lost #{horseman_lost} horseman as they came into range of the enemy archers."
    $mongol_horsemen -= horseman_lost
    $mongol_lances = 0
  else
    if $mongol_horsemen > 0
      horseman_lost = ($mongol_lances - ($enemy_archers / 4)).to_i
    else
       horseman_lost = 0
     end
    puts """
  The enemy had too many archers and you lost all #{$mongol_lances} of your
  Lancers and #{horseman_lost} horseman before they were even close enough
  to engage the enemy in close combat.
    """
    $mongol_horsemen -= horseman_lost.to_i
    $mongol_lances = 0
  end

if $mongol_horsemen > 0
  puts """
  Your army took heavy damages:
  You have #{$mongol_lances} lancers left and #{$mongol_horsemen} horseman left.
  The enemy has #{$enemy_soldiers} foot soldiers and #{$enemy_archers} archers remaining.

  Do you still have a large enough force to secure victory.
  This is your last chance to retreat before the two forces collide head on.
  Enter 'Retreat' now if you wish to pull back and re group,
  otherwise hit 'enter' to see how your remaining forces will fare.
  """
  print "> "
  response = $stdin.gets.chomp
  if response == 'Retreat'|| response == 'retreat'
    horseman_lost = $mongol_horsemen *0.15
    $mongol_horsemen -= horseman_lost.to_i
    puts """
    In your haste to pull back you lost a further #{horseman_lost.to_i} horseman.
    You didn't think they would just let you leave unscathed did you ?
    """
    remaining
  end
  else
    defeat
end

# if you have any lancers remaining
if $mongol_lances > 0
  puts "  Your lancers crash through the enemy front lines, each taking 8 enemy down before they too fall"
  if $enemy_soldiers >  $mongol_lances * 8
    $enemy_soldiers = $enemy_soldiers -  $mongol_lances * 8
    $mongol_lances = 0

  else
    $mongol_lances -= ($enemy_soldiers/8)
    archers_lost = $enemy_soldiers - ($mongol_lances * 8)
    $enemy_archers -= archers_lost
    $enemy_soldiers = 0
  end
end

#after lances attack (if any) your horseman go in
puts """
  Your reamining Mongol Horsemen reach the enemy lines.
  Your horsemen have an immediate advantage over the enemy foot soldiers.
  Each of your #{$mongol_horsemen} mongol horseman takes 3 enemy soldiers with him before he falls.
"""
#calculate remaining soldiers left on each side after initial meeting.
   soldiers_left = $enemy_soldiers
   $enemy_soldiers -= ($mongol_horsemen * 3)
   $mongol_horsemen -= (soldiers_left / 3)

  if $mongol_horsemen <= 0
    puts """
    Unfortunately the enemy was just too many.
    Perhaps next time you should try weakening the enemy before charging head first at them.
    Well there would be a next time if you weren't dead !!!
    """

    defeat
  end

if $enemy_soldiers > 0
puts "  leaving #{$enemy_soldiers} enemy soldiers left"
else
  puts """
  You manage to wipe out all the enemies remaining foot soldiers.
  and have #{mongols_total} Mongol Warriors left to finish off the enemy

  The enemies last line of defence is the #{$enemy_archers} archers standing between you and victory.
  """
  $enemy_soldiers = 0
end

puts "  Retreat is no longer an option, your remaining forces push on attacking the enemy wildly."
puts "\n"
archers_defeated = $mongol_horsemen * 5
$mongol_horsemen -= $enemy_soldiers / 3
$mongol_horsemen -= $enemy_archers / 5
$enemy_archers -= archers_defeated

if $mongol_horsemen >= 0
  victory
else
  puts """
  Your remaining forces would have made Genghis proud but there was just too many of them.
  After all you warriors fell:
  """
  if $enemy_soldiers > 0
    puts """
  The enemy still has #{$enemy_soldiers} foot soldiers and #{$enemy_archers} archers.

  The great Khan will have to come finish what you started himself."""
    defeat
  else
      puts """
  The enemy still has #{$enemy_archers} archers left.

  The great Khan will have to come finish what you started himself.
      """
      defeat
    end
  end

  remaining
end
