INSERT INTO users (name, is_faculty) VALUES ('Beth', false);
INSERT INTO users (name, is_faculty) VALUES ('Tomasz', false);
INSERT INTO users (name, is_faculty) VALUES ('Oskar', false);
INSERT INTO users (name, is_faculty) VALUES ('Ana', false);
INSERT INTO users (name, is_faculty) VALUES ('Silviu', false);
INSERT INTO users (name, is_faculty) VALUES ('Julieta', false);
INSERT INTO users (name, is_faculty) VALUES ('Viki', false);
INSERT INTO users (name, is_faculty) VALUES ('Lucja', false);
INSERT INTO users (name, is_faculty) VALUES ('Dani', false);
INSERT INTO users (name, is_faculty) VALUES ('Tom', false);
INSERT INTO users (name, is_faculty) VALUES ('Rosie', false);
INSERT INTO users (name, is_faculty) VALUES ('Laura', false);
INSERT INTO users (name, is_faculty) VALUES ('Adil', false);
INSERT INTO users (name, is_faculty) VALUES ('Cynthia', false);
INSERT INTO users (name, is_faculty) VALUES ('Steph', false);
INSERT INTO users (name, is_faculty) VALUES ('HoKei', false);
INSERT INTO users (name, is_faculty) VALUES ('Henry', false);
INSERT INTO users (name, is_faculty) VALUES ('Carlton', false);

INSERT INTO users (name, is_faculty) VALUES ('Neill', true);
INSERT INTO users (name, is_faculty) VALUES ('Katie', true);
INSERT INTO users (name, is_faculty) VALUES ('Nico', true);
INSERT INTO users (name, is_faculty) VALUES ('Marta', true);
INSERT INTO users (name, is_faculty) VALUES ('Lauren', true);


