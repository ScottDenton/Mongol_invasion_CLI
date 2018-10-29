$mongol_horsemen = 50000
$mongol_lances = 10000
$total_mongols = $mongol_horsemen + $mongol_lances

$enemy_soldiers = 150000
$enemy_archers = 50000
$enemy_total = $enemy_soldiers + $enemy_archers


def welcome
  puts "\n"
  puts "Its the year 1215 AD and you are a General in the army of the great Genghis Khan."
  puts "You have been tasked by Genghis himself to take the Mongol Horde and"
  puts "finally rid the Chin provence of Xia Xia of any remaining resistance."
  puts "\n"
  puts "The Chin emperor has ammassed an army that vastly outnumbers your own."
  puts "Now is your chance to impress Genghis and take your rightful place in the Mongol Empire."
  puts "Are you ready to lead your tumans to victory"
  print "> "
  answer = $stdin.gets.chomp

  if answer.include?("y") || answer.include?("Y")
     opening_scene
  else
    failure
  end
end



def opening_scene
  puts "\n"
  puts "You currently have #{$total_mongols} Mongolian Warriors under your command."
  puts "Consisting of #{$mongol_horsemen} Mongolian Horseman, armed with a bow and sword."
  puts "These exceptional bowman have a range advantage over all other archers."
  puts "Assisting them are #{$mongol_lances} Lancers, armed with a large"
  puts "pike and a sword. Exceptional at breaking through the enemy ranks..."
  puts "if they can get close enough."
  puts "\n"
  puts"""
The enemy consists of #{$enemy_soldiers} foot soldiers and #{$enemy_archers} archers.
With a total army of #{$enemy_total}, you will be vastly outnumbered and will have to
rely on clever tactics and skill if you are to survive.
"""
options
end

def options
  puts """
With the enemy remaining in a defensive position, it is up to you to initiate the first attack.

Do you
  - Charge straight at the enemy
  - Harass their lines with your archers
  - Try and attack their flank and catch them off guard
  - Run away like a coward
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
  puts "You now have: "
  puts "#{$mongol_horsemen} horeseman left."
  puts "#{$mongol_lances} lancers left."
  puts "\n"
  puts "The enemy has: "
  puts "#{$enemy_soldiers} foot soldiers left."
  puts "#{$enemy_archers} archers left."
  puts "\n"
  puts "Will you attack again ? (Y/N)"
  answer = $stdin.gets.chomp
  if answer == "Y"
  options
  else
  failure
end
end

def charge
  puts "\n"
  puts "You decided to charge the enemy head on, with your Lancers up front,"
  puts "followed by the remaining horesemen, with their bows drawn and ready."
  puts "\n"
  puts "Your horeseman use the advantage of their mighty bows and stike the enemy foot soldiers"
  puts "before they even reach the enemy lines."
    # each mongol horeseman kills one enemy soldier
  puts "The initial volley kills #{$mongol_lances} enemy soldiers, leaving #{$enemy_soldiers - $mongol_lances} still on the field of battle."
  puts "\n"
#calculates the remaining enemy soldiers
  $enemy_soldiers = $enemy_soldiers - $mongol_horsemen

if $enemy_archers / 4 < $mongol_lances
  puts "As your army reaches the enemy lines their archers let loose, taking down #{$enemy_archers / 4} of your Lancers "
  $mongol_lances = $mongol_lances - ($enemy_archers / 4)
else
  horseman_lost = ($mongol_lances - ($enemy_archers / 4)).abs
  puts "The enemy had too many archers and you lost all #{$mongol_lances} of your Lancers and #{horseman_lost} horesman."
  $mongol_horsemen -= horseman_lost
  $mongol_lances = 0
  puts "Horesman left = #{$mongol_horsemen}"
end

  # remaining
end

def harass
  puts "You decided to harass the enemy with your archers"
  remaining
end

def attack_flank
  puts "You attacked their flank"
  remaining
end

def failure
  puts "Genghis was displeased by your disobeiance."
  puts "As a result he killed you and your entire family to make an example."
  puts "The crows and vulchurs will feast for days on your carcass"
  exit(0)
end
