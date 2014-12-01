# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

courses = Course.create([
	{ name: 'sustainable-development', title: 'Sustainable Development', description: 'In this class we cover three of the United Nations Sustainable Development Goals. The student’s vote on the topics they wish to cover. The class is project driven and students are empowered to complete a project in their local community', start: '2015-01-05', end: '2015-02-09', schedule_notes: 'Requires a commitment of 3-6 hours weekly from participating students.', price: 30, paylink: '', status: 'v2', order: 10},
	{ name: 'international-politics', title: 'Contemporary Issues in International Politics and Human Rights', description: 'Contemporary Issues in Human Rights class we aim to look contemporary cases of struggles for rights as well as recent cases of human rights abuses and reflect on how we, as a global community, can be a force of positive change.', start: '2015-01-05', end: '2015-02-09', schedule_notes: 'Requires a commitment of 3-6 hours weekly from participating students.', price: 30, paylink: '', status: 'new', order: 20},
	{ name: 'social-entrepreneurship', title: 'Social Entrepreneurship - Innovative Solutions to Social Problems', description: 'The Entrepreneurship class is a very hands-on class, in which students are provided with information about some the skills needed to setup up a project, social venture or business.', start: '2015-01-05', end: '2015-02-09', schedule_notes: 'Requires a commitment of 3-6 hours weekly from participating students.', price: 30, paylink: '', status: 'new', order: 30}])