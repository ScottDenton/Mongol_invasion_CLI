require "./flank.rb"
require "./charge.rb"
require "./harass.rb"

$mongol_horsemen = 45000
$mongol_lances = 10000
def mongols_total
  $total_mongols = ($mongol_horsemen + $mongol_lances).to_i
end

$enemy_soldiers = 150000
$enemy_archers = 50000
def enemy_total
  $total_enemy = ($enemy_soldiers + $enemy_archers).to_i
end

$harass_counter = 0
$flank_counter = 0


def welcome
  puts """

  Its the year 1215 AD and you are a General in the army of the great Genghis Khan.
  You have been tasked by Genghis himself to take the Mongol Horde and
  finally rid the Chin provence of Xia Xia of any remaining resistance.

  The Chin emperor has ammassed an army that vastly outnumbers your own.
  Now is your chance to impress Genghis and take your rightful place in the Mongol Empire.
  Are you ready to lead your tumans to victory
  """
  print "> "
  answer = $stdin.gets.chomp

  if answer.include?("y") || answer.include?("Y")
     opening_scene
  else
    failure
  end
end



def opening_scene
  puts """

  You currently have #{mongols_total} Mongolian Warriors under your command.
  Consisting of #{$mongol_horsemen} Mongolian Horseman, armed with a bow and sword.
  These exceptional bowman have a range advantage over all other archers.

  Assisting them are #{$mongol_lances} Lancers, armed with a large
  pike and a sword. Exceptional at breaking through the enemy ranks...
  if they can get close enough.

  The enemy army consists of #{$enemy_soldiers} foot soldiers and #{$enemy_archers} archers.
  With a total army of #{enemy_total}, you will be vastly outnumbered and will have to
  rely on clever tactics and skill if you are to survive.
"""
options
end

def options
  puts """
  With the enemy remaining in a defensive position,
  the decision on how to procede is entirely up to you.

  Do you
    - 'Charge' straight at the enemy
    - 'Harass' their lines with your archers
    - Try and attack their 'flank' and catch them off guard
    - Run away like a coward

  REMEMBER: The enemy aren't fools. The more you use the same strategy
  the quicker they will learn to counter it and the less effective it will be.
  """
  print "> "
  option = $stdin.gets.chomp

  if option.include?("charge") || option.include?("Charge")
    charge
  elsif option.include?("harass") || option.include?("Harass")
    harass
  elsif option.include?("flank") || option.include?("Flank")
    attack_flank
  else
    failure
  end
end

def remaining
  if $mongol_horsemen < 0
    $mongol_horsemen = 0
  end

  if $mongol_lances < 0
    $mongol_lances = 0
  end

  if $enemy_soldiers < 0
    $enemy_soldiers = 0
  end

  if $enemy_archers < 0
    $enemy_archers = 0
  end

  if enemy_total == 0
    victory
  end

  if mongols_total == 0
    defeat
  end


  puts """

  You now have:
  #{$mongol_horsemen} horeseman left.
  #{$mongol_lances} lancers left.

  The enemy has:
  #{$enemy_soldiers} foot soldiers left.
  #{$enemy_archers} archers left.

  Will you attack again ? (Y/N)
  """
  answer = $stdin.gets.chomp
  if answer == "Y" || answer =="y"
  options
  else
  failure
end
end


def victory
  puts """
  Congratulations, you have achieved victory.
  You have #{$mongol_horsemen} soldiers remaining.
  Will it be enough be enough to keep the great Khan happy.
  """
  exit(0)
end

def defeat
  puts """
  You lost all your men.
  The enemy still has #{enemy_total} soldiers on the field
  You have shamed Genghis and your entire nation... whats left of it.
  Fortunately for you, you died with your men.
  You lose.
  """
  exit(0)
end

def failure
  puts """
  Genghis was displeased by your disobeiance.
  As a result he killed you and your entire family to make an example.
  The crows and vulchurs will feast for days on your carcass.
"""
  exit(0)
end
