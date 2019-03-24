require_relative('../models/member')
require_relative('../models/session')


Session.delete_all()
Member.delete_all()


session1 = Session.new({
  'name' => 'Yoga',
  'intensity' => 3,
  'capacity' => 5
  })
session1.save()
session1.name = "Spin Class"
session1.update

session2 = Session.new({
  'name' => 'Body Combat',
  'intensity' => 4,
  'capacity' => 5
  })
session2.save()

session3 = Session.new({
  'name' => 'Tai Chi',
  'intensity' => 2,
  'capacity' => 5
  })
session3.save()

session4 = Session.new({
  'name' => 'One 2 One',
  'intensity' => 3,
  'capacity' => 1
  })
session4.save()

member1 = Member.new({
  'first_name' => 'Ross',
  'last_name' => 'Greer',
  'age' => 24,
  'fitness_level' => 3
  })
member1.save()

member2 = Member.new({
  'first_name' => 'Janet',
  'last_name' => 'Rose',
  'age' => 36,
  'fitness_level' => 2
  })
member2.save()

member3 = Member.new({
  'first_name' => 'Jacob',
  'last_name' => 'Styles',
  'age' => 22,
  'fitness_level' => 4
  })
member3.save()

member4 = Member.new({
  'first_name' => 'Mary',
  'last_name' => 'Orr',
  'age' => 29,
  'fitness_level' => 3
  })
member4.save()
