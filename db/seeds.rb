# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

courses = Course.create([
	{ name: 'sustainable-development', title: 'Sustainable Development', description: '<p class="punchline">Are you sick and tired of hearing how ‘messed up’ the world is, without being given the tools to change it? Then you found the right place!</p>
		<p>The Sustainable Development class is the first class created by Our Common Future and Online UWC. During the 5-week online class, we cover three of the United Nations Sustainable Development Goals. The topics covered constantly change, because you, the student vote on the topics you want us to cover when you sign up– this means that you as a student has huge influence over what you learn. In addition to taking a closer look at Sustainable Development, this class is project driven, which means that students are empowered to complete a project in their local community. But don’t worry; we will help you with everything from a great idea to how to implement it. To see examples for projects created by former students, please visit <a href="http://www.ocf.co/projects/">www.ocf.co/projects/</a></p>
		<p>This class is offered in 3 different time zones, with a slightly different curriculum designed to ensure that students gain knowledge about both global and local issues in Sustainable Development. Video lectures from other time zones can be viewed free of charge on our YouTube channel, so if a topic you are interested in is investigated in a different region, you can still watch it!</p>', start: '2015-01-05', end: '2015-02-09', schedule_notes: 'Requires a commitment of 3-6 hours weekly from participating students.', price: 30, paylink: '', status: 'v2', order: 10, details: '<h3 class="log-name">Class overview</h3>
		<ol>
		<li>Week: Introduction to Sustainable Development</li>
		<li>Week: Topic related to Sustainable Development picked by the students</li>
		<li>Week: Topic related to Sustainable Development picked by the students</li>
		<li>Week: Topic related to Sustainable Development picked by the students</li>
		<li>Week: Community project week</li>
		</ol>

		<p>For reference, the 17 Sustainable Development Goals are:</p>
		<ol>
		 <li>End poverty in all its forms everywhere</li>
		 <li>End hunger, achieve food security and improved nutrition, and promote sustainable agriculture</li>
		 <li>Ensure healthy lives and promote well-being for all at all ages</li>
		 <li>Ensure inclusive and equitable quality education and promote life-long learning opportunities for all</li>
		 <li>Achieve gender equality and empower all women and girls</li>
		 <li>Ensure availability and sustainable management of water and sanitation for all</li>
		 <li>Ensure access to affordable, reliable, sustainable, and modern energy for all</li>
		 <li>Promote sustained, inclusive and sustainable economic growth, full and productive employment and decent work for all</li>
		 <li>Build resilient infrastructure, promote inclusive and sustainable industrialization and foster innovation</li>
		 <li>Reduce inequality within and among countries</li>
		 <li>Make cities and human settlements inclusive, safe, resilient and sustainable</li>
		 <li>Ensure sustainable consumption and production patterns</li>
		 <li>Take urgent action to combat climate change and its impacts</li>
		 <li>Conserve and sustainable use the oceans, seas and marine resources for sustainable development</li>
		 <li>Protect, restore and promote sustainable use of terrestrial ecosystems, sustainable manage forests, combat desertification, and halt and reverse land degradation and halt biodiversity loss</li>
		 <li>Promote peaceful and inclusive societies for sustainable development, provide access to justice for all and build effective, accountable and inclusive institutions at all levels</li>
		 <li>Strengthen the means of implementation and revitalize the global partnership for sustainable development</li>
		 </ol>

		<hr />

		<h3 class="log-name">How does it work?</h4>
		<p>In practice, you, the students, voice which topics interest you the most when you sign up for the course. The three most popular themes are then selected and worked with during the 5 weeks.</p>
		<p>On Sundays, class readings and other assignments are released by the course mentors and can be found on the course website. On Wednesdays, an expert in the given area that we are working with will do a 1-hour live video lecture for you, where there is plenty of room for questions. Finally, on Thursdays, you participate in a 1-hour debate or group session in which you get to talk to and work with your new online classmates. During the Thursday sessions, we will also discuss projects you may be interested in doing after the course, or ideas you may have on how to improve sustainability in your local community.</p>
			<p>The course is very interactive, and we invite you to be content-creator as well as content receiver. This means that we welcome any ideas to assignments and want your input as to which experts to invite to talk to you and you classmates. This is your online classroom - and you get to impact it in any direction you see fit. On Wednesdays and Thursday you will be joined by at least 2 mentors, who will help provide additional support and ensure optimal learning for you.</p>'},
	{ name: 'international-politics', title: 'Contemporary Issues in International Politics and Human Rights', description: '<p>In an increasingly globalized world dominated by political apathy, and a global tightening of the rules that allow people to migrate, the struggle for universal human rights for men, women, minorities and migrants has never been more important than it is today. But obtaining human rights can be a complicated and dangerous struggle. In the Contemporary Issues in Human Rights class we aim to look contemporary cases of struggles for rights as well as recent cases of human rights abuses and reflect on how we, as a global community, can be a force of positive change. Students are empowered to create a community project, campaign or a news article related to human rights, that they will share with their local community.</p>
<p>This class is offered in 3 different time zones, with a slightly different curriculum designed to ensure that students gain knowledge about both global and local issues in human rights. Video lectures from other time zones can be viewed free of charge on our YouTube channel, so if a topic you are interested in is investigated in a different region, you can still watch it!</p>', start: '2015-01-05', end: '2015-02-09', schedule_notes: 'Requires a commitment of 3-6 hours weekly from participating students.', price: 30, paylink: '', status: 'new', order: 20, details: '<h3 class="log-name">class overview</h4>
<p>Class overview EMEA:</p>
<ol>
      <li>Week: Introduction to human rights</li>
      <li>Week: Global perspectives on freedom of speech</li>
      <li>Week: Discrimination against Roma populations in Europe</li>
      <li>Week: Global perspectives on gender and sexual rights</li>
      <li>Week: Anti-Semitism in Europe and lessons from the Holocaust</li>
</ol>
<p>Class overview Asia-Pacific:</p>
<ol>
<li>Week: Introduction to human rights</li>
<li>Week: Global perspectives on freedom of speech</li>
<li>Week: Activism and the struggle for democracy in Hong Kong</li>
<li>Week: Global perspectives on gender and sexual rights</li>
<li>Week: Torture, executions and use of excessive force in China</li>
</ol>
<p>Class overview Americas:</p>
<ol>
<li>Week: Introduction to human rights</li>
<li>Week: Global perspectives on freedom of speech</li>
<li>Week: Human Trafficking: a story of modern day slavery</li>
<li>Week: Global perspectives on gender and sexual rights</li>
<li>Week: Human rights abuses and the war on terror</li>
</ol>
<hr />
<h3 class="log-name">How does it work?</h4>
<p>On Sundays, class readings and other assignments are released by the course mentors and can be found on the course website. On Tuesday, an expert in the given area that we are working with will do a 1-hour live video lecture for you, where there is plenty of room for questions. Finally, on Thursdays, you participate in a 1-hour debate or group session in which you get to talk to and work with your new online classmates. During the Thursday sessions, we will also discuss projects you may be interested in doing after the course, or ideas you may have on how to improve sustainability in your local community.</p>
<p>The course is very interactive, and we invite you to be content-creator as well as content receiver. This means that we welcome any ideas to assignments and want your input as to which experts to invite to talk to you and you classmates. This is your online classroom - and you get to impact it in any direction you see fit. On Tuesday and Thursday you will be joined by at least 2 mentors, who will help provide additional support and ensure optimal learning for you.</p>'},
	{ name: 'social-entrepreneurship', title: 'Social Entrepreneurship - Innovative Solutions to Social Problems', description: 'The Entrepreneurship class is a very hands-on class, in which students are provided with information about some the skills needed to setup up a project, social venture or business.', start: '2015-01-05', end: '2015-02-09', schedule_notes: 'Requires a commitment of 3-6 hours weekly from participating students.', price: 30, paylink: '', status: 'new', order: 30, details: 'TODO'},
	{ name: 'dummy', title: 'Test course', description: 'Test description', start: '2015-01-05', end: '2015-02-09', schedule_notes: 'Requires a commitment of 3-6 hours weekly from participating students.', price: 30, paylink: '', status: 'new', order: 30, details: 'TODO'}])