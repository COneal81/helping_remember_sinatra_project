doug = User.create(username: "dougp210", email: "doug@doug.com", password_digest: "doug")

oma = User.create(username: "francinesgarden", email: "oma@oma.com", password_digest: "oma")

hob = Category.create(name: "Hobbies")

family  = Category.create(name: "Family")

Memory.create(title: "Airplane", description: "You once owned a Cesna P210 airplane that you enjoyed flying 
    with you son Pete. Pete flew your wife Carlijn and daughter Kari to Disney World.  You also used to fly to 
    Oklahoma City for Metal Container.  Once you flew over the crater and took pictures while the plane was on autopilot.", 
    date: "1995 - 2001", image_url: "www.pics.com/dougp210" , user_id: "doug.id", category_id: "hob.id")

Memory.create(title: "Kari - Daughter", description: "You have one daughter, named Kari.  She lives on a farm and enjoys 
    showing horses.  She is currently attending The Flatiorn School, where she is learning to be a web developer.", 
    date: "July 5, 1981", image_url: "www.pics.com/doug/kari" , user_id: "doug.id", category_id: "family.id")

Memory.create(title: "Hidden Garden", description: "At your home on Park Road in Oakwood, you used to have an area at the very
    back of your property that you called the Hidden Garden.  You would drive the golf cart to get there and spend hours planting 
    and maaintaining it.  This is also where your son Bill was married to Hollie.", date: "1975 - 1998", image_url: 
    "www.pics.com/oma/hidden_garden", user_id: "oma.id", category_id: "hob.id")