INSERT INTO resources (resource_name, author_name, url, description, content_type, build_phase, recommender_id, recommender_comment, recommender_reason) 
VALUES 
	('useReducer video tutorial',
     'Web Dev Simplified',
     'https://www.youtube.com/watch?v=kK_Wqx3RnHk',
     'In this video I cover everything you need to know about the useReducer hook.
     I go over all the main use cases for useReducer as well as many common mistakes that developers make.
     This is part of a series of React videos where I cover all the important hooks in React.',
     'video',
     12,
     10,
     'I recommend this resource after having used it.',
     'This YTer has some nice tutorials on React and I found his useReducer one (with the article in description) helped me get to grips with it.'),

     ('Daniel Shiffmans Code! Course JS, p5.js and creative coding',
      'Daniel Shiffman',
      'https://thecodingtrain.com/tracks/code-programming-with-p5-js/code/1-intro/1-intro',
      'Heres the javascript course I mentioned by Daniel Shiffman.  It introduces a library called p5.js, which makes creative coding easier',
      'video',
      1,
      19,
      'I recommend this resource after having used it.',
      'Heres the javascript course I mentioned by Daniel Shiffman.  It introduces a library called p5.js, which makes creative coding easier'),

      ('Short course on how to use Git and GitHub for version control',
       'Codecademy',
       'https://www.codecademy.com/learn/learn-git',
       'helpful resource for navigating git and github',
       'course',
       1,
       17,
       'I recommend this resource after having used it.',
       'I thought I would share this short course from Codecademy on Git and GitHub,
       I found it easy to follow and was very useful for starting to use version control.'),

       ('JS Operator Precedence',
     'W3Schools',
     'https://www.w3schools.com/js/js_precedence.asp',
     'to sum up different types of operators in js and learn about they precedence.',
     'reference',
     12,
     10,
     'I recommend this resource after having used it.',
     'For folks that on the beginning on the journey and want to build solid fundamentals - I found link below useful to sum up different types of operators in js and learn about they precedence. '),

     ('Git Branching Exercises',
     'Learn Git Branching',
        'https://learngitbranching.js.org/',
        'An interactive Git visualization tool to educate and challenge!',
        'exercise',
        1,
       18,
        'I recommend this resource after having used it.',
        'Here\s a cool interactive web application for learning and visualising git branching!
            NOTE There''s 2 tabs at the top for Main and Remote. '),

        ('Debugging js with chrome devtools (7 mins video)',
     'Chrome for Developers',
        'https://www.youtube.com/watch?v=H0XScE08hy8',
        'If people want to go over the debugger functions a bit more comprehensively this is an ok watch.',
        'video',
        5,
       19,
        'I recommend this resource after having used it.',
        'If people want to go over the debugger functions a bit more comprehensively this is an ok watch.'
        ),

        ('Setting up vscode for automatic code formatting',
     'Neill',
        'https://www.loom.com/share/49c170827248480dbcb961aa78971e6a?sid=f809a0f7-d193-46e6-9df9-3804c3cb0208',
        'Setting up vscode for automatic code formatting',
        'video',
        2,
       19,
        'I recommend this resource after having used it.',
        'useful'
    ),

        ('Setting up a React TypeScript app from scratch with ALL the things.',
     'Coding Garden',
        'https://www.youtube.com/watch?v=cchqeWY0Nak',
        'In this video CJ sets up a React project from scratch, with typescript, eslint, testing through vitest (an exact replacement for jest), etc.   His codebase is also available on github.',
        'video',
        7,
       19,
        'I recommend this resource after having used it.',
        'In part, I just want to draw attention to this streamer / youtuber going forward.  He has lots of nice coding walkthroughs of interesting apps.'
    ),

        ('Flex resources',
     'Flexbox | HTML & CSS Is Hard',
        'https://internetingishard.netlify.app/html-and-css/flexbox/index.html',
        ' a pretty clear flexbox guide with helpful graphics',
        'reference',
        1,
       3,
        'I recommend this resource after having used it.',
        'a pretty clear flexbox guide with helpful graphics'
    ),

        ('A Complete Guide to Flexbox | CSS-Tricks',
     'Chris Coyier',
        'https://css-tricks.com/snippets/css/a-guide-to-flexbox/',
        ' a pretty clear flexbox guide with helpful graphics',
        'reference',
        1,
       3,
        'I recommend this resource after having used it.',
        'another nice guide, has pretty much the same stuff as #1 so no need to read both unless you like having the same concepts explained in two different ways (I do)'
        ),

        ('CSS games!',
     'CSS Diner',
        'https://flukeout.github.io/ ',
        'I found some games that help learning CSS',
        'reference',
        3,
       8,
        'I recommend this resource after having used it.',
        'selectors'
        ),

        ('More map and filter exercises in React',
     'Rendering Lists React',
        'https://react.dev/learn/rendering-lists',
        'There are four exercises for practicing with map and filter in react  here ',
        'exercise',
        5,
       19,
        'I recommend this resource after having used it.',
        'The library for web and native user interfaces'
        ),


        ('useState tutorial',
     'Web Dev Simplified',
        'https://www.youtube.com/watch?v=O6P86uwfdR0',
        ' If you are still a little confused about useState, 
        its return, how to implement it, or anything related, heres a video tutorial that seemed very clear and instructive to me and some more folks from the cohort.',
        'video',
        5,
       9,
        'I recommend this resource after having used it.',
        'Learn useState In 15 Minutes - React Hooks Explained'
        ),

        ('JavaScript on Exercism',
     'Exercism',
        'https://exercism.org/tracks/javascript',
        'Join Exercisms JavaScript Track for access to 141 exercises grouped into 33 JavaScript Concepts, with automatic analysis of your code and personal mentoring, all 100% free.',
        'course',
        0,
       2,
        'I recommend this resource after having used it.',
        'helped me with learning javascript'
        ),

        ('Objects in JavaScript',
     'Scrimba',
        'https://scrimba.com/learn/introductiontojavascript/objects-in-javascript-cBQwgS9',
        'Objects in js explained',
        'course',
        10,
       2,
        'I recommend this resource after having used it',
        'good exercise'
        ),

        ('JavaScript Object Oriented Programming',
'Codesmith',
'https://www.youtube.com/watch?v=aAAS9cEuFYI',
'Go under the hood of Object Oriented Programming and the prototype chain',
'video',
0,
19,
'I recommend this resource after having used it',
'This one-hour lecture is packed with excellent explanation of the various features JavaScript offers to support object-oriented programming.'),

('Object-Oriented JavaScript',
'Udacity',
'https://learn.udacity.com/courses/ud711 ',
'8-hour free course from Udacity on OOP in JS',
'course',
14,
19,
'I haven''t used this resource but it looks promising',
'It contains a decent number of quizzes and interactive coding tests.'),

('Learn useReducer in 20 Minutes',
'Web Dev Simplified',
'https://youtu.be/kK_Wqx3RnHk',
'Everything you need to know about the useReducer hook',
'video',
13,
10,
'I recommend this resource after having used it',
'This YTer has some nice tutorials on React and I found his useReducer one that helped me get to grips with it'),

('React Beautiful DnD course',
'Alex Reardon',
'https://egghead.io/courses/beautiful-and-accessible-drag-and-drop-with-react-beautiful-dnd',
'We will create a highly interactive task management application from scratch using the building blocks of react-beautiful-dnd.',
'course',
0,
8,
'I recommend this resource after having used it',
'Very useful for learning drag-n-drop'),

('useState Tutorial',
'PedroTech',
'https://www.youtube.com/watch?v=K0q-8ytGlVA',
'Everything you need to know about the useState hook',
'video',
10,
9,
'I recommend this resource after having used it',
'useState explanation'),
 
('Writing custom hooks',
'Neill',
'https://www.loom.com/share/40cfcab5fccf4b0f91ab19b3fb553e7b?sid=3c1caee3-8071-4564-bb5a-bdc0bf887d77',
'Here I walk through tidying up a component in my paste-bin app by pushing all the useState and useEffect stuff to a custom hook.',
'video',
14,
19,
'I recommend this resource after having used it',
'A recommended watch even if you didn''t do the paste-bin app.'),

('TypeSafe JavaScript Data Validation',
'basarat',
'https://www.youtube.com/watch?v=NFdS7cSnNc8',
'There are lots of solutions for data validation in JavaScript. But only recently have we got libraries that provide a great feature set and excellent TypeScript compatibility',
'video',
10,
3,
'I recommend this resource after having used it',
'Short and easy 4-minute intro to validation with Zod'),

('React Router Version 6 Tutorial',
'Free Code Camp',
'https://www.freecodecamp.org/news/how-to-use-react-router-version-6/',
'In this tutorial, we''ll talk about what React Router is and how to use it.',
'article',
9,
1,
'I recommend this resource after having used it',
'Good short intro to React Router'),

('Imphenzia: Learn low-poly modeling in Blender',
'Blender Guru',
'https://www.youtube.com/watch?v=nIoXOplUvAw',
'Blender tutorial series showing you how to use the most common features',
'video',
0,
2,
'I recommend this resource after having used it',
'This is an easy style to pull-off, which doesn''t require lots of finessing and works great on a low-powered computer');


INSERT INTO tags VALUES 
(1, 'react'),
(1, 'hooks'),
(2, 'javascript'),
(2, 'p5js'),
(3, 'git'),
(3, 'version-control'),
(4, 'javascript'),
(5, 'git'),
(5, 'version-control'),
(6, 'javascript'),
(6, 'debugging'),
(7, 'vscode'),
(7, 'workflow'),
(8, 'typescript'),
(8, 'react'),
(9, 'css'),
(9, 'flex'),
(9, 'styling'),
(10, 'css'),
(10, 'flex'),
(10, 'styling'),
(11, 'css'),
(11, 'styling'),
(12, 'react'),
(12, 'methods'),
(13, 'react'),
(13, 'hooks'),
(13, 'usestate'),
(14, 'javascript'),
(15, 'objects'),
(15, 'oop'),
(15, 'javascript'),
(16, 'javascript'),
(16, 'oop'),
(17, 'javascript'),
(17, 'oop'),
(17, 'quiz'),
(18, 'react'),
(18, 'hooks'),
(18, 'usereducer'),
(19, 'react'),
(19, 'webdev'),
(20, 'usestate'),
(20, 'webdev'),
(21, 'hooks'),
(21, 'react'),
(21, 'usestate'),
(21, 'useeffect'),
(22, 'validation'),
(22, 'javascript'),
(22, 'zod'),
(23, 'react'),
(23, 'router'),
(24, 'blender'),
(24, 'modeling'),
(24, '3d');

insert into study_list(user_id, resource_id) select 2, 5 where not exists(select user_id, resource_id from study_list where user_id = 2 and resource_id = 5);
insert into study_list(user_id, resource_id) select 2, 7 where not exists(select user_id, resource_id from study_list where user_id = 2 and resource_id = 7);
insert into study_list(user_id, resource_id) select 2, 8 where not exists(select user_id, resource_id from study_list where user_id = 2 and resource_id = 8);
insert into study_list(user_id, resource_id) select 2, 9 where not exists(select user_id, resource_id from study_list where user_id = 2 and resource_id = 9);
insert into study_list(user_id, resource_id) select 2, 10 where not exists(select user_id, resource_id from study_list where user_id = 2 and resource_id = 10);



        

       
       
      
      
