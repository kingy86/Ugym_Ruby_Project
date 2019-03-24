require_relative('../models/member')
require_relative('../models/session')

session1 = Session.new({
  'name' => 'Yoga',
  'intensity' => 3,
  'capacity' => 5
  })
session1.save()

session2 = Session.new({
  'name' => 'Body Combat',
  'intensity' => 4,
  'capacity' => []
  })
session2.save()

session3 = Session.new({
  'name' => 'Tai Chi',
  'intensity' => 2,
  'capacity' => []
  })
session3.save()

session4 = Session.new({
  'name' => 'One 2 One',
  'intensity' => 3,
  'capacity' => []
  })
session4.save()
