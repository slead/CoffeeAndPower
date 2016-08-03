users = User.create([{name: 'Steve', email: 'admin@gmail.com', password: 'password', id: 1}])
cafes = Cafe.create!([
{
  name:'Volunteer Park Cafe',
  address:'1501 17th Ave E, , Seattle, WA',
  description:'Good number of outlets. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Porchlight Coffee & Records',
  address:'1517 14th Ave 14th and Pike, Seattle, WA',
  description:'Plenty of outlets. Free Wi-Fi, password taped to the tables.',
  user_id:1
},{
  name:'Motore Coffee',
  address:'1904 9th Ave, , Seattle, WA',
  description:'Plenty of Plugs. They have Mac computers if you forget yours. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Caffé Vita',
  address:'1005 E Pike St, , Seattle, WA',
  description:'Plugs on 1st and 2nd floor. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Bauhaus Books & Coffee',
  address:'414 E Pine St, Seattle, WA',
  description:'Plenty of outlets. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Victrola Coffee Roasters (Amazon Campus)',
  address:'500 Boren Ave N,  Seattle, WA',
  description:'Good number of outlets. No Wi-Fi available on weekends. Ask for free Wi-Fi password at the counter.',
  user_id:1
},{
  name:'Arabica Lounge',
  address:'1550 E Olive Way, Seattle, WA',
  description:'Plenty of power outlets. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Neptune Coffee',
  address:'8415 Greenwood Ave N, , Seattle, WA',
  description:'Plenty of outlets.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Ada\'s Technical Books and Cafe',
  address:'425 15th Ave E,  Seattle, WA',
  description:'Multiple plugs for every table and bench!  Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Diva Espresso - Highlands',
  address:'14419 Greenwood Ave N, Seattle, WA',
  description:'Plugs and power bars near the front tables and the back couches.  Free Wi-Fi, password by the cash register.',
  user_id:1
},{
  name:'Fuel Coffee',
  address:'1705 N 45th St, Seattle, WA',
  description:'Plugs mostly in the back room.  Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Zoka Coffee',
  address:'351 Boren Ave N, , Seattle, WA',
  description:'Plenty of plugs all around.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Espresso Vivace',
  address:'227 Yale Ave N btw John & Thomas, Seattle, WA',
  description:'Plenty of power outlets.  Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Ace Hotel Lobby Bar',
  address:'16 W 29th St,  New York, NY',
  description:'Free Wi-Fi. Plugs around the communal tables. Grab your coffee at Stumptown Coffee Roasters near the entrance on 29th.',
  user_id:1
},{
  name:'Brooklyn Roasting Company',
  address:'25 Jay St,  Brooklyn, NY',
  description:'Plugs scattered about. (As of Mar 2014) Wi-Fi Network: Brooklyn Wi-Fi password): Roasting',
  user_id:1
},{
  name:'Think Coffee',
  address:'248 Mercer St,  New York, NY',
  description:'Plugs scattered around the walls, behind the tables. Wi-Fi Password: Think',
  user_id:1
},{
  name:'Telegraphe Café',
  address:'107 W 18th St, , New York, NY',
  description:'Plugs behind every table. Wi-Fi password: 2124885810',
  user_id:1
},{
  name:'Black Brick',
  address:'300 Bedford Ave,  Brooklyn, NY',
  description:'Lots of outlets and plenty of seats. Wi-Fi password: extrashot',
  user_id:1
},{
  name:'Whynot Bistro',
  address:'14 Christopher St, , New York, NY',
  description:'Plenty of outlets. Strong Wi-Fi. Password: whynotcoffeenyc',
  user_id:1
},{
  name:'Variety',
  address:'368 Graham Ave,  Brooklyn, NY',
  description:'Plenty of outlets. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Atlas Café',
  address:'116 Havemeyer St, , Brooklyn, NY',
  description:'Plenty of outlets. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Stumptown Coffee Roasters',
  address:'18 W 29th St, , New York, NY',
  description:'Plenty of outlets. Wi-Fi password marked at every table.',
  user_id:1
},{
  name:'Kinship Coffee Cooperative',
  address:'30-05 Steinway St 30th Av, Astoria, NY',
  description:'Limited plugs.  Free Wi-Fi, no password required.',
  user_id:1
},{
  name:'The Bean',
  address:'147 1st Ave, , New York, NY',
  description:'Outlets at nearly every table.  Free Wi-Fi, no password required.',
  user_id:1
},{
  name:'Whynot Coffee',
  address:'175 Orchard St,  New York, NY',
  description:'Power outlets under single tables.  Wi-Fi password: whynotcoffeenyc',
  user_id:1
},{
  name:'AP Café',
  address:'420 Troutman St Wyckoff Ave., Brooklyn, NY',
  description:'Power outlets along the wall.  Wi-Fi password: bravestreet',
  user_id:1
},{
  name:'Pushcart Coffee',
  address:'399 W 25th St, , New York, NY',
  description:'Plenty of outlets.  Free Wi-Fi, no password required.',
  user_id:1
},{
  name:'Coffee Foundry',
  address:'186 W 4th St,  New York, NY',
  description:'Power outlets galore inside and above pullout seats.  Wi-Fi password: coffeefoundry',
  user_id:1
},{
  name:'Baked In Brooklyn',
  address:'755 5th Ave, , Brooklyn, NY',
  description:'Plenty of plugs.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Hu Kitchen',
  address:'78 5th Ave, , New York, NY',
  description:'Plugs upstairs. Fast Wi-Fi. Wi-Fi password: hukitchen',
  user_id:1
},{
  name:'NeueHouse',
  address:'110 E 25th St Park Avenue, New York, NY',
  description:'Great place for working. Lots of plugs everywhere. Grab the Wi-Fi password at the counter when you walk in.',
  user_id:1
},{
  name:'Berkli Parc',
  address:'63 Delancey St, , New York, NY',
  description:'Laptops limited to the communal table, where you will find power outlets.  Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'61 Local',
  address:'61 Bergen St, , Brooklyn, NY',
  description:'Multiple outlets on the wall behind the bar area.  Wi-Fi password: drinklocal',
  user_id:1
},{
  name:'Spreadhouse Coffee',
  address:'116 Suffolk St,  New York, NY',
  description:'Floor plugs by the communal seating area.  Wi-Fi password: 116suffolk',
  user_id:1
},{
  name:'The West—Coffeehouse & Bar',
  address:'379 Union Ave, , Brooklyn, NY',
  description:'Plugs against the back wall.  Wi-Fi password: thewestbrooklyn',
  user_id:1
},{
  name:'Tasty Cafe',
  address:'126 Madison Ave,  New York, NY',
  description:'Plugs against the back wall.  Wi-Fi password: Tasty',
  user_id:1
},{
  name:'Wired Puppy',
  address:'250 Newbury St,  Boston, MA',
  description:'Outlets everywhere. Computers for use. Wi-Fi password: espresso',
  user_id:1
},{
  name:'Render Coffee',
  address:'563 Columbus Ave, , Boston, MA',
  description:'Lots of outlets near tables. Wi-Fi password: coffeetime',
  user_id:1
},{
  name:'Equal Exchange Cafe',
  address:'226 Causeway St, , Boston, MA',
  description:'Plugs along the walls. Wi-Fi password: fair trade',
  user_id:1
},{
  name:'Darwin\'s Ltd.',
  address:'1629 Cambridge St Roberts Rd., Cambridge, MA',
  description:'Plugs and power strips available. Wi-Fi password: avocados',
  user_id:1
},{
  name:'Caffè Nero',
  address:'560 Washington Street, Boston, MA',
  description:'Plugs along the walls. Very spacious. Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Barrington Coffee Roasting Company',
  address:'346 Congress St Farnsworth Street, Boston, MA',
  description:'Plugs along the walls. Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Flat Black Coffee Company',
  address:'50 Broad St, , Boston, MA',
  description:'Easy to access outlets. Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Cafenation',
  address:'380 Washington St,  Brighton, MA',
  description:'Power outlets with large tables in the back.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Bourbon Coffee MA',
  address:'1815 Massachusetts Ave, Cambridge, MA',
  description:'Plugs at almost every table.  Wi-Fi password: crop2cup',
  user_id:1
},{
  name:'Darwin\'s Ltd.',
  address:'148 Mount Auburn St Ash St., Cambridge, MA',
  description:'Plugs under the bench and at the high table in the back. Wi-Fi password: avocados',
  user_id:1
},{
  name:'Tamper',
  address:'340 Boston Ave, Medford, MA',
  description:'Power outlets along the front wall and under the padded bench.      Wi-Fi password: tamper1',
  user_id:1
},{
  name:'Danish Pastry House',
  address:'330 Boston Ave Winthrop, Medford, MA',
  description:'A few power outlets.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'arts at the armory cafe',
  address:'191 Highland Ave #1b, Somerville, MA 02143, Somerville, MA',
  description:'A few scattered power outlets.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Epicenter Cafe',
  address:'764 Harrison St,  San Francisco, CA',
  description:'Plugs everywhere. Free Wi-Fi. Code gives 2 hours (but you can get new codes when your time runs out).',
  user_id:1
},{
  name:'Philz Coffee',
  address:'748 Van Ness Ave, , San Francisco, CA',
  description:'Plugs. Free Wi-Fi.',
  user_id:1
},{
  name:'Cafe St. Jorge',
  address:'3438 Mission St Kingston, San Francisco, CA',
  description:'Plugs along left side of wall. Wi-Fi password: iloveportugal',
  user_id:1
},{
  name:'Jane',
  address:'2123 Fillmore St,  San Francisco, CA',
  description:'Plenty of outlets. Wi-Fi password: muffintop',
  user_id:1
},{
  name:'Mercury Cafe',
  address:'201 Octavia St, , San Francisco, CA',
  description:'Plenty of outlets. Super fast Wi-Fi. Password: coffeeandpie',
  user_id:1
},{
  name:'Stanza Coffee',
  address:'3126 16th St, San Francisco, CA',
  description:'Plugs at every booth. Wi-Fi password: ilovebacon',
  user_id:1
},{
  name:'Cafe XO',
  address:'1799 Church St, , San Francisco, CA',
  description:'Plenty of power outlets. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Coffee Bar',
  address:'1890 Bryant St, , San Francisco, CA',
  description:'Plugs everywhere. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Haus Coffee',
  address:'3086 24th St, , San Francisco, CA',
  description:'Lots of power outlets.  Free Wi-Fi, password on the cash register.',
  user_id:1
},{
  name:'Workshop Cafe',
  address:'180 Montgomery St Ste 100, , San Francisco, CA',
  description:'Power plugs galore, and lots of extension cords.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'901 Columbus Caffe',
  address:'901 Columbus Ave, , San Francisco, CA',
  description:'Lots of power outlets.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Joy\'s Place',
  address:'611 Post St, , San Francisco, CA',
  description:'Lots of power outlets.  Wi-Fi password: john611post',
  user_id:1
},{
  name:'The Coffee Bean & Tea Leaf®',
  address:'4360 E. Main St. Ste. 3, , Ventura, CA',
  description:'Plenty of outlets along the walls. Wi-fi password on flatscreen gives you access for 2 hours.',
  user_id:1
},{
  name:'Bean Town Coffee House & Bakery',
  address:'45 N Baldwin Ave, Sierra Madre, CA',
  description:'Plenty of outlets along the walls. Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Chatime',
  address:'301 W Valley Blvd. #102, San Gabriel, CA',
  description:'Outlets along the right wall. This tea room only serves coffee, tea or smoothies. Free Wi-Fi, password posted by the register.',
  user_id:1
},{
  name:'Pencil Cafe',
  address:'12 Harkness Ave Colorado, Pasadena, CA',
  description:'A couple outlets throughout. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Panera Bread',
  address:'3521 E Foothill Blvd, Pasadena, CA',
  description:'Plenty of plugs.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Bricks & Scones',
  address:'403 N Larchmont Blvd,  Los Angeles, CA',
  description:'Lots of power outlets and seating.  Wi-Fi network: bricksandscones Wi-Fi password: bricksandscones',
  user_id:1
},{
  name:'Highland Cafe',
  address:'5010 York Blvd, Los Angeles, CA',
  description:'Lots of power outlets.  Wi-Fi password: highland',
  user_id:1
},{
  name:'Farley\'s East',
  address:'33 Grand Ave Broadway, Oakland, CA',
  description:'Plenty of outlets.  Wi-Fi password: farleyscoffee',
  user_id:1
},{
  name:'Red Rock Coffee',
  address:'201 Castro St, , Mountain View, CA',
  description:'Many power outlets all around.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Akasha',
  address:'9543 Culver Blvd, , Culver City, CA',
  description:'Plugs all along the walls and behind the couch.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'TOMS Flagship',
  address:'1344 Abbot Kinney Blvd Andalusia Ave, Venice, CA',
  description:'Great place to enjoy a coffee, get work done, or buy shoes!  Plenty of plugs by the tables or couches.  Wi-Fi network: TOMS-GUEST.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Good Karma',
  address:'928 Pine St, , Philadelphia, PA',
  description:'Plenty of outlets. Wi-Fi password: 77777777',
  user_id:1
},{
  name:'Elixr Coffee Roasters',
  address:'207 S Sydenham St,  Philadelphia, PA',
  description:'Plenty of outlets. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Chestnut Hill Coffee Co.',
  address:'8620 Germantown Ave, Philadelphia, PA',
  description:'Lots of outlets. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Milkcrate Cafe',
  address:'400 E Girard Ave, , Philadelphia, PA',
  description:'Lots of room, but few plugs. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'OCF Coffee House',
  address:'2100 Fairmount Ave, , Philadelphia, PA',
  description:'Lots of seats, but few plugs. Wi-Fi password: brunchallday',
  user_id:1
},{
  name:'Volunteer Park Cafe',
  address:'1501 17th Ave E, , Seattle, WA',
  description:'Good number of outlets. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Porchlight Coffee & Records',
  address:'1517 14th Ave 14th and Pike, Seattle, WA',
  description:'Plenty of outlets. Free Wi-Fi, password taped to the tables.',
  user_id:1
},{
  name:'Motore Coffee',
  address:'1904 9th Ave, , Seattle, WA',
  description:'Plenty of Plugs. They have Mac computers if you forget yours. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Caffé Vita',
  address:'1005 E Pike St, , Seattle, WA',
  description:'Plugs on 1st and 2nd floor. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Bauhaus Books & Coffee',
  address:'414 E Pine St, Seattle, WA',
  description:'Plenty of outlets. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Victrola Coffee Roasters (Amazon Campus)',
  address:'500 Boren Ave N,  Seattle, WA',
  description:'Good number of outlets. No Wi-Fi available on weekends. Ask for free Wi-Fi password at the counter.',
  user_id:1
},{
  name:'Arabica Lounge',
  address:'1550 E Olive Way, Seattle, WA',
  description:'Plenty of power outlets. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Neptune Coffee',
  address:'8415 Greenwood Ave N, , Seattle, WA',
  description:'Plenty of outlets.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Ada\'s Technical Books and Cafe',
  address:'425 15th Ave E,  Seattle, WA',
  description:'Multiple plugs for every table and bench!  Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Diva Espresso - Highlands',
  address:'14419 Greenwood Ave N, Seattle, WA',
  description:'Plugs and power bars near the front tables and the back couches.  Free Wi-Fi, password by the cash register.',
  user_id:1
},{
  name:'Fuel Coffee',
  address:'1705 N 45th St, Seattle, WA',
  description:'Plugs mostly in the back room.  Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Zoka Coffee',
  address:'351 Boren Ave N, , Seattle, WA',
  description:'Plenty of plugs all around.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Espresso Vivace',
  address:'227 Yale Ave N btw John & Thomas, Seattle, WA',
  description:'Plenty of power outlets.  Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Zanzibar',
  address:'1036 W Bryn Mawr Ave, , Chicago, IL',
  description:'Lots of seating, but few plugs. Wi-Fi password: peppermint',
  user_id:1
},{
  name:'Ipsento Coffee House',
  address:'2035 N Western Ave, , Chicago, IL',
  description:'Few power outlets. Wi-Fi password: wonderland',
  user_id:1
},{
  name:'Gaslight Coffee Roasters',
  address:'2385 N Milwaukee Ave, , Chicago, IL',
  description:'A couple scattered outlets. Wi-Fi password: DavidDuchovny',
  user_id:1
},{
  name:'Chicago Grind',
  address:'5256 N Broadway St, , Chicago, IL',
  description:'Plenty of outlets. Super fast, free Wi-Fi - password not required.',
  user_id:1
},{
  name:'Dollop Coffee & Tea',
  address:'345 E Ohio St, , Chicago, IL',
  description:'Outlets everywhere, extension cords available. Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'The Brothers K Coffeehouse',
  address:'500 Main St, , Evanston, IL',
  description:'Few outlets. Free Wi-Fi, password written on chalkboard.',
  user_id:1
},{
  name:'The Wormhole Coffee',
  address:'1462 N Milwaukee Ave, , Chicago, IL',
  description:'Outlets everywhere. Super fast, free Wi-Fi - password not required.',
  user_id:1
},{
  name:'Intelligentsia Coffee',
  address:'53 E Randolph St,  Chicago, IL',
  description:'Few plugs. Wi-Fi password: intelligentsia',
  user_id:1
},{
  name:'Bridgeport Coffee Company',
  address:'3101 S Morgan St, , Chicago, IL',
  description:'Few outlets.  Wi-Fi network: BADGUYS, Wi-Fi password: clinteastwood',
  user_id:1
},{
  name:'Next Door',
  address:'659 W Diversey Pkwy, Chicago, IL',
  description:'Lots of power outlets, and lots of seating.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Buzz: Killer Espresso',
  address:'1644 N Damen Ave, , Chicago, IL',
  description:'Plenty of plugs all around.  Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Grind Cafe Co',
  address:'4613 N Lincoln Ave, Chicago, IL',
  description:'Plugs along the brick wall.  Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'St. Mark\'s Coffee House',
  address:'2019 E 17th Ave,  Denver, CO',
  description:'Power outlets all around.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Bardo Coffee House',
  address:'238 S Broadway Alameda, Denver, CO',
  description:'Plugs near every table.  Wi-Fi password: electricity',
  user_id:1
},{
  name:'Corvus Coffee',
  address:'1740 S Broadway Colorado, Denver, CO',
  description:'Plugs scattered around.  Free Wi-Fi, Wi-Fi password: southbroadway',
  user_id:1
},{
  name:'Steam',
  address:'1801 S Pearl St Pearl & Colorado Ave., Denver, CO',
  description:'Plenty of outlets.  Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Stella\'s Coffeehaus',
  address:'1476 S Pearl St, , Denver, CO',
  description:'Plugs in every room on every wall.  Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Southside Espresso',
  address:'904 Westheimer Rd Ste C, , Houston, TX',
  description:'Few plugs.  Wi-Fi password: Goodwifi/Bettercoffee',
  user_id:1
},{
  name:'Blacksmith',
  address:'1018 Westheimer Rd, , Houston, TX',
  description:'Power outlets at the bar by the window.  Wi-Fi password: BISCUITS',
  user_id:1
},{
  name:'Siphon Coffee',
  address:'701 W Alabama St Greely St., Houston, TX',
  description:'Plenty of plugs all around.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Black Hole',
  address:'4504 Graustark St Castle Ct, Houston, TX',
  description:'Several plugs.  Wi-Fi password: blackholeguest',
  user_id:1
},{
  name:'Inversion Coffee House',
  address:'1953 Montrose Blvd, , Houston, TX',
  description:'Plenty of tables with power outlets.  Free Wi-Fi.  Password written at bottom of receipt.',
  user_id:1
},{
  name:'Boomtown Coffee',
  address:'242 W 19th St, Houston, TX',
  description:'Lots of outlets and places to sit.  Wi-Fi password: decafisevil',
  user_id:1
},{
  name:'Tout Suite',
  address:'2001 Commerce St, Houston, TX',
  description:'Outlets at almost every table.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Kafka’s Coffee & Tea',
  address:'2525 Main St, , Vancouver, BC',
  description:'A few scattered plugs. Wi-Fi password: espresso',
  user_id:1
},{
  name:'Greenhorn Cafe',
  address:'994 Nicola St, , Vancouver, BC',
  description:'A few plugs. Wi-Fi password: 994nicola',
  user_id:1
},{
  name:'49th Parallel & Lucky\'s Doughnuts',
  address:'2902 Main St, , Vancouver, BC',
  description:'Best doughnuts you\'ll ever taste. Plugs all along the communal table. Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Matchstick Coffee Roasters',
  address:'213 E Georgia St, , Vancouver, BC',
  description:'A few power outlets. Free Wi-Fi, password not required',
  user_id:1
},{
  name:'Waves Coffee House',
  address:'1198 W Pender St., , Vancouver, BC',
  description:'Plugs below the seating along the walls and windows.  Wi-Fi password: 6045680390',
  user_id:1
},{
  name:'Wicked Cafe',
  address:'1399 W 7th Ave, , Vancouver, BC',
  description:'Plenty of power outlets scattered throughout.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Lili & Oli',
  address:'2515, rue Notre-Dame O. Charlevoix, Montreal, QC',
  description:'Multiple plugs against the walls. Wi-Fi password: 5149328961',
  user_id:1
},{
  name:'Café Différance',
  address:'449 ave. Viger Ouest entre St-Alexandre & Beaver Hall, Montreal, QC',
  description:'One plug near the front window. Wi-Fi password: espresso',
  user_id:1
},{
  name:'Caffè in Gamba',
  address:'5263 ave. Du Parc entre Fairmount & St-Viateur, Montreal, QC',
  description:'Multiple plugs against the walls. Wi-Fi password: metropolis',
  user_id:1
},{
  name:'Pikolo Espresso Bar',
  address:'3418B, av. du Parc coin Sherbrooke, Montreal, QC',
  description:'Plugs all along the walls. Wi-Fi Password: espresso',
  user_id:1
},{
  name:'Kitsuné Espresso Bar Artisanal',
  address:'19 rue Prince Arthur Ouest entre St-Laurent & Clark, Montreal, QC',
  description:'Plugs under the tables. Wi-Fi Network: Kitsune Wi-Fi Password: 5145072055',
  user_id:1
},{
  name:'Café Humble Lion',
  address:'904, rue Sherbrooke Ouest entre McGill College & Mansfield, Montreal, QC',
  description:'Plugs galore. Wi-Fi Password: humblelion904',
  user_id:1
},{
  name:'Saint-Henri micro-torréfacteur',
  address:'3632 rue Notre-Dame Ouest coin Bourget, Montreal, QC',
  description:'Plugs against the walls. wifi: schmit password: godshot1',
  user_id:1
},{
  name:'Café Plume',
  address:'123 Mont-Royal Ouest Av. De L\'Esplanade, Montreal, QC',
  description:'Power plugs underneath the booths along the wall.  Wi-Fi password: streetlevel',
  user_id:1
},{
  name:'Café Aunja',
  address:'1448 Sherbrooke West, Montreal, QC',
  description:'Power plugs along the wall with plenty of extension cords.  Wi-Fi password: gingetea',
  user_id:1
},{
  name:'Kahwa Café',
  address:'263, av. du Mont-Royal Est, Montreal, QC',
  description:'Multiple plugs in the back on both sides of the room.  Network: ilesansfilkahwa.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Melk Bar à café',
  address:'5612 Monkland Ave Btw avenue Oxford & Marcil, Montreal, QC',
  description:'Plenty of plugs scattered all around.  Wi-Fi password: Baracafe',
  user_id:1
},{
  name:'Le Couteau / The Knife',
  address:'4627 rue Saint-Denis coin Bienville, Montreal, QC',
  description:'Lots of plugs everywhere, especially under the two large tables.  Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Station W',
  address:'3852, rue Wellington, Verdun, QC',
  description:'Plugs along several walls.  Power bars under large communal table.  Wi-Fi password: ilovestationw',
  user_id:1
},{
  name:'Cafe Novo',
  address:'1986 Bloor st w, , Toronto, ON',
  description:'Plenty of outlets. Free Wi-Fi , password not required.',
  user_id:1
},{
  name:'The Good Neighbour',
  address:'238 Annette St, , Toronto, ON',
  description:'Decent amount of outlets. Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'The Rooster Coffee House',
  address:'479 Broadview Ave Riverdale Avenue, Toronto, ON',
  description:'Plenty of plugs, and you can run a tab here. Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Dineen Coffee',
  address:'140 Yonge St, , Toronto, ON',
  description:'A few outlets. Wi-Fi password: 140dineen',
  user_id:1
},{
  name:'The Black Canary Espresso Bar',
  address:'61 Sherbourne St., Toronto, ON',
  description:'Several plugs along the walls. Wi-Fi password: nutellalatte',
  user_id:1
},{
  name:'RSquared Cafe',
  address:'668 Queen St West,  Toronto, ON',
  description:'Plenty of outlets. Wi-Fi password: password',
  user_id:1
},{
  name:'Early Bird Espresso & Brew Bar',
  address:'613 Queen St W,  Toronto, ON',
  description:'A few plugs. Wi-Fi password: getcoffee',
  user_id:1
},{
  name:'Jimmy\'s Coffee',
  address:'82 Gerrard Street W Gerrard & LaPlante, Toronto, ON',
  description:'Few power outlets.  Wi-Fi password:  welovecoffee',
  user_id:1
},{
  name:'Propeller Coffee Co.',
  address:'50 Wade Ave, Toronto, ON',
  description:'Plenty of plugs scattered throughout.  Wi-Fi password: Ethiopia2015',
  user_id:1
},{
  name:'Capital Espresso And Pastries',
  address:'1349 Queen St W, , Toronto, ON',
  description:'Plenty of plugs along the walls.  Free Wi-Fi, password written on chalkboard.',
  user_id:1
},{
  name:'Analog Coffee',
  address:'740 17th Avenue SW, Calgary, AB',
  description:'2 sets of plugs under each of the counters along the windows. Wi-Fi password: 87654321',
  user_id:1
},{
  name:'Good Earth Coffeehouse & Bakery',
  address:'332 Aspen Glen Landing SW, Calgary, AB',
  description:'Several power outlets along the walls. Wi-Fi network: #Telus. Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Waves Coffee House',
  address:'1019 17 Ave SW, , Calgary, AB',
  description:'Plenty of outlets along the walls. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Phil & Sebastian Coffee Roasters',
  address:'2207 4th Street SW 22nd Avenue SW, Calgary, AB',
  description:'Plugs by the windows and at the community table. Wi-Fi network: Phil and Sebastian. Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Cafe Rosso',
  address:'803 24 Ave SE',
  description:'Plenty of outlets along the walls. Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Phil & Sebastian Coffee Roasters',
  address:'2043 33 Ave SW, , Calgary, AB',
  description:'Plugs in the corner by the main counter at the window. Plugs underneath the cushions at some spots along the main benches. Wi-Fi network: Phil and Sebastian. Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Prufrock Coffee',
  address:'23-25 Leather Ln, London, Greater London',
  description:'Get there first. Only one plug near the front door. Wi-Fi password: espresso',
  user_id:1
},{
  name:'Ozone Coffee Roasters',
  address:'11 Leonard St, London, Greater London',
  description:'Lots of plugs. Wi-Fi password: lovecoffee',
  user_id:1
},{
  name:'Look Mum No Hands!',
  address:'125-127 Mare St, , Hackney, Greater London',
  description:'Big space with lots of plugs near the tables in the back. Good coffee/food and local beer on tap. Wi-Fi password: handlebars',
  user_id:1
},{
  name:'Ace Hotel',
  address:'100 Shoreditch High St, Shoreditch, Greater London',
  description:'Plugs everywhere. Big space. Free Wi-Fi.',
  user_id:1
},{
  name:'Fleet River Bakery',
  address:'71 Lincoln\'s Inn Fields Gate St, Holborn, Greater London',
  description:'Several plugs around the venue. Wi-Fi network is \'Purple\'—no password',
  user_id:1
},{
  name:'Foxcroft & Ginger',
  address:'68-89 Mile End Rd, Whitechapel, Greater London',
  description:'Large meeting/event area that can be booked out. Free Wi-Fi.',
  user_id:1
},{
  name:'Tapped & Packed No. 193',
  address:'193 Wardour St,  Soho, Greater London',
  description:'Small tables for working. Wi-Fi is bthub3-qrts pass: 957b58aa33',
  user_id:1
},{
  name:'Timberyard',
  address:'61-67 Old St Central St, London, Greater London',
  description:'Plenty of power outlets, tables and lockers.  Free and fast Wi-Fi, password not required.',
  user_id:1
},{
  name:'Vagabond N7',
  address:'105 Holloway Rd, Highbury, Greater London',
  description:'Few power plugs.  Free Wi-Fi, ask for password at the counter.',
  user_id:1
},{
  name:'Cafe 1001',
  address:'91 Brick Ln, Spitalfields, Greater London',
  description:'Free Wi-Fi. No password. Lots of seating upstairs with plugs.',
  user_id:1
},{
  name:'London Grind',
  address:'2 London Bridge, London, Greater London',
  description:'Power outlet at every table.  Free Wi-Fi, password not required.',
  user_id:1
},{
  name:'Eslite Tea Room',
  address:'9/F, Hysan Place, 500 Hennessy Rd, 铜锣湾',
  description:'Few plugs.  Network: HK-tearoom, Wi-Fi password: K9tp-cyk2-ghvz',
  user_id:1
},{
  name:'Holly Brown',
  address:'22 Stanley St, 中環, 中西區',
  description:'Plugs on second floor.  Wi-Fi password at bottom of receipt.',
  user_id:1
},{
  name:'The Coffee Academics',
  address:'G/F, 38 Yiu Wa St, 铜锣湾',
  description:'Few plugs.  Wi-Fi password:  academics',
  user_id:1
},{
  name:'caffè HABITŪ the table',
  address:'Unit UG-19, Festival Walk, 80 Tat Chee Ave, 九龙塘',
  description:'Few plugs.  Wi-Fi password:  ilovehabitu',
  user_id:1
},{
  name:'Hazel & Hershey',
  address:'69 Peel St, 中環, 中西區',
  description:'Scattered plugs.  Wi-Fi password:  thankyou',
  user_id:1
},{
  name:'Wired Café',
  address:'Unit 1403-1404, 14/F, Hysan Place, 500 Hennessy Rd, 铜锣湾',
  description:'Few outlets.  Free unlimited coffee refills.  Wi-Fi password: 23318315',
  user_id:1
},{
  name:'Café Corridor',
  address:'G/F, 26A Russell St, 铜锣湾',
  description:'Lots of scattered outlets.  Free Wi-Fi, no password required.',
  user_id:1
},{
  name:'Fuel Espresso',
  address:'Shop 3023, 3/F, IFC Mall, 1 Harbour View St, 中環, 中西區',
  description:'Lots of power outlets.  Free Wi-Fi, no password required.',
  user_id:1
},{
  name:'Coffice',
  address:'Tjärhovsgatan 5, Stockholm, Storstockholm',
  description:'Plugs available at every table.  Wi-Fi password: coffice55',
  user_id:1
},{
  name:'J&N at Work',
  address:'Hantverkargatan 7 Skillinggränd, Stockholm, Storstockholm',
  description:'Lots of plugs all around.  Wi-Fi password: battrekaffeatfolket',
  user_id:1
},{
  name:'Johan & Nyström',
  address:'Swedenborgsgatan 7 Maria Prästgårdsgata, Stockholm, Storstockholm',
  description:'Power outlets at every corner.  Wi-Fi password: coffeepeople',
  user_id:1
},{
  name:'Drop Coffee',
  address:'Wollmar Yxkullsgatan 10 Swedenborgsgatan, Stockholm, Storstockholm',
  description:'Several power outlets all around.  Wi-Fi password: guatemala',
  user_id:1
},{
  name:'Il Caffè',
  address:'Södermannagatan 23, Stockholm, Storstockholm',
  description:'Plugs all along under the sofas.  Wi-Fi password: ilcaffelovesyou',
  user_id:1
}])
