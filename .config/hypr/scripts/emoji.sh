#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Rofi Emoticons. Not my own. Cant remember the source

# 1. Show rofi, extract the emoji, and copy to clipboard
selected=$(sed '1,/^#  DATA #$/d' "$0" | rofi -dmenu -p "emoji" | cut -d ' ' -f 1)

# 2. If an emoji was selected, copy and paste it
if [ -n "$selected" ]; then
    echo -n "$selected" | wl-copy
    # Simulate pressing Ctrl+Shift+V or Ctrl+V to paste into the active window
    sleep 0.1
    wtype -M ctrl -M shift -k v -m shift -m ctrl
    # Alternatively, if wtype doesn't work for you, use ydotool or wlr-randr equivalents:
    # ydotool key 29:1 42:1 47:1 47:0 42:0 29:0
fi

exit
#  DATA #
😀 grinning face happy
😃 big eyes laugh
😄 smiling eyes laugh
😁 beaming face smile
😆 squinting face lol
😅 sweat smile relief
🤣 rolling floor rofl
😂 tears joy cry
🙂 slightly smiling face
🙃 upside down silly
😉 winking face eye
😊 smiling eyes shy
😇 halo face angel
🥰 hearts face love
😍 heart eyes crush
🤩 star struck shocked
😘 blowing kiss love
😗 kissing face kiss
☺️ blushing face happy
😚 closed eyes kiss
😙 smiling eyes kiss
😋 savoring food yummy
😛 tongue out prank
🙂‍↔️ faceee uhu
🙂‍↕️ mogger facee
🫨 o may gahhh
🫩 sleepy face pro
😜 winking tongue prank
🤪 zany face crazy
😝 squinting tongue prank
🤑 money mouth rich
🤗 hugging face hug
🤭 hand mouth oops
🤫 shushing face quiet
🤔 thinking face hmmm
🤐 zipper mouth secret
🤨 raised eyebrow skeptical
😐 neutral face meh
😑 expressionless face blank
😶 no mouth silent
😏 smirking face smug
😒 unamused face bored
🙄 rolling eyes eyeroll
😬 grimacing face awkward
🤥 lying face pinocchio
😌 relieved face relaxed
😔 pensive face sad
😪 sleepy face nap
🤤 drooling face drool
😴 sleeping face zzz
😷 medical mask sick
🤒 thermometer face fever
🤕 head bandage hurt
🤢 nauseated face vomit
🤮 vomiting face puke
🤧 sneezing face allergy
🥵 hot face sweating
🥶 cold face freezing
🥴 woozy face tipsy
😵 dizzy face spent
🤯 exploding head shock
🤠 cowboy hat cowboy
🥳 partying face celebration
😎 sunglasses face cool
🤓 nerd face geek
🧐 monocle face fancy
😕 confused face huh
😟 worried face nervous
🙁 slightly frowning sad
☹️ frowning face upset
😮 open mouth wow
😯 hushed face quiet
😲 astonished face shocked
😳 flushed face blush
🥺 pleading face begging
😦 frowning mouth huh
😧 anguished face shocked
😨 fearful face scared
😰 anxious sweat nervous
😥 sad relieved phew
😢 crying face tears
😭 loudly crying cry
😱 screaming fear panic
😖 confounded face confused
😣 persevering face struggle
😞 disappointed face sad
😓 downcast sweat tired
😩 weary face upset
😫 tired face whine
🥱 yawning face sleepy
😤 steam nose mad
😡 pouting face angry
😠 angry face mad
🤬 cursing face swearing
🫪 distorted face
😈 smiling devil horns
👿 angry devil horns
💀 skull face dead
☠️ skull crossbones poison
💩 pile poo poop
🤡 clown face clown
👹 ogre mask demon
👺 goblin mask monster
👻 ghost face spooky
👽 alien face ufo
👾 alien monster game
🤖 robot face bot
😺 grinning cat happy
😸 smiling cat laugh
😹 tears cat rofl
😻 heart eyes cat
😼 wry smile cat
😽 kissing cat kiss
🙀 weary cat shocked
😿 crying cat sad
😾 pouting cat angry
🙈 see no evil
🙉 hear no evil
🙊 speak no evil
💋 kiss mark lips
💌 love letter envelope
💘 heart arrow cupid
💝 heart ribbon gift
💖 sparkling heart love
💗 growing heart affection
💓 beating heart pulse
💞 revolving hearts love
💕 two hearts pair
💟 heart decoration square
❣️ heart exclamation love
💔 broken heart heartbreak
❤️ red heart love
🧡 orange heart affection
💛 yellow heart affection
💚 green heart affection
💙 blue heart affection
💜 purple heart affection
🤎 brown heart coffee
🖤 black heart evil
🤍 white heart pure
💯 hundred points score
💢 anger symbol mad
💥 collision explosion boom
💫 dizzy star magic
💦 sweat droplets splash
💨 dashing away fast
🕳️ hole pit embarrassing
💣 bomb explosion boom
💬 speech bubble message
👁️‍🗨️ eye speech info
🗨️ left bubble message
🗯️ anger bubble shout
💭 thought bubble dream
💤 zzz sleeping dream
👋 waving hand hello
🤚 raised backhand stop
🖐️ splayed hand palm
✋ raised hand stop
🖖 vulcan salute spock
👌 ok hand perfect
🤏 pinching hand small
✌️ victory hand peace
🤞 crossed fingers lucky
🤟 love gesture hand
🤘 horns sign rock
🤙 call me shaka
👈 index pointing left
👉 index pointing right
👆 index pointing up
🖕 middle finger rude
👇 index pointing down
☝️ index pointing up
👍 thumbs up agree
👎 thumbs down dislike
✊ raised fist power
👊 oncoming fist punch
🤛 left fist bump
🤜 right fist bump
👏 clapping hands applause
🙌 raising hands hooray
👐 open hands cupped
🤲 palms up prayer
🤝 handshake agreement deal
🙏 folded hands pray
✍️ writing hand compose
💅 nail polish beauty
🤳 selfie camera phone
💪 flexed biceps strong
🦾 mechanical arm tech
🦿 mechanical leg tech
🦵 leg kick limb
🦶 foot stomp kick
👂 ear listening sound
🦻 hearing aid access
👃 nose smell sniff
🧠 brain smart genius
🦷 tooth dentist teeth
🦴 bone skeleton dog
👀 eyes watching peek
👁️ eye looking see
👅 tongue mouth playful
👄 mouth lips kiss
👶 baby child toddler
🧒 child young kid
👦 boy male teenager
👧 girl female teenager
🧑 person human neutral
👱 blond person hair
👨 man male guy
🧔 bearded man guy
👨‍🦰 red hair man
👨‍🦱 curly hair man
👨‍🦳 white hair man
👨‍🦲 bald man guy
👩 woman female lady
👩‍🦰 red hair woman
🧑‍🦰 red hair person
👩‍🦱 curly hair woman
🧑‍🦱 curly hair person
👩‍🦳 white hair woman
🧑‍🦳 white hair person
👩‍🦲 bald woman lady
🧑‍🦲 bald person neutral
👱‍♀️ blond woman girl
👱‍♂️ blond man guy
🧓 older person senior
👴 old man senior
👵 old woman senior
🙍 frowning person sad
🙍‍♂️ frowning man sad
🙍‍♀️ frowning woman sad
🙎 pouting person upset
🙎‍♂️ pouting man upset
🙎‍♀️ pouting woman upset
🙅 gesturing no decline
🙅‍♂️ man gesturing no
🙅‍♀️ woman gesturing no
🙆 gesturing ok agree
🙆‍♂️ man gesturing ok
🙆‍♀️ woman gesturing ok
💁 tipping hand info
💁‍♂️ man tipping info
💁‍♀️ woman tipping info
🙋 raising hand question
🙋‍♂️ man raising hand
🙋‍♀️ woman raising hand
🧏 deaf person access
🧏‍♂️ deaf man access
🧏‍♀️ deaf woman access
🙇 bowing person respect
🙇‍♂️ man bowing respect
🙇‍♀️ woman bowing respect
🤦 facepalm disappointed
🤦‍♂️ man facepalm disbelief
🤦‍♀️ woman facepalm disbelief
🤷 shrugging person doubt
🤷‍♂️ man shrugging doubt
🤷‍♀️ woman shrugging doubt
🧑‍⚕️ health worker doctor
👨‍⚕️ man doctor nurse
👩‍⚕️ woman doctor nurse
🧑‍🎓 student graduate learn
👨‍🎓 man student graduate
👩‍🎓 woman student graduate
🧑‍🏫 teacher instructor professor
👨‍🏫 man teacher professor
👩‍🏫 woman teacher professor
🧑‍⚖️ judge law court
👨‍⚖️ man judge court
👩‍⚖️ woman judge court
🧑‍🌾 farmer crops rancher
👨‍🌾 man farmer rancher
👩‍🌾 woman farmer rancher
🧑‍🍳 cook chef kitchen
👨‍🍳 man cook chef
👩‍🍳 woman cook chef
🧑‍🔧 mechanic plumber technician
👨‍🔧 man mechanic plumber
👩‍🔧 woman mechanic plumber
🧑‍🏭 factory worker labor
👨‍🏭 man factory worker
👩‍🏭 woman factory worker
🧑‍💼 office worker manager
👨‍💼 man office worker
👩‍💼 woman office worker
🧑‍🔬 scientist chemist engineer
👨‍🔬 man scientist chemist
👩‍🔬 woman scientist chemist
🧑‍💻 technologist coder developer
👨‍💻 man coder programmer
👩‍💻 woman coder programmer
🧑‍🎤 singer artist rockstar
👨‍🎤 man singer rockstar
👩‍🎤 woman singer rockstar
🧑‍🎨 artist painter draw
👨‍🎨 man artist painter
👩‍🎨 woman artist painter
🧑‍✈️ pilot aviator fly
👨‍✈️ man pilot aviator
👩‍✈️ woman pilot aviator
🧑‍🚀 astronaut space rocket
👨‍🚀 man astronaut rocket
👩‍🚀 woman astronaut rocket
🧑‍🚒 firefighter fireman fire
👨‍🚒 man firefighter fireman
👩‍🚒 woman firefighter fireman
👮 police officer cop
👮‍♂️ man police cop
👮‍♀️ woman police cop
🕵️ detective spy crime
🕵️‍♂️ man detective spy
🕵️‍♀️ woman detective spy
💂 guard protect royal
💂‍♂️ man guard royal
💂‍♀️ woman guard royal
👷 construction worker builder
👷‍♂️ man builder worker
👷‍♀️ woman builder worker
🤴 prince royal king
👸 princess royal queen
👳 turban person headdress
👳‍♂️ man wearing turban
👳‍♀️ woman wearing turban
👲 skullcap man chinese
🧕 headscarf woman hijab
🤵 tuxedo man groom
👰 bride veil wedding
🤰 pregnant woman baby
🤱 breastfeeding nursing baby
👼 baby angel halo
🎅 santa claus xmas
🤶 mrs claus xmas
🦸 superhero hero marvel
🦸‍♂️ man superhero hero
🦸‍♀️ woman superhero heroine
🦹 supervillain evil bad
🦹‍♂️ man supervillain villain
🦹‍♀️ woman supervillain villain
🧙 mage sorcerer magic
🧙‍♂️ man mage sorcerer
🧙‍♀️ woman mage witch
🧚 fairy magical wings
🧚‍♂️ man fairy male
🧚‍♀️ woman fairy female
🧛 vampire dracula blood
🧛‍♂️ man vampire dracula
🧛‍♀️ woman vampire dracula
🧜 merperson sea triton
🧜‍♂️ merman sea triton
🧜‍♀️ mermaid sea woman
🧝 elf magical fantasy
🧝‍♂️ man elf male
🧝‍♀️ woman elf female
🧞 genie magical wishes
🧞‍♂️ man genie male
🧞‍♀️ woman genie female
🧟 zombie undead dead
🧟‍♂️ man zombie undead
🧟‍♀️ woman zombie undead
💆 person getting massage
💆‍♂️ man getting massage
💆‍♀️ woman getting massage
💇 person getting haircut
💇‍♂️ man getting haircut
💇‍♀️ woman getting haircut
🚶 person walking move
🚶‍♂️ man walking steps
🚶‍♀️ woman walking steps
🧍 person standing still
🧍‍♂️ man standing still
🧍‍♀️ woman standing still
🧎 person kneeling pray
🧎‍♂️ man kneeling pray
🧎‍♀️ woman kneeling pray
🧑‍🦯 person cane blind
👨‍🦯 man cane blind
👩‍🦯 woman cane blind
🧑‍🦼 motorized wheelchair access
👨‍🦼 man motorized wheelchair
👩‍🦼 woman motorized wheelchair
🧑‍🦽 manual wheelchair access
👨‍🦽 man manual wheelchair
👩‍🦽 woman manual wheelchair
🏃 person running race
🏃‍♂️ man running race
🏃‍♀️ woman running race
💃 woman dancing fun
🕺 man dancing dancer
🕴️ levitating suit hover
👯 bunny ears dancers
👯‍♂️ men bunny ears
👯‍♀️ women bunny ears
🧖 steamy room sauna
🧖‍♂️ man steamy sauna
🧖‍♀️ woman steamy sauna
🧗 person climbing rock
🧗‍♂️ man climbing rock
🧗‍♀️ woman climbing rock
🤺 person fencing sword
🏇 horse racing betting
⛷️ skier winter snow
🏂 snowboarder winter snow
🏌️ person golfing sport
🏌️‍♂️ man golfing sport
🏌️‍♀️ woman golfing sport
🏄 person surfing sea
🏄‍♂️ man surfing ocean
🏄‍♀️ woman surfing ocean
🚣 person rowing boat
🚣‍♂️ man rowing boat
🚣‍♀️ woman rowing boat
🏊 person swimming pool
🏊‍♂️ man swimming athlete
🏊‍♀️ woman swimming athlete
⛹️ bouncing ball sports
⛹️‍♂️ man bouncing ball
⛹️‍♀️ woman bouncing ball
🏋️ lifting weights training
🏋️‍♂️ man lifting weights
🏋️‍♀️ woman lifting weights
🚴 person biking exercise
🚴‍♂️ man biking exercise
🚴‍♀️ woman biking exercise
🚵 mountain biking sport
🚵‍♂️ man mountain biking
🚵‍♀️ woman mountain biking
🤸 person cartwheeling gymnastics
🤸‍♂️ man cartwheeling gymnastics
🤸‍♀️ woman cartwheeling gymnastics
🤼 people wrestling sport
🤼‍♂️ men wrestling sport
🤼‍♀️ women wrestling sport
🤽 water polo sports
🤽‍♂️ man water polo
🤽‍♀️ woman water polo
🤾 person playing handball
🤾‍♂️ man playing handball
🤾‍♀️ woman playing handball
🤹 person juggling balance
🤹‍♂️ man juggling balance
🤹‍♀️ woman juggling balance
🧘 lotus position yoga
🧘‍♂️ man yoga zen
🧘‍♀️ woman yoga zen
🛀 person taking bath
🛌 person in bed
🧑‍🤝‍🧑 holding hands friends
👭 women holding hands
👫 woman man hands
👬 men holding hands
💏 kiss couple dating
👩‍❤️‍💋‍👨 kiss woman man
👨‍❤️‍💋‍👨 kiss man man
👩‍❤️‍💋‍👩 kiss woman woman
💑 couple heart love
👩‍❤️‍👨 couple heart woman
👨‍❤️‍👨 couple heart man
👩‍❤️‍👩 couple heart woman
👪 family parents child
👨‍👩‍👦 family man boy
👨‍👩‍👧 family man girl
👨‍👩‍👧‍👦 family boy girl
👨‍👩‍👦‍👦 family two boys
👨‍👩‍👧‍👧 family two girls
👨‍👨‍👦 family dads boy
👨‍👨‍👧 family dads girl
👨‍👨‍👧‍👦 family dads children
👨‍👨‍👦‍👦 family dads boys
👨‍👨‍👧‍👧 family dads girls
👩‍👩‍👦 family moms boy
👩‍👩‍👧 family moms girl
👩‍👩‍👧‍👦 family moms children
👩‍👩‍👦‍👦 family moms boys
👩‍👩‍👧‍👧 family moms girls
👨‍👦 dad boy child
👨‍👦‍👦 dad two boys
👨‍👧 dad girl child
👨‍👧‍👦 dad boy girl
👨‍👧‍👧 dad two girls
👩‍👦 mom boy child
👩‍👦‍👦 mom two boys
👩‍👧 mom girl child
👩‍👧‍👦 mom boy girl
👩‍👧‍👧 mom two girls
🗣️ speaking head talk
👤 silhouette user person
👥 silhouettes group team
👣 footprints feet walking
🐵 monkey face animal
🐒 monkey animal banana
🦍 gorilla ape animal
🦧 orangutan ape animal
🐶 dog face puppy
🐕 dog pet animal
🦮 guide dog blind
🐕‍🦺 service dog access
🐩 poodle dog pet
🐺 wolf wild animal
🦊 fox face animal
🦝 raccoon animal pet
🐱 cat face meow
🐈 cat pet animal
🦁 lion king animal
🐯 tiger face wild
🐅 tiger wild cat
🐆 leopard spotted cat
🐴 horse face brown
🐎 horse racing speed
🦄 unicorn magic horse
🦓 zebra safari stripes
🦌 deer horns nature
🐮 cow face moo
🐂 ox bull cattle
🐃 water buffalo ox
🐄 cow milk moo
🐷 pig face oink
🐖 pig pork animal
🐗 boar wild pig
🐽 pig nose oink
🐏 ram sheep horns
🐑 ewe sheep wool
🐐 goat animal nature
🐪 camel desert hump
🐫 camel two humps
🦙 llama alpaca animal
🦒 giraffe tall safari
🐘 elephant trunk animal
🦏 rhinoceros horn animal
🦛 hippopotamus hippo animal
🐭 mouse face rodent
🐁 mouse rodent white
🐀 rat rodent animal
🐹 hamster pet rodent
🐰 rabbit face bunny
🐇 rabbit bunny pet
🐿️ chipmunk squirrel rodent
🦔 hedgehog spiny animal
🦇 bat vampire animal
🐻 bear wild animal
🐨 koala australia bear
🐼 panda bamboo bear
🦥 sloth slow animal
🦦 otter water animal
🦨 skunk smelly animal
🦘 kangaroo australia hop
🦡 badger animal nature
🐾 paw prints feet
🦃 turkey bird thanksgiving
🐔 chicken cluck bird
🐓 rooster cock bird
🐣 hatching chick egg
🐤 baby chick bird
🐥 baby chick front
🐦 bird tweet fly
🐧 penguin ice bird
🕊️ dove peace bird
🦅 eagle raptor bird
🦆 duck mallard bird
🦢 swan white bird
🦉 owl hoot bird
🦩 flamingo pink bird
🦚 peacock bird feathers
🦜 parrot pirate bird
🐸 frog toad croak
🐊 crocodile gator reptile
🐢 turtle tortoise slow
🦎 lizard reptile animal
🐍 snake python hiss
🫯 cloud fight
🐲 dragon face myth
🐉 dragon myth green
🦕 sauropod dinosaur extinct
🦖 t rex dinosaur
🐳 spouting whale ocean
🐋 whale ocean sea
🐬 dolphin flipper ocean
🐟 fish swim water
🐠 tropical fish nemo
🐡 blowfish sea food
🦈 shark jaws ocean
🐙 octopus tentacles sea
🐚 spiral shell beach
🐌 snail slow shell
🦋 butterfly insect wings
🐛 bug caterpillar worm
🐜 ant insect bug
🐝 honeybee bee honey
🐞 ladybug beetle insect
🦗 cricket chirp insect
🕷️ spider arachnid web
🕸️ spider web silk
🦂 scorpion arachnid hazard
🦟 mosquito bug malaria
🦠 microbe germ virus
💐 bouquet flowers spring
🌸 cherry blossom pink
💮 white flower japanese
🏵️ rosette flower military
🌹 rose red love
🥀 wilted flower dead
🌺 hibiscus tropical flower
🌻 sunflower yellow plant
🌼 blossom yellow flower
🌷 tulip spring flower
🌱 seedling plant sprout
🌲 evergreen tree pine
🌳 deciduous tree nature
🌴 palm tree tropical
🌵 cactus desert plant
🌾 sheaf rice grain
🌿 herb plant leaf
☘️ shamrock irish clover
🍀 four leaf clover
🍁 maple leaf autumn
🍂 fallen leaf autumn
🍃 leaf wind fluttering
🍇 grapes fruit wine
🍈 melon fruit sweet
🍉 watermelon fruit summer
🍊 tangerine orange fruit
🍋 lemon sour fruit
🍌 banana monkey fruit
🍍 pineapple tropical fruit
🥭 mango fruit tropical
🍎 red apple fruit
🍏 green apple fruit
🍐 pear fruit nature
🍑 peach fruit fuzzy
🍒 cherries red fruit
🍓 strawberry red fruit
🥝 kiwi fruit food
🍅 tomato red fruit
🥥 coconut tropical nut
🥑 avocado guacamole fruit
🍆 eggplant vegetable food
🥔 potato veg starch
🥕 carrot orange veg
🌽 ear corn yellow
🌶️ hot pepper chili
🥒 cucumber pickle veg
🥬 leafy green lettuce
🥦 broccoli green veg
🧄 garlic spice food
🧅 onion cook veg
🍄 mushroom fungus plant
🥜 peanuts nut snack
🌰 chestnut squirrel nut
🍞 bread slice toast
🥐 croissant french pastry
🥖 baguette french bread
🥨 pretzel twisted bread
🥯 bagel bakery toast
🥞 pancakes breakfast flapjacks
🧇 waffle breakfast syrup
🧀 cheese wedge food
🍖 meat bone drumstick
🍗 poultry leg chicken
🥩 cut meat steak
🥓 bacon pork strip
🍔 hamburger cheeseburger fastfood
🍟 french fries chips
🍕 pizza slice party
🌭 hot dog frankfurter
🥪 sandwich lunch bread
🌮 taco mexican food
🌯 burrito mexican food
🥙 flatbread gyro wrap
🧆 falafel chickpea ball
🥚 egg chicken breakfast
🍳 fried egg cooking
🥘 shallow pan paella
🍲 pot food soup
🥣 bowl spoon cereal
🥗 green salad healthy
🍿 popcorn movie movie
🧈 butter dairy cooking
🧂 salt shaker spice
🥫 canned food soup
🍱 bento box japanese
🍘 rice cracker japanese
🍙 rice ball japanese
🍚 cooked rice bowl
🍛 curry rice indian
🍜 steaming noodles ramen
🍝 spaghetti pasta italian
🍠 roasted sweet potato
🍢 oden japanese food
🍣 sushi raw fish
🍤 fried shrimp tempura
🍥 fish cake swirl
🥮 mooncake autumn festival
🍡 dango sweet skewers
🥟 dumpling potsticker food
🥠 fortune cookie prophecy
🥡 takeout box chinese
🦀 crab seafood crustacean
🦞 lobster seafood claws
🦐 shrimp seafood ocean
🦑 squid ocean seafood
🦪 oyster seafood shell
🍦 soft ice cream
🍧 shaved ice dessert
🍨 ice cream bowl
🍩 doughnut donut sweet
🍪 cookie chocolate sweet
🎂 birthday cake party
🍰 shortcake slice cake
🧁 cupcake bakery sweet
🥧 pie pastry dessert
🍫 chocolate bar sweet
🍬 candy lolly sweet
🍭 lollipop candy sweet
🍮 custard pudding dessert
🍯 honey pot bee
🍼 baby bottle milk
🥛 glass milk drink
☕ hot coffee tea
🍵 teacup green tea
🍶 sake wine japanese
🍾 popping cork champagne
🍷 wine glass alcohol
🍸 cocktail glass booze
🍹 tropical drink beach
🍺 beer mug pub
🍻 clinking beers cheers
🥂 clinking glasses toast
🥃 tumbler glass whiskey
🥤 cup straw soda
🧃 juice box drink
🧉 mate tea drink
🧊 ice cold cube
🥢 chopsticks utensils food
🍽️ plate knife fork
🍴 knife fork cutlery
🥄 spoon cutlery kitchen
🔪 kitchen knife blade
🏺 amphora vase jar
🌍 globe europe africa
🌎 globe americas usa
🌏 globe asia australia
🌐 globe meridians internet
🗺️ world map location
🗾 map japan country
🧭 compass navigation direction
🏔️ snow mountain cold
⛰️ mountain nature photo
🌋 volcano eruption disaster
🗻 mount fuji japan
🏕️ camping tent outdoors
🏖️ beach umbrella summer
🏜️ desert sahara sand
🏝️ desert island tropical
🏞️ national park nature
🏟️ stadium sports concert
🏛️ classical building culture
🏗️ building construction wip
🧱 brick wall building
🏘️ houses neighbourhood
🏚️ derelict house broken
🏠 house home building
🏡 house garden home
🏢 office building work
🏣 japanese post office
🏤 post office mail
🏥 hospital health doctor
🏦 bank money cash
🏨 hotel accommodation checkin
🏩 love hotel dating
🏪 convenience store groceries
🏫 school education learn
🏬 department store mall
🏭 factory industry smoke
🏯 japanese castle historic
🏰 castle royalty history
💒 wedding chapel marriage
🗼 tokyo tower japan
🗽 statue liberty newyork
⛪ church religion christ
🕌 mosque islam worship
🛕 hindu temple religion
🕍 synagogue judaism temple
⛩️ shinto shrine japan
🕋 kaaba mecca islam
⛲ fountain water fresh
⛺ tent camping outdoor
🌁 foggy fog mountain
🌃 night stars city
🏙️ cityscape urban skyline
🌄 sunrise mountains morning
🌅 sunrise ocean morning
🌆 cityscape dusk evening
🌇 sunset city dawn
🌉 bridge night sf
♨️ hot springs bath
🎠 carousel horse carnival
🎡 ferris wheel carnival
🎢 roller coaster fun
💈 barber pole salon
🎪 circus tent festival
🚂 locomotive train vintage
🚃 railway car train
🚄 high speed train
🚅 bullet train fast
🚆 train transport public
🚇 metro subway tube
🚈 light rail train
🚉 station train platform
🚊 tram transport public
🚝 monorail train transport
🚞 mountain railway train
🚋 tram car public
🚌 bus transport public
🚍 oncoming bus transport
🚎 trolleybus transport
🚐 minibus transport van
🚑 ambulance health emergency
🚒 fire engine 911
🚓 police car cop
🚔 oncoming police car
🚕 taxi cab uber
🚖 oncoming taxi cab
🚗 automobile car red
🚘 oncoming automobile car
🚙 suv sport utility
🚚 delivery truck transport
🚛 articulated lorry truck
🚜 tractor farm agriculture
🏎️ racing car f1
🏍️ motorcycle race fast
🛵 motor scooter vespa
🦽 manual wheelchair access
🦼 motorized wheelchair access
🛺 auto rickshaw tuktuk
🚲 bicycle bike exercise
🛴 kick scooter razor
🛹 skateboard board skate
🚏 bus stop transit
🛣️ motorway highway road
🛤️ railway track train
🛢️ oil drum barrel
⛽ fuel pump gas
🚨 police light emergency
🚥 horizontal traffic light
🚦 vertical traffic light
🛑 stop sign halt
🚧 construction sign warning
⚓ anchor ship sea
⛵ sailboat wind water
🛶 canoe paddle boat
🚤 speedboat fast water
🛳️ passenger ship cruise
⛴️ ferry boat ship
🛥️ motorboat ship sea
🚢 ship titanic vessel
✈️ airplane flight fly
🛩️ small airplane fly
🛫 airplane departure takeoff
🛬 airplane arrival landing
🪂 parachute skydiving glide
💺 seat flight sit
🚁 helicopter copter fly
🚟 suspension railway transit
🚠 mountain cableway ski
🚡 aerial tramway ski
🛰️ satellite space orbit
🚀 rocket launch nasa
🛸 flying saucer ufo
🛎️ bellhop bell service
🧳 luggage suitcase travel
⌛ hourglass done time
⏳ hourglass countdown time
⌚ watch wrist time
⏰ alarm clock wake
⏱️ stopwatch timer deadline
⏲️ timer clock alarm
🕰️ mantelpiece clock time
🕛 twelve clock noon
🕧 twelve thirty time
🕐 one clock time
🕜 one thirty time
🕑 two clock time
🕝 two thirty time
🕒 three clock time
🕞 three thirty time
🕓 four clock time
🕟 four thirty time
🕔 five clock time
🕠 five thirty time
🕕 six clock evening
🕡 six thirty time
🕖 seven clock time
🕢 seven thirty time
🕗 eight clock time
🕣 eight thirty time
🕘 nine clock time
🕤 nine thirty time
🕙 ten clock time
🕥 ten thirty time
🕚 eleven clock time
🕦 eleven thirty time
🌑 new moon night
🌒 waxing crescent moon
🌓 first quarter moon
🌔 waxing gibbous moon
🌕 full moon yellow
🌖 waning gibbous moon
🌗 last quarter moon
🌘 waning crescent moon
🌙 crescent moon night
🌚 new moon face
🌛 first quarter face
🌜 last quarter face
🌡️ thermometer temperature weather
☀️ sun sunny brightness
🌝 full moon face
🌞 sun face morning
🪐 ringed planet saturn
⭐ star yellow night
🌟 glowing star sparkle
🌠 shooting star wish
🌌 milky way space
☁️ cloud weather sky
⛅ sun behind cloud
⛈️ cloud lightning rain
🌤️ sun small cloud
🌥️ sun large cloud
🌦️ sun rain cloud
🌧️ cloud rain weather
🌨️ cloud snow weather
🌩️ cloud lightning thunder
🌪️ tornado cyclone twister
🌫️ fog weather mist
🌬️ wind face blowing
🌀 cyclone vortex spiral
🌈 rainbow colorful sky
🌂 closed umbrella rain
☂️ umbrella weather rain
☔ umbrella rain drops
⛱️ umbrella ground beach
⚡ high voltage lightning
❄️ snowflake winter cold
☃️ snowman winter xmas
⛄ snowman no snow
☄️ comet space meteor
🔥 fire flame hot
💧 droplet water drip
🌊 water wave ocean
🎃 jack lantern halloween
🎄 christmas tree xmas
🎆 fireworks festival celebration
🎇 sparkler shine night
🧨 firecracker dynamite boom
✨ sparkles shiny magic
🎈 balloon party birthday
🎉 party popper tada
🎊 confetti ball party
🎋 tanabata tree japan
🎍 pine decoration japan
🎎 japanese dolls toy
🎏 carp streamer banner
🎐 wind chime spring
🎑 moon viewing ceremony
🧧 red envelope gift
🎀 ribbon bowtie pink
🎁 wrapped gift present
🎗️ reminder ribbon cause
🎟️ admission tickets concert
🎫 ticket event pass
🎖️ military medal award
🏆 trophy winner cup
🏅 sports medal award
🥇 1st place medal
🥈 2nd place medal
🥉 3rd place medal
⚽ soccer ball football
⚾ baseball sport ball
🥎 softball sport ball
🏀 basketball nba ball
🏐 volleyball sport ball
🏈 american football nfl
🏉 rugby football sport
🎾 tennis racket ball
🥏 flying disc frisbee
🎳 bowling ball pins
🏏 cricket bat ball
🏑 field hockey stick
🏒 ice hockey puck
🥍 lacrosse stick ball
🏓 ping pong table
🏸 badminton shuttlecock sport
🥊 boxing glove fight
🥋 martial arts gi
🥅 goal net sports
⛳ flag hole golf
⛸️ ice skate winter
🎣 fishing pole rod
🤿 diving mask snorkel
🎽 running shirt sash
🎿 skis winter snow
🛷 sled sleigh luge
🥌 curling stone sport
🎯 direct hit bullseye
🪀 yoyo toy spin
🪁 kite fly wind
🎱 pool 8ball billiards
🔮 crystal ball fortune
🧿 nazar amulet evil-eye
🎮 video game controller
🕹️ joystick arcade controller
🎰 slot machine casino
🎲 game die dice
🧩 puzzle piece jigsaw
🧸 teddy bear plush
♠️ spade suit poker
♥️ heart suit poker
♦️ diamond suit poker
♣️ club suit poker
♟️ chess pawn game
🃏 joker card game
🀄 mahjong red dragon
🎴 flower cards hanafuda
🎭 performing arts drama
🖼️ framed picture photo
🎨 artist palette paint
🧵 thread spool sewing
🧶 yarn ball knit
👓 glasses eyesight specs
🕶️ sunglasses cool shades
🥽 goggles safety eyes
🥼 lab coat doctor
🦺 safety vest protection
👔 necktie tie shirt
👕 t-shirt tee clothing
👖 jeans pants denim
🧣 scarf neck winter
🧤 gloves winter hands
🧥 coat jacket winter
🧦 socks feet winter
👗 dress fashion clothes
👘 kimono japanese dress
🥻 sari indian dress
🩱 swimsuit one-piece
🩲 briefs underwear clothing
🩳 shorts clothing casual
👙 bikini swimsuit summer
👚 woman s clothes
👛 purse coin wallet
👜 handbag purse fashion
👝 clutch bag pouch
🛍️ shopping bags mall
🎒 backpack school bag
👞 man s shoe
👟 running shoe sneaker
🥾 hiking boot outdoors
🥿 flat shoe ballet
👠 high heel shoe
👡 woman s sandal
🩰 ballet shoes dance
👢 woman s boot
👑 crown king queen
👒 woman s hat
🎩 top hat gentleman
🎓 graduation cap degree
🧢 billed cap hat
⛑️ helmet worker safety
📿 prayer beads dhikr
💄 lipstick makeup beauty
💍 ring diamond proposal
💎 gem stone diamond
🔇 muted speaker silence
🔈 speaker low volume
🔉 speaker medium volume
🔊 speaker high volume
📢 loudspeaker broadcast
📣 megaphone volume
📯 postal horn music
🔔 bell notification chime
🔕 bell slash mute
🎼 musical score compose
🎵 musical note sound
🎶 musical notes score
🎙️ studio microphone recording
🎚️ level slider scale
🎛️ control knobs dial
🎤 microphone sing talk
🎧 headphone music score
📻 radio podcast program
🎷 saxophone jazz blues
🎸 guitar instrument rock
🎹 keyboard piano compose
🎺 trumpet brass instrument
🎻 violin orchestra symphony
🪕 banjo music instrument
🥁 drum drumsticks snare
📱 mobile phone gadget
📲 mobile phone arrow
☎️ telephone landline dial
📞 telephone receiver call
📟 pager 90s technology
📠 fax machine office
🔋 battery power charger
🔌 electric plug power
💻 laptop computer screen
🖥️ desktop computer screen
🖨️ printer paper ink
⌨️ keyboard type input
🖱️ computer mouse click
🖲️ trackball input device
💽 computer disk 90s
💾 floppy disk save
💿 optical disk cd
📀 dvd disc movie
🧮 abacus math calculation
🎥 movie camera film
🎞️ film frames movie
📽️ film projector movie
🎬 clapper board film
📺 television tv show
📷 camera photography gadget
📸 camera flash photo
📹 video camera record
📼 videocassette 90s tape
🔍 magnifying glass search
🔎 magnifying glass zoom
🕯️ candle fire wax
💡 light bulb idea
🔦 flashlight torch dark
🏮 red lantern paper
🪔 diya lamp lighting
📔 notebook cover study
📕 closed book read
📖 open book reading
📗 green book study
📘 blue book study
📙 orange book study
📚 books library study
📓 notebook paper notes
📒 ledger notes paper
📃 page curl document
📜 scroll ancient history
📄 page up document
📰 newspaper press news
🗞️ rolled newspaper news
📑 bookmark tabs favorite
🔖 bookmark label save
🏷️ label tag sale
💰 money bag cash
💴 yen banknote japan
💵 dollar banknote cash
💶 euro banknote cash
💷 pound banknote uk
💸 money wings payment
💳 credit card payment
🧾 receipt expenses accounting
💹 chart increasing yen
💱 currency exchange forex
💲 dollar sign currency
✉️ envelope letter mail
📧 email inbox mail
📨 incoming envelope mail
📩 envelope arrow mail
📤 outbox tray mail
📥 inbox tray mail
📦 package box mail
📫 closed mailbox flag
📪 closed mailbox down
📬 open mailbox flag
📭 open mailbox down
📮 postbox letter box
🗳️ ballot box vote
✏️ pencil write stationery
✒️ nib pen ink
🖋️ fountain pen write
🖊️ pen writing stationery
🖌️ paintbrush art drawing
🖍️ crayon art drawing
📝 memo note pencil
💼 briefcase business work
📁 file folder document
📂 open file folder
🗂️ card index dividers
📅 calendar date schedule
📆 tear calendar date
🗒️ spiral notepad memo
🗓️ spiral calendar schedule
📇 card index business
📈 chart increasing growth
📉 chart decreasing loss
📊 bar chart graph
📋 clipboard document notes
📌 pushpin location mark
📍 round pushpin location
📎 paperclip stationery clip
🖇️ linked paperclips clips
📏 straight ruler ruler
📐 triangular ruler math
✂️ scissors cut paper
🗃️ card file box
🗄️ file cabinet storage
🗑️ wastebasket trash bin
🔒 locked security lock
🔓 unlocked open lock
🔏 locked pen secret
🔐 locked key privacy
🔑 key door password
🗝️ old key vintage
🔨 hammer tool build
🪓 axe tool chop
⛏️ pickaxe dig tool
⚒️ hammer pick tools
🛠️ hammer wrench tools
🗡️ dagger knife weapon
⚔️ crossed swords combat
🔫 pistol gun weapon
🏹 bow arrow sport
🛡️ shield protection armor
🔧 wrench tool fix
🔩 nut bolt hardware
⚙️ gear cog settings
🗜️ clamp tool fix
⚖️ balance scale law
🦯 probing cane blind
🔗 link chain url
⛓️ chains lock security
🧰 toolbox tools fix
🧲 magnet attraction attraction
⚗️ alembic science chemistry
🧪 test tube lab
🧫 petri dish bacteria
🧬 dna genetics biology
🔬 microscope science lab
🔭 telescope space astronomy
📡 satellite dish radio
💉 syringe needle medical
🩸 drop blood injury
💊 pill medicine drug
🩹 adhesive bandage heal
🩺 stethoscope doctor medical
🚪 door entry exit
🛏️ bed sleep rest
🛋️ couch sofa lamp
🪑 chair sit furniture
🚽 toilet restroom wc
🚿 shower bathroom clean
🛁 bathtub bath wash
🪒 razor shave cut
🧴 lotion bottle moisturizer
🧷 safety pin diaper
🧹 broom sweep clean
🧺 basket laundry wash
🧻 roll paper tissue
🧼 soap bar cleaning
🧽 sponge wash clean
🧯 fire extinguisher safety
🛒 shopping cart trolley
🚬 cigarette smoke tobacco
⚰️ coffin funeral death
⚱️ funeral urn ashes
🗿 moai statue rock
🏧 atm sign cash
🚮 litter bin sign
🚰 potable water tap
♿ wheelchair symbol access
🚹 mens room toilet
🚺 womens room restroom
🚻 restroom wc symbol
🚼 baby symbol nursery
🚾 water closet wc
🛂 passport control border
🛃 customs control border
🛄 baggage claim airport
🛅 left luggage storage
⚠️ warning sign alert
🚸 children crossing warning
⛔ no entry stop
🚫 prohibited sign stop
🚳 no bicycles sign
🚭 no smoking sign
🚯 no littering sign
🚱 non potable water
🚷 no pedestrians sign
📵 no mobile phones
🔞 no under eighteen
☢️ radioactive nuclear danger
☣️ biohazard danger sign
⬆️ up arrow direction
↗️ up right arrow
➡️ right arrow next
↘️ down right arrow
⬇️ down arrow bottom
↙️ down left arrow
⬅️ left arrow back
↖️ up left arrow
↕️ up down arrow
↔️ left right arrow
↩️ right arrow curving left
↪️ left arrow curving right
⤴️ arrow curving up
⤵️ arrow curving down
🔃 clockwise arrows sync
🔄 counterclockwise arrows sync
🔙 back arrow return
🔚 end arrow stop
🔛 on arrow active
🔜 soon arrow coming
🔝 top arrow above
🛐 place of worship
⚛️ atom symbol physics
🕉️ om hindu symbol
✡️ star of david
☸️ wheel of dharma
☯️ yin yang balance
✝️ latin cross christian
☦️ orthodox cross religion
☪️ star and crescent
☮️ peace symbol hippie
🕎 menorah hanukkah candles
🔯 dotted six pointed star
♈ aries zodiac sign
♉ taurus zodiac sign
♊ gemini zodiac sign
♋ cancer zodiac sign
♌ leo zodiac sign
♍ virgo zodiac sign
♎ libra zodiac sign
♏ scorpio zodiac sign
♐ sagittarius zodiac sign
♑ capricorn zodiac sign
♒ aquarius zodiac sign
♓ pisces zodiac sign
⛎ ophiuchus zodiac sign
🔀 shuffle button random
🔁 repeat button loop
🔂 repeat single loop
▶️ play button right
⏩ fast forward button
⏭️ next track button
⏯️ play pause button
◀️ reverse button left
⏪ fast reverse button
⏮️ last track button
🔼 upwards button top
⏫ fast up button
🔽 downwards button bottom
⏬ fast down button
⏸️ pause button stop
⏹️ stop button square
⏺️ record button circle
⏏️ eject button out
🎦 cinema theater movie
🔅 dim button low
🔆 bright button light
📶 antenna bars signal
📳 vibration mode phone
📴 mobile phone off
♀️ female sign woman
♂️ male sign man
⚕️ medical symbol health
♾️ infinity symbol forever
♻️ recycling symbol green
⚜️ fleur de lis
🔱 trident emblem spear
📛 name badge tag
🔰 beginner badge shield
⭕ hollow red circle
✅ check mark green
☑️ check box tick
✔️ check mark tick
✖️ multiplication sign math
❌ cross mark cancel
❎ cross mark button
➕ plus sign add
➖ minus sign subtract
➗ division sign divide
➰ curly loop scribble
➿ double curly loop
〽️ part alternation mark
✳️ eight spoked asterisk
✴️ eight pointed star
❇️ sparkle star green
‼️ double exclamation mark
⁉️ exclamation question mark
❓ question mark doubt
❔ white question mark
❕ white exclamation mark
❗ exclamation mark danger
〰️ wavy dash line
©️ copyright mark legal
®️ registered trademark
™️ trademark brand
#️⃣ keycap hash symbol
*️⃣ keycap star symbol
0️⃣ keycap zero number
1️⃣ keycap one number
2️⃣ keycap two number
3️⃣ keycap three number
4️⃣ keycap four number
5️⃣ keycap five number
6️⃣ keycap six number
7️⃣ keycap seven number
8️⃣ keycap eight number
9️⃣ keycap nine number
🔟 keycap ten number
🔠 input uppercase latin
🔡 input lowercase latin
🔢 input numbers symbol
🔣 input symbols glyphs
🔤 input latin letters
🅰️ a button red
🆎 ab button red
🅱️ b button red
🆑 cl button clear
🆒 cool button text
🆓 free button text
ℹ️ info button blue
🆔 id button purple
Ⓜ️ circled m transit
🆕 new button start
🆖 ng button no-good
🅾️ o button red
🆗 ok button agree
🅿️ parking sign blue
🆘 sos button emergency
🆙 up button text
🆚 vs button versus
🈁 japanese here button
🈂️ japanese service charge
🈷️ japanese monthly amount
🈶 japanese not free
🈯 japanese reserved sign
🉐 japanese bargain button
🈹 japanese discount button
🈚 japanese free charge
🈲 japanese prohibited sign
🉑 japanese acceptable button
🈸 japanese application sign
🈴 japanese passing grade
🈳 japanese vacancy sign
㊗️ japanese congratulations button
㊙️ japanese secret sign
🈺 japanese open business
🈵 japanese no vacancy
🔴 red circle button
🟠 orange circle button
🟡 yellow circle button
🟢 green circle button
🔵 blue circle button
🟣 purple circle button
🟤 brown circle button
⚫ black circle button
⚪ white circle button
🟥 red square block
🟧 orange square block
🟨 yellow square block
🟩 green square block
🟦 blue square block
🟪 purple square block
🟫 brown square block
⬛ black large square
⬜ white large square
◼️ black medium square
◻️ white medium square
◾ black small square
◽ white small square
▪️ black tiny square
▫️ white tiny square
🔶 large orange diamond
🔷 large blue diamond
🔸 small orange diamond
🔹 small blue diamond
🔺 red triangle up
🔻 red triangle down
💠 diamond with dot
🔘 radio button input
🔳 white square button
🔲 black square button
🏁 chequered flag race finish
🚩 triangular flag post mark
🎌 crossed flags japan
🏴 black flag pirate
🏳️ white flag surrender
🏳️‍🌈 rainbow flag pride lgbt
🏴‍☠️ pirate flag skull crossbones
🇦🇨 flag ascension island
🇦🇩 flag andorra
🇦🇪 flag uae united arab emirates
🇦🇫 flag afghanistan
🇦🇬 flag antigua barbuda
🇦🇮 flag anguilla
🇦🇱 flag albania
🇦🇲 flag armenia
🇦🇴 flag angola
🇦🇶 flag antarctica
🇦🇷 flag argentina
🇦🇸 flag american samoa
🇦🇹 flag austria
🇦🇺 flag australia
🇦🇼 flag aruba
🇦🇽 flag aland islands
🇦🇿 flag azerbaijan
🇧🇦 flag bosnia herzegovina
🇧🇧 flag barbados
🇧🇩 flag bangladesh
🇧🇪 flag belgium
🇧🇫 flag burkina faso
🇧🇬 flag bulgaria
🇧🇭 flag bahrain
🇧🇮 flag burundi
🇧🇯 flag benin
🇧🇱 flag st barthelemy
🇧🇲 flag bermuda
🇧🇳 flag brunei
🇧🇴 flag bolivia
🇧🇶 flag caribbean netherlands
🇧🇷 flag brazil
🇧🇸 flag bahamas
🇧🇹 flag bhutan
🇧🇻 flag bouvet island
🇧🇼 flag botswana
🇧🇾 flag belarus
🇧🇿 flag belize
🇨🇦 flag canada
🇨🇨 flag cocos islands
🇨🇩 flag congo kinshasa
🇨🇫 flag central african republic
🇨🇬 flag congo brazzaville
🇨🇭 flag switzerland
🇨🇮 flag cote divoire
🇨🇰 flag cook islands
🇨🇱 flag chile
🇨🇲 flag cameroon
🇨🇳 flag china
🇨🇴 flag colombia
🇨🇵 flag clipperton island
🇨🇷 flag costa rica
🇨🇺 flag cuba
🇨🇻 flag cape verde
🇨🇼 flag curacao
🇨🇽 flag christmas island
🇨🇾 flag cyprus
🇨🇿 flag czechia
🇩🇪 flag germany
🇩🇬 flag diego garcia
🇩🇯 flag djibouti
🇩🇰 flag denmark
🇩🇲 flag dominica
🇩🇴 flag dominican republic
🇩🇿 flag algeria
🇪🇦 flag ceuta melilla
🇪🇨 flag ecuador
🇪🇪 flag estonia
🇪🇬 flag egypt
🇪🇭 flag western sahara
🇪🇷 flag eritrea
🇪🇸 flag spain
🇪🇹 flag ethiopia
🇪🇺 flag european union
🇫🇮 flag finland
🇫🇯 flag fiji
🇫🇰 flag falkland islands
🇫🇲 flag micronesia
🇫🇴 flag faroe islands
🇫🇷 flag france
🇬🇦 flag gabon
🇬🇧 flag uk united kingdom
🇬🇩 flag grenada
🇬🇪 flag georgia
🇬🇫 flag french guiana
🇬🇬 flag guernsey
🇬🇭 flag ghana
🇬🇮 flag gibraltar
🇬🇱 flag greenland
🇬🇲 flag gambia
🇬🇳 flag guinea
🇬🇵 flag guadeloupe
🇬🇶 flag equatorial guinea
🇬🇷 flag greece
🇬🇸 flag south georgia
🇬🇹 flag guatemala
🇬🇺 flag guam
🇬🇼 flag guinea bissau
🇬🇾 flag guyana
🇭🇰 flag hong kong
🇭🇲 flag heard mcdonald islands
🇭🇳 flag honduras
🇭🇷 flag croatia
🇭🇹 flag haiti
🇭🇺 flag hungary
🇮🇨 flag canary islands
🇮🇩 flag indonesia
🇮🇪 flag ireland
🇮🇱 flag israel
🇮🇲 flag isle of man
🇮🇳 flag india
🇮🇴 flag british indian ocean territory
🇮🇶 flag iraq
🇮🇷 flag iran
🇮🇸 flag iceland
🇮🇹 flag italy
🇯🇪 flag jersey
🇯🇲 flag jamaica
🇯🇴 flag jordan
🇯🇵 flag japan
🇰🇪 flag kenya
🇰🇬 flag kyrgyzstan
🇰🇭 flag cambodia
🇰🇮 flag kiribati
🇰🇲 flag comoros
🇰🇳 flag st kitts nevis
🇰🇵 flag north korea
🇰🇷 flag south korea
🇰🇼 flag kuwait
🇰🇾 flag cayman islands
🇰🇿 flag kazakhstan
🇱🇦 flag laos
🇱🇧 flag lebanon
🇱🇨 flag st lucia
🇱🇮 flag liechtenstein
🇱🇰 flag sri lanka
🇱🇷 flag liberia
🇱🇸 flag lesotho
🇱🇹 flag lithuania
🇱🇺 flag luxembourg
🇱🇻 flag latvia
🇱🇾 flag libya
🇲🇦 flag morocco
🇲🇨 flag monaco
🇲🇩 flag moldova
🇲🇪 flag montenegro
🇲🇫 flag st martin
🇲🇬 flag madagascar
🇲🇭 flag marshall islands
🇲🇰 flag north macedonia
🇲🇱 flag mali
🇲🇲 flag myanmar
🇲🇳 flag mongolia
🇲🇴 flag macao
🇲🇵 flag northern mariana islands
🇲🇶 flag martinique
🇲🇷 flag mauritania
🇲🇸 flag montserrat
🇲🇹 flag malta
🇲🇺 flag mauritius
🇲🇻 flag maldives
🇲🇼 flag malawi
🇲🇽 flag mexico
🇲🇾 flag malaysia
🇲🇿 flag mozambique
🇳🇦 flag namibia
🇳🇨 flag new caledonia
🇳🇪 flag niger
🇳🇫 flag norfolk island
🇳🇬 flag nigeria
🇳🇮 flag nicaragua
🇳🇱 flag netherlands
🇳🇴 flag norway
🇳🇵 flag nepal
🇳🇷 flag nauru
🇳🇺 flag niue
🇳🇿 flag new zealand
🇴🇲 flag oman
🇵🇦 flag panama
🇵🇪 flag peru
🇵🇫 flag french polynesia
🇵🇬 flag papua new guinea
🇵🇭 flag philippines
🇵🇰 flag pakistan
🇵🇱 flag poland
🇵🇲 flag st pierre miquelon
🇵🇳 flag pitcairn islands
🇵🇷 flag puerto rico
🇵🇸 flag palestine
🇵🇹 flag portugal
🇵🇼 flag palau
🇵🇾 flag paraguay
🇶🇦 flag qatar
🇷🇪 flag reunion
🇷🇴 flag romania
🇷🇸 flag serbia
🇷🇺 flag russia
🇷🇼 flag rwanda
🇸🇦 flag saudi arabia
🇸🇧 flag solomon islands
🇸🇨 flag seychelles
🇸🇩 flag sudan
🇸🇪 flag sweden
🇸🇬 flag singapore
🇸🇭 flag st helena
🇸🇮 flag slovenia
🇸🇯 flag svalbard jan mayen
🇸🇰 flag slovakia
🇸🇱 flag sierra leone
🇸🇲 flag san marino
🇸🇳 flag senegal
🇸🇴 flag somalia
🇸🇷 flag suriname
🇸🇸 flag south sudan
🇸🇹 flag sao tome principe
🇸🇻 flag el salvador
🇸🇽 flag sint maarten
🇸🇾 flag syria
🇸🇿 flag eswatini
🇹🇦 flag tristan da cunha
🇹🇨 flag turks caicos
🇹🇩 flag chad
🇹🇫 flag french southern territories
🇹🇬 flag togo
🇹🇭 flag thailand
🇹🇯 flag tajikistan
🇹🇰 flag tokelau
🇹🇱 flag timor leste
🇹🇲 flag turkmenistan
🇹🇳 flag tunisia
🇹🇴 flag tonga
🇹🇷 flag turkey
🇹🇹 flag trinidad tobago
🇹🇻 flag tuvalu
🇹🇼 flag taiwan
🇹🇿 flag tanzania
🇺🇦 flag ukraine
🇺🇬 flag uganda
🇺🇲 flag us outlying islands
🇺🇳 flag united nations
🇺🇸 flag usa united states
🇺🇾 flag uruguay
🇺🇿 flag uzbekistan
🇻🇦 flag vatican city
🇻🇨 flag st vincent grenadines
🇻🇪 flag venezuela
🇻🇬 flag british virgin islands
🇻🇮 flag us virgin islands
🇻🇳 flag vietnam
🇻🇺 flag vanuatu
🇼🇫 flag wallis futuna
🇼🇸 flag samoa
🇽🇰 flag kosovo
🇾🇪 flag yemen
🇾🇹 flag mayotte
🇿🇦 flag south africa
🇿🇲 flag zambia
🇿🇼 flag zimbabwe
🏴󠁧󠁢󠁥󠁮󠁧󠁿 flag england
🏴󠁧󠁢󠁳󠁣󠁴󠁿 flag scotland
🏴󠁧󠁢󠁷󠁬󠁳󠁿 flag wales
🥲 smiling face tear sad
🥸 disguised face glasses mustache
🤌 pinched fingers Italian gesture
🫀 anatomical heart organ
🫁 lungs organ breathe
🥷 ninja warrior shadow
🤵‍♂️ man tuxedo formal
🤵‍♀️ woman tuxedo formal
👰‍♂️ man veil wedding
👰‍♀️ woman veil wedding
👩‍🍼 woman feeding baby
👨‍🍼 man feeding baby
🧑‍🍼 person feeding baby
🧑‍🎄 mx claus christmas
🫂 people hugging hug
🐈‍⬛ black cat superstition
🦬 bison buffalo animal
🦣 mammoth extinct elephant
🦫 beaver rodent dam
🐻‍❄️ polar bear arctic
🦤 dodo extinct bird
🪶 feather bird plume
🦭 seal sea mammal
🪲 beetle bug insect
🪳 cockroach pest insect
🪰 fly insect pest
🪱 worm earthworm pest
🪴 potted plant houseplant
🫐 blueberries fruit berry
🫒 olive fruit oil
🫑 bell pepper vegetable
🫓 flatbread pita naan
🫔 tamale mexican food
🫕 fondue melted cheese
🫖 teapot tea kettle
🧋 bubble tea boba
🪨 rock stone boulder
🪵 wood log timber
🛖 hut cabin structure
🛻 pickup truck ute
🛼 roller skate derby
🪄 magic wand spell
🪅 pinata candy party
🪆 nesting dolls matryoshka
🪡 sewing needle thread
🪢 knot rope tied
🩴 thong sandal flip-flop
🪖 military helmet army
🪗 accordion instrument music
🪘 long drum percussion
🪙 coin money currency
🪃 boomerang weapon throw
🪚 carpentry saw tool
🪛 screwdriver tool fix
🪝 hook tool catch
🪜 ladder climb tool
🛗 elevator lift transport
🪞 mirror reflection vanity
🪟 window glass frame
🪠 plunger toilet tool
🪤 mouse trap rodent
🪣 bucket pail water
🪥 toothbrush dental hygiene
🪦 headstone tombstone grave
🪧 placard sign protest
⚧️ transgender symbol
🏳️‍⚧️ transgender flag
😶‍🌫️ face clouds foggy
😮‍💨 face exhaling sigh
😵‍💫 face spiral eyes dizzy
❤️‍🔥 heart fire passionate
❤️‍🩹 mending heart healing
🧔‍♂️ man beard facial hair
🧔‍♀️ woman beard facial hair
🫠 melting face hot melt
🫢 face hand over mouth shock
🫣 face peeking eye scared
🫡 saluting face respect
🫥 dotted line face invisible
🫤 face diagonal mouth skeptic
🥹 face holding back tears touched
🫱 rightwards hand reach
🫲 leftwards hand reach
🫳 palm down hand drop
🫴 palm up hand offer
🫰 hand index thumb crossed heart
🫵 index pointing viewer you
🫶 heart hands love support
🫦 biting lip flirt sexy
🫅 person crown monarch
🫃 pregnant man belly
🫄 pregnant person belly
🧌 troll monster creature
🪸 coral reef ocean
🪷 lotus flower bloom
🪹 empty nest bird
🪺 nest eggs bird
🫘 beans legumes food
🫗 pouring liquid spill
🫙 jar glass container
🛝 playground slide fun
🛞 wheel tire car
🛟 ring buoy lifebuoy
🪬 hamsa protection amulet
🪩 mirror ball disco
🪫 low battery empty
🩼 crutch mobility aid
🩻 xray skeleton medical
🫧 bubbles soap foam
🪪 identification card id
🟰 heavy equals sign math