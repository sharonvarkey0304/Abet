class QuestionModel {
  final String question;
  final List<String> option;
  final int correctAnswerIndex;

  const QuestionModel({
    required this.correctAnswerIndex,
    required this.question,
    required this.option,
  });
}

const List<QuestionModel> computerFundamentalsAndHtml = [
  QuestionModel(
    question: '1.	What is the full form of HTML?',
    correctAnswerIndex: 2,
    option: [
      'a)	Hypertext Markup Link',
      'b)	Hypertel Markup Language',
      'c)	Hypertext Markup Language',
      'd)	Hypertext Markup Line',
    ],
  ),
  QuestionModel(
      question:
          '2.	______are the sum of various distinct literals in which each literal occurs exactly once.',
      correctAnswerIndex: 3,
      option: [
        'a)	Minterm',
        'b)	Product of Sum',
        'c)	Canonical Representation',
        'd)	Maxterm',
      ]),
  QuestionModel(
    question: '3.	What does W3C stans for?',
    correctAnswerIndex: 0,
    option: [
      'a)	World Wide Web Consortium',
      'b)	World Wide Web Community',
      'c)	World Wide Web Cluster',
      'd)	World Wide Web Collection',
    ],
  ),
  QuestionModel(
    question: '4.	(0101112)10   convert to hexa decimal.',
    correctAnswerIndex: 2,
    option: [
      'a)	F5DA8 ',
      'b)	F6AA8 ',
      'c)	F6DA8 ',
      'd)	F6DB8 ',
    ],
  ),
  QuestionModel(
    question:
        '5.	______is a check bit, which is added to a block of data for error detection purposes.',
    correctAnswerIndex: 0,
    option: [
      'a)	Parity bit',
      'b)	ECC',
      'c)	BER',
      'd)	Primary bit',
    ],
  ),
];

const List<QuestionModel> mathematicalFoundation = [
  QuestionModel(
    question: '1.  Which of the following is an example of null set ? ',
    correctAnswerIndex: 1,
    option: [
      'a) Set of even prime numbers.',
      'b) {x:x is a natural number, x > 5 and x <= 7} ',
      'c) The set of months of year.',
      'd) The set of prime numbers less than 99',
    ],
  ),
  QuestionModel(
      question: '2.If A and B are two sets such that A⊂B then what is A∪B?',
      correctAnswerIndex: 0,
      option: [
        'a) B',
        'b) AB',
        'c) A',
        'd) ϕ',
      ]),
  QuestionModel(
    question:
        '3.limx→3([x]+[−x]) is (where [.]denotes the greatest integer function)?',
    correctAnswerIndex: 2,
    option: [
      'a) 1',
      'b) 0',
      'c) -1',
      'd) not defined',
    ],
  ),
  QuestionModel(
    question: '4. If A= {1,2}and B= {3,4}, then A∪B = ___',
    correctAnswerIndex: 0,
    option: [
      'a) {1,2,3,4}',
      'b) A∩B',
      'c) {} ',
      'd) {1,2} ',
    ],
  ),
  QuestionModel(
    question: '5.The value of lim x→2 ([2−x]+[x−2]−x ) equals',
    correctAnswerIndex: 3,
    option: [
      'a) 0',
      'b) 3',
      'c) does not exist',
      'd) -3',
    ],
  ),
];

const List<QuestionModel> discreteMathematics = [
  QuestionModel(
    question:
        '1.	If x is a set and the set contains an integer which is neither positive nor negative then the set x is ____________.',
    correctAnswerIndex: 3,
    option: [
      'a)	Set is Empty',
      'b)	Set is Non-empty',
      'c)	Set is Finite.',
      'd)	Set is both Non- empty and Finite.',
    ],
  ),
  QuestionModel(
      question:
          '2.	Which among the following can be taken as the discrete object?',
      correctAnswerIndex: 3,
      option: [
        'a)	People',
        'b)	Rational numbers',
        'c)	Integers',
        'd)	All of the mentioned',
      ]),
  QuestionModel(
    question:
        '3.	The cardinality of the Power set of the set {1, 5, 6} is______________. ',
    correctAnswerIndex: 2,
    option: [
      'a) 5',
      'b) 6',
      'c) 8',
      'd) 10',
    ],
  ),
  QuestionModel(
    question: '4.	How many bytes are needed for encoding 2000 bits of data?',
    correctAnswerIndex: 1,
    option: [
      'a)	5 Byte',
      'b)	2 Byte',
      'c)	4 Byte',
      'd)	8 Byte',
    ],
  ),
  QuestionModel(
    question: '5.	What is the complexity of the bubble sort algorithm?',
    correctAnswerIndex: 0,
    option: [
      'a)	O(n2)',
      'b)	O(n)',
      'c)	O(log n)',
      'd)	O(n log n)',
    ],
  ),
];
const List<QuestionModel> problemSolvingUsingC = [
  QuestionModel(
    question: '1.	What is a lint?',
    correctAnswerIndex: 2,
    option: [
      'a)	C compiler',
      'b)	Interactive debugger',
      'c)	Analyzing tool',
      'd)	C interpreter',
    ],
  ),
  QuestionModel(
      question:
          '2.	Study the following program:main(){printf("javatpoint");  main();} What will be the output of this program?',
      correctAnswerIndex: 1,
      option: [
        'a)	Wrong statement',
        'b)	It will keep on printing javatpoint',
        'c)	It will Print javatpoint once',
        'd)	None of the these',
      ]),
  QuestionModel(
    question:
        '3.	Which of the following comment is correct when a macro definition includes arguments?',
    correctAnswerIndex: 0,
    option: [
      'a)	The opening parenthesis should immediately follow the macro name.',
      'b)	There should be at least one blank between the macro name and the opening parenthesis.',
      'c)	There should be only one blank between the macro name and the opening parenthesis.',
      'd)	All the above comments are correct.',
    ],
  ),
  QuestionModel(
    question: '4.	What is the output of this statement "printf("%d", (a++))"?',
    correctAnswerIndex: 1,
    option: [
      'a)	The value of (a + 1)',
      'b)	The current value of a',
      'c)	Error message',
      'd)	Garbage',
    ],
  ),
  QuestionModel(
    question: '5.	In the C language, the constant is defined _______.',
    correctAnswerIndex: 2,
    option: [
      'a)	Before main',
      'b)	After main',
      'c)	Anywhere, but starting on a new line.',
      'd)	None of the these.',
    ],
  ),
];

const List<QuestionModel> finacialAndManagementAccounting = [
  QuestionModel(
    question:
        '1.	What is considered the language of business used to communicate financial information?',
    correctAnswerIndex: 1,
    option: [
      'a)	Marketing',
      'b)	Accounting',
      'c)	Profit',
      'd)	Pricing',
    ],
  ),
  QuestionModel(
      question:
          '2.	Which of the following options is not characteristic of management accounting? ',
      correctAnswerIndex: 2,
      option: [
        'a)	Future-oriented ',
        'b)	Accounting information ',
        'c)	Compulsory accounting.',
        'd)	Management oriented',
      ]),
  QuestionModel(
    question:
        '3.	Which of the following statement measures the financial position of the entity on particular time?',
    correctAnswerIndex: 1,
    option: [
      'a)	Income Statement',
      'b)	Balance Sheet',
      'c)	Cash Flow Statement',
      'd)	Statement of Retained Earning',
    ],
  ),
  QuestionModel(
    question: '4.	Fixed cost per unit decreases when ______________.',
    correctAnswerIndex: 0,
    option: [
      'a)	Production volume increases.',
      'b)	Production volume decreases.',
      'c)	Variable cost per unit decreases.',
      'd)	Variable cost per unit increases.',
    ],
  ),
  QuestionModel(
    question:
        '5.	The difference between total revenues and total variable costs is known as ______________.',
    correctAnswerIndex: 0,
    option: [
      'a)	Contribution margin',
      'b)	Gross margin',
      'c)	Operating income',
      'd)	Fixed costs',
    ],
  ),
];
const List<QuestionModel> operationResearch = [
  QuestionModel(
    question: '1.	Operations Research approach is ______________.',
    correctAnswerIndex: 0,
    option: [
      'a)	Multi-disciplinary',
      'b)	Scientific',
      'c)	Intuitive',
      'd)	Collect essential data',
    ],
  ),
  QuestionModel(
      question:
          '2.	If any value in XB column of final simplex table is negative, then the solution is ______________.',
      correctAnswerIndex: 1,
      option: [
        'a)	One solution',
        'b)	Infeasible',
        'c)	Bounded',
        'd)	No solution',
      ]),
  QuestionModel(
    question:
        '3.	If there is no non-negative replacement ratio in solving a Linear Programming Problem then the solution is ______________.',
    correctAnswerIndex: 3,
    option: [
      'a)	feasible',
      'b)	bounded',
      'c)	infinite',
      'd)	unbounded',
    ],
  ),
  QuestionModel(
    question:
        '4.	______________ is a mathematical technique used to solve the problem of allocating limited resource among the competing activities.',
    correctAnswerIndex: 0,
    option: [
      'a)	Linear Programming problem',
      'b)	Assignment Problem',
      'c)	Replacement Problem',
      'd)	Non linear Programming Problem',
    ],
  ),
  QuestionModel(
    question: '5.	The non basic variables are called ______________.',
    correctAnswerIndex: 0,
    option: [
      'a)	shadow cost',
      'b)	opportunity cost',
      'c)	slack variable',
      'd)	surplus variable',
    ],
  ),
];
const List<QuestionModel> dataStructureUsingC = [
  QuestionModel(
    question: '1.Which data structure is used for implementing recursion?',
    correctAnswerIndex: 0,
    option: [
      'a) Stack',
      'b)	Queue',
      'c)	List',
      'd)	Array',
    ],
  ),
  QuestionModel(
      question:
          '2.	 What is the value of the postfix expression 6 3 2 4 + – *?',
      correctAnswerIndex: 1,
      option: [
        'a)	74',
        'b)	-18',
        'c)	28',
        'd)	40',
      ]),
  QuestionModel(
    question:
        '3.	The data structure required for Breadth First Traversal on a graph is?',
    correctAnswerIndex: 3,
    option: [
      'a)	Array',
      'b)	Stack',
      'c)	Tree',
      'd)	Queue',
    ],
  ),
  QuestionModel(
    question:
        'Which data structure is based on the Last In First Out (LIFO) principle?',
    correctAnswerIndex: 0,
    option: [
      'a)	 Tree',
      'b)	Linked List',
      'c)	Stack',
      'd)	Queue',
    ],
  ),
  QuestionModel(
    question:
        '5.	Which of the following tree data structures is not a balanced binary tree?',
    correctAnswerIndex: 0,
    option: [
      'a)	Splay tree',
      'b)	B-tree',
      'c)	AVL tree',
      'd)	Red-black tree',
    ],
  ),
];
const List<QuestionModel> pythonPrograming = [
  QuestionModel(
    question: '1.Who developed Python Programming Language?',
    correctAnswerIndex: 2,
    option: [
      'a) Wick van Rossum',
      'b)	Rasmus Lerdorf',
      'c)	Guido van Rossum',
      'd)	Niene Stom',
    ],
  ),
  QuestionModel(
      question: '2.Is Python code compiled or interpreted?',
      correctAnswerIndex: 0,
      option: [
        'a) Python code is both compiled and interpreted',
        'b) Python code is neither compiled nor interpreted',
        'c) Python code is only compiled',
        'd) Python code is only interpreted',
      ]),
  QuestionModel(
    question:
        '3. Which of the following character is used to give single-line comments in Python?',
    correctAnswerIndex: 1,
    option: [
      'a) //',
      'b) #',
      'c) !',
      'd) /*',
    ],
  ),
  QuestionModel(
    question:
        '4. What will be the output of the following Python code snippet if x=1?x<<2',
    correctAnswerIndex: 0,
    option: [
      'a) 4',
      'b) 2',
      'c) 1',
      'd) 8',
    ],
  ),
  QuestionModel(
    question:
        '5.	What are the values of the following Python expressions?2**(3**2) (2**3)**2 2**3**2',
    correctAnswerIndex: 3,
    option: [
      'a) 512, 64, 64',
      'b) 512, 512, 512',
      'c) 64, 512, 64',
      'd) 512, 64, 512',
    ],
  ),
];
const List<QuestionModel> computeroriented = [
  QuestionModel(
    question: '1.The median of 7, 6, 4, 8, 2, 5, 11 is',
    correctAnswerIndex: 0,
    option: [
      'a) 6',
      'b) 12',
      'c) 11',
      'd) 4',
    ],
  ),
  QuestionModel(
      question:
          '2. When we consider an event B then non-occurrence of event B is?',
      correctAnswerIndex: 2,
      option: [
        'a) A is equal to zero',
        'b) intersection of A',
        'c) complement of A',
        'd) union of A',
      ]),
  QuestionModel(
    question:
        '3. In t-distribution for two independent samples n1= n2= n, then the degrees of freedom is equal to:',
    correctAnswerIndex: 1,
    option: [
      'a) 2n –1',
      'b) 2n –2',
      'c) 2n + 1',
      'd) n –1',
    ],
  ),
  QuestionModel(
    question:
        '4. Solve the equations using Gauss Jordan method.x+y+z=9 2x-3y+4z=13 3x+4y+5z=40',
    correctAnswerIndex: 3,
    option: [
      'a) x=1, y=3, z=7',
      'b) x=1, y=3, z=2',
      'c) x=1, y=3, z=4',
      'd) x=1, y=3, z=5',
    ],
  ),
  QuestionModel(
    question:
        '5. Which of the following is also known as the Newton Raphson method?',
    correctAnswerIndex: 2,
    option: [
      'a) Chord method',
      'b) Tangent method',
      'c) Diameter method',
      'd) Secant method',
    ],
  ),
];
const List<QuestionModel> datacommunication = [
  QuestionModel(
    question:
        '1.	In optical fiber communications, the signal source is ________ waves.',
    correctAnswerIndex: 0,
    option: [
      'a)	Light',
      'b)	Infrared',
      'c)	 Radio',
      'd)	Very low-frequency',
    ],
  ),
  QuestionModel(
      question:
          '2.Which one of the following is not a guided medium of transmission?',
      correctAnswerIndex: 3,
      option: [
        'a)	Fiber–Optic cable',
        'b)	Coaxial cable',
        'c)	Twisted-pair cable',
        'd)	The atmosphere',
      ]),
  QuestionModel(
    question:
        '3. ______________ is used in the specification of optical detectors.',
    correctAnswerIndex: 0,
    option: [
      'a) Noise equivalent power',
      'b) Polarization',
      'c) Sensitivity',
      'd) Electron movement',
    ],
  ),
  QuestionModel(
    question:
        '4. The network layer looks after the flow and error control mechanism.',
    correctAnswerIndex: 1,
    option: [
      'a) true',
      'b) false',
    ],
  ),
  QuestionModel(
    question: '5.ATM stands for',
    correctAnswerIndex: 1,
    option: [
      'a)	Automatic taller machine ',
      'b)	Automated teller machine',
      'c)	Automatic transfer machine',
      'd)	Automated transfer machine',
    ],
  ),
];
const List<QuestionModel> toc = [
  QuestionModel(
    question:
        '1. Assume the R is a relation on a set A, aRb is partially ordered such that a and b are _____________',
    correctAnswerIndex: 3,
    option: [
      'a) reflexive',
      'b) transitive',
      'c) symmetric',
      'd) reflexive and transitive',
    ],
  ),
  QuestionModel(
      question:
          '2. It is less complex to prove the closure properties over regular languages using',
      correctAnswerIndex: 0,
      option: [
        'a) NFA',
        'b) DFA',
        'c) PDA',
        'd) Can’t be said',
      ]),
  QuestionModel(
    question:
        '3. Which of the following is an application of Finite Automaton?',
    correctAnswerIndex: 3,
    option: [
      'a) Compiler Design',
      'b) Grammar Parsers',
      'c) Text Search',
      'd) All of the mentioned',
    ],
  ),
  QuestionModel(
    question: '4. A turing machine operates over:',
    correctAnswerIndex: 1,
    option: [
      'a) finite memory tape',
      'b) infinite memory tape',
      'c) depends on the algorithm',
      'd) none of the mentioned',
    ],
  ),
  QuestionModel(
    question:
        '5. The ability for a system of instructions to simulate a Turing Machine is called _________',
    correctAnswerIndex: 0,
    option: [
      'a) Turing Completeness',
      'b) Simulation',
      'c) Turing Halting',
      'd) None of the mentioned',
    ],
  ),
];
const List<QuestionModel> microprocessors = [
  QuestionModel(
    question:
        '1. The microprocessor of a computer can operate on any information if it is present in ______________ only.',
    correctAnswerIndex: 2,
    option: [
      'a) Program Counter',
      'b) Flag',
      'c) Main Memory',
      'd) Secondary Memory',
    ],
  ),
  QuestionModel(
      question: '2. What is the word length of an 8-bit microprocessor?',
      correctAnswerIndex: 0,
      option: [
        'a) 8-bits – 64 bits',
        'b) 4-bits – 32 bits',
        'b) 4-bits – 32 bits',
        'd) 8-bits – 32 bits',
      ]),
  QuestionModel(
    question:
        '3. Which of the following is the correct sequence of operations in a microprocessor?',
    correctAnswerIndex: 0,
    option: [
      'a) Opcode fetch, memory read, memory write, I/O read, I/O write',
      'b) Opcode fetch, memory write, memory read, I/O read, I/O write',
      'c) I/O read, opcode fetch, memory read, memory write, I/O write',
      'd) I/O read, opcode fetch, memory write, memory read, I/O write',
    ],
  ),
  QuestionModel(
    question: '4. Which of the following flag is used to mask INTR interrupt?',
    correctAnswerIndex: 2,
    option: [
      'a) zero flag',
      'b) auxiliary carry flag ',
      'c) interrupt flag',
      'd) sign flag',
    ],
  ),
  QuestionModel(
    question:
        '5. How many flip-flops are there in a flag register of 8085 microprocessor?',
    correctAnswerIndex: 1,
    option: [
      'a) 4',
      'b) 5',
      'c) 7',
      'd) 10',
    ],
  ),
];
const List<QuestionModel> sensors = [
  QuestionModel(
    question:
        '1. Change in output of sensor with change in input is ___________',
    correctAnswerIndex: 2,
    option: [
      'a) Threashold',
      'b) Slew rate',
      'c) Sensitivity',
      'd) None of the mentioned',
    ],
  ),
  QuestionModel(
      question:
          '2. Thermocouple generate output voltage according to ____________',
      correctAnswerIndex: 2,
      option: [
        'a) Circuit parameters',
        'b) Humidity',
        'c) Temperature',
        'd) Voltage',
      ]),
  QuestionModel(
    question: '3. Which of the following is not an analog sensor?',
    correctAnswerIndex: 3,
    option: [
      'a) Potentiometer',
      'b) Force-sensing resistors',
      'c) Accelerometers',
      'd) None of the mentioned',
    ],
  ),
  QuestionModel(
    question: '4. Active transducers work on the principle of ________',
    correctAnswerIndex: 0,
    option: [
      'a) energy conversion',
      'b) mass conversion',
      'c) energy alteration',
      'd) volume conversion',
    ],
  ),
  QuestionModel(
    question: '5. Capacitive transducer is used for?',
    correctAnswerIndex: 1,
    option: [
      'a) Static measurement',
      'b) Dynamic measurement',
      'c) Transient measurement',
      'd) Both static and dynamic',
    ],
  ),
];
const List<QuestionModel> rdbms = [
  QuestionModel(
    question: '1. Which of the following is the full form of RDBMS?',
    correctAnswerIndex: 0,
    option: [
      'a) Relational Data Management System',
      'b) Relational Database Management System',
      'c) Relative Database Management System',
      'd) Regional Data Management System',
    ],
  ),
  QuestionModel(
      question:
          '2. Let E be an entity set in a relationship set R. If every entity in E participates in at least one relationships in R, Then the participation of E in R is __________',
      correctAnswerIndex: 1,
      option: [
        'a) Partial',
        'b) Total',
        'c) Complete',
        'd) Incomplete',
      ]),
  QuestionModel(
    question:
        '3. Which of the following is the correct option for the given query? SELECT DISTINCT name FROM RDBMS WHERE ID IS NOT NULL;',
    correctAnswerIndex: 1,
    option: [
      'a) The query gives all the possible RDBMS names where a finite value exists for ID',
      'b) The query gives the RDBMS names where a finite value exists for ID and it excludes identical names',
      'c) The query gives the names of the RDBMS that have a null ID and it also excludes identical names',
      'd) The query is syntactically wrong',
    ],
  ),
  QuestionModel(
    question: '4. ________ deletes a data item from a database.',
    correctAnswerIndex: 2,
    option: [
      'a) Insert',
      'b) Drop',
      'c) Delete',
      'd) None of the mentioned',
    ],
  ),
  QuestionModel(
    question:
        '5. What is the format of entering date into a database while inserting data into it?',
    correctAnswerIndex: 3,
    option: [
      'a) “YYYY-MM-DD”',
      'b) YYYY-MM-DD',
      'c) “DD-MM-YYYY”',
      'd) ‘YYYY-MM-DD’',
    ],
  ),
];
const List<QuestionModel> ecommers = [
  QuestionModel(
    question:
        '1. ______allows a business application on the computer of one organization to communicate directly with the business application on the computer of another company',
    correctAnswerIndex: 0,
    option: [
      ' a) EDI ',
      ' b) Protocols',
      ' c) Standards',
      ' d) Business applications',
    ],
  ),
  QuestionModel(
      question:
          '2. _______refers to a kind of e-commerce which refers to a company selling or buying from other company',
      correctAnswerIndex: 2,
      option: [
        'a) B2G ',
        'b) B2E ',
        'c) B2B ',
        'd) P2P',
      ]),
  QuestionModel(
    question:
        '3. _______ provide security and privacy for the use of the web page content',
    correctAnswerIndex: 0,
    option: [
      'a) HTTP ',
      'b) HTML ',
      'c) FTP ',
      'd) none of these',
    ],
  ),
  QuestionModel(
    question:
        '4. _________are special type of software meant for limiting the risks of being hit by computer viruses',
    correctAnswerIndex: 1,
    option: [
      'a) Network firewall ',
      'b) Antivirus ',
      'c) both a & b ',
      'd) none of these',
    ],
  ),
  QuestionModel(
    question:
        '5. A _________ is a software that scours the internet collecting data about every website and every webpage within it',
    correctAnswerIndex: 1,
    option: [
      'a) spiders ',
      'b) Search Engines ',
      'c) robots ',
      'd) none of these',
    ],
  ),
];
const List<QuestionModel> cg = [
  QuestionModel(
    question: '1. Which of the following is a Computer Graphics type?',
    correctAnswerIndex: 0,
    option: [
      ' a) Raster and Vector ',
      ' b) Raster and Scalar',
      ' c) Scalar only',
      ' d) All of the above',
    ],
  ),
  QuestionModel(
      question:
          '2. Which of the following is a primary output device of a graphics system?',
      correctAnswerIndex: 2,
      option: [
        'a) Printer',
        'b) Scanner ',
        'c) Video monitor',
        'd) Neither Scanner nor Video monitor',
      ]),
  QuestionModel(
    question:
        '3. If the boundary is specified in a single color, and if the algorithm proceeds pixel by pixel until the boundary color is encountered is known as ____',
    correctAnswerIndex: 3,
    option: [
      'a) Parallel curve algorithm',
      'b) Flood-fill algorithm ',
      'c) Scan-line fill algorithm',
      'd) Boundary-fill algorithm',
    ],
  ),
  QuestionModel(
    question:
        '4. The Cohen-Sutherland algorithm divides the region into how many spaces?',
    correctAnswerIndex: 0,
    option: [
      'a) 9',
      'b) 8 ',
      'c)7 ',
      'd) 6',
    ],
  ),
  QuestionModel(
    question:
        '5. Heat supplied to the cathode by directing a current through a coil of wire is called',
    correctAnswerIndex: 2,
    option: [
      'a) Electron gun',
      'b) Electron beam',
      'c) Filament',
      'd) Anode and cathode',
    ],
  ),
];
const List<QuestionModel> coa = [
  QuestionModel(
    question: '1. What is computer architecture?',
    correctAnswerIndex: 1,
    option: [
      ' a) set of categories and methods that specify the functioning, organization, and implementation of computer systems',
      ' b) set of principles and methods that specify the functioning, organization, and implementation of computer systems',
      ' c) set of functions and methods that specify the functioning, organization, and implementation of computer systems',
      ' d) None of the mentioned',
    ],
  ),
  QuestionModel(
      question: '2. Which of the following is a type of computer architecture?',
      correctAnswerIndex: 3,
      option: [
        'a) Microarchitecture',
        'b) Harvard Architecture',
        'c) Von-Neumann Architecture',
        'd) All of the mentioned',
      ]),
  QuestionModel(
    question: '3. The small extremely fast, RAM’s all called as ________',
    correctAnswerIndex: 3,
    option: [
      'a) Heaps',
      'b) Accumulators',
      'c) Stacks',
      'd) Cache',
    ],
  ),
  QuestionModel(
    question:
        '4. The bit used to signify that the cache location is updated is ',
    correctAnswerIndex: 3,
    option: [
      'a) Flag bit',
      'b) Reference bit',
      'c) Update bit',
      'd) Dirty bit',
    ],
  ),
  QuestionModel(
    question:
        '5. In the case of, Zero-address instruction method the operands are stored in _____',
    correctAnswerIndex: 2,
    option: [
      'a) Registers',
      'b) Accumulators',
      'c) Push down stack',
      'd) Cache',
    ],
  ),
];
const List<QuestionModel> php = [
  QuestionModel(
    question: '1.	MIME stands for',
    correctAnswerIndex: 0,
    option: [
      ' (a) Multimedia Internet Mail Extensions',
      ' (b) Multipurpose Internet Multimedia Extensions',
      ' (c) Multipurpose Internet Mail Extensions',
      ' (d) Multiple Internet Mail Extensions',
    ],
  ),
  QuestionModel(
      question:
          '2. …………… attribute of a table determine how much space there is between the contents of a cell and its border.',
      correctAnswerIndex: 2,
      option: [
        '(a) cellspacing',
        '(b) margin',
        '(c) cellpadding',
        '(d)cellborder',
      ]),
  QuestionModel(
    question: '3. ………………tag is used to include javascript into the HTML page',
    correctAnswerIndex: 1,
    option: [
      '(a) <link>',
      '(c) <script>',
      '(b) <javascript>',
      '(d) <style>',
    ],
  ),
  QuestionModel(
    question: '4. In javascript what does is NaN function do? ',
    correctAnswerIndex: 0,
    option: [
      ' (a) Return true if the argument is not a number',
      ' (b) Return false if the argument is not a number',
      ' (c) Return true if the argument is a number',
      ' (d) None of the above',
    ],
  ),
  QuestionModel(
    question:
        '5. ………….. method is used to remove focus from the specified object.',
    correctAnswerIndex: 0,
    option: [
      '(a) blur()',
      '(b) unload() ',
      '(c) focus()',
      '(d)removefocus()',
    ],
  ),
];
const List<QuestionModel> java = [
  QuestionModel(
    question:
        '1. Which component is used to compile, debug and execute the java programs?',
    correctAnswerIndex: 2,
    option: [
      ' a) JRE',
      ' b) JIT',
      ' c) JDK',
      'd) JVM',
    ],
  ),
  QuestionModel(
      question: '2. Which one of the following is not a Java feature?',
      correctAnswerIndex: 1,
      option: [
        'a) Object-oriented',
        'b) Use of pointers',
        'c) Portable',
        'd) Dynamic and Extensible',
      ]),
  QuestionModel(
    question:
        '3. What will be the output of the following Java code?class increment {public static void main(String args[]) {   int g=3 System.out.print(++g * 8);} }',
    correctAnswerIndex: 0,
    option: [
      'a) 32',
      '(c) 33',
      '(b) 24',
      '(d)25',
    ],
  ),
  QuestionModel(
    question: '4. What is not the use of “this” keyword in Java?',
    correctAnswerIndex: 1,
    option: [
      ' a) Referring to the instance variable when a local variable has the same name',
      ' b) Passing itself to the method of the same class',
      ' c) Passing itself to another method',
      ' d) Calling another constructor in constructor chaining',
    ],
  ),
  QuestionModel(
    question:
        '5. Which of the following is a type of polymorphism in Java Programming?.',
    correctAnswerIndex: 1,
    option: [
      'a) Multiple polymorphism',
      'b) Compile time polymorphism ',
      'c) Multilevel polymorphism',
      'd) Execution time polymorphism',
    ],
  ),
];
const List<QuestionModel> se = [
  QuestionModel(
    question: '1. What are the features of Software Code?',
    correctAnswerIndex: 2,
    option: [
      ' a) Simplicity',
      ' b) Accessibility',
      ' c) Modularity',
      'd) All of the above',
    ],
  ),
  QuestionModel(
      question:
          '2. ________ is defined as the process of generating analysis and designing documents?',
      correctAnswerIndex: 1,
      option: [
        'a) Re-engineering',
        'b) Reverse engineering',
        'c) Software re-engineering',
        'd) Science and engineering',
      ]),
  QuestionModel(
    question: '3. What does SDLC stands for?',
    correctAnswerIndex: 2,
    option: [
      'a) System Design Life Cycle',
      'b) Software Design Life Cycle',
      'c) Software Development Life Cycle',
      'd) System Development Life cycle',
    ],
  ),
  QuestionModel(
    question:
        '4. Agile Software Development is based on which of the following type?',
    correctAnswerIndex: 2,
    option: [
      ' a) Iterative Development',
      ' b) Incremental Development',
      ' c) Both Incremental and Iterative Development',
      ' d) Linear Development',
    ],
  ),
  QuestionModel(
    question: '5. _____________ specification is also known as SRS document.',
    correctAnswerIndex: 2,
    option: [
      'a) white-box',
      'b) grey-box',
      'c) black-box',
      'd) none of the mentioned',
    ],
  ),
];
const List<QuestionModel> androidPrograming = [
  QuestionModel(
    question: '1. AAPT stands for',
    correctAnswerIndex: 3,
    option: [
      ' a) Android Access Packaging Tool',
      ' b) Android Asset Packet Tool',
      ' c) Android Assist Packaging Tool',
      'd) Android Asset Packaging Tool',
    ],
  ),
  QuestionModel(question: '2. APK stands for', correctAnswerIndex: 2, option: [
    'a) Android Packet',
    'b) Access Package',
    'c) Android Package',
    'd) Android Packaging',
  ]),
  QuestionModel(
    question:
        '3. Which of the following is the first callback method that is invoked by the system during an activity life-cycle?',
    correctAnswerIndex: 1,
    option: [
      'a)	onClick() method',
      'b)	onCreate() method',
      'c)	onStart() method',
      'd)	onRestart() method',
    ],
  ),
  QuestionModel(
    question: '4. Which of the following is contained in the src folder?',
    correctAnswerIndex: 1,
    option: [
      'a)	XML',
      ' b)	Java source code',
      ' c)	Manifest',
      ' d)	None of the above',
    ],
  ),
  QuestionModel(
    question: '5. Which of the following is the parent class of service?',
    correctAnswerIndex: 3,
    option: [
      'a)	context',
      'b)	object',
      'c)	contextThemeWrapper',
      'd)	contextWrapper',
    ],
  ),
];
const List<QuestionModel> computernetworks = [
  QuestionModel(
    question: '1 OSI stands for',
    correctAnswerIndex: 1,
    option: [
      ' a)	Open Scenario Interconnection',
      ' b)	Open Systems Interconnection',
      ' c)	Open Systems Internet',
      'd)	Open Systems Integration',
    ],
  ),
  QuestionModel(
      question: '2 First layer of OSI model is',
      correctAnswerIndex: 3,
      option: [
        'a)	Data Link',
        'b)	Session',
        'c)	Application',
        'd)	Physical',
      ]),
  QuestionModel(
    question: '3 Expansion of SONET is',
    correctAnswerIndex: 0,
    option: [
      'a)	Synchronous Optical Networking',
      'b)	Synchronous Open Networking',
      'c)	System Optical Networking',
      'd)	Synchronous Optical Network',
    ],
  ),
  QuestionModel(
    question: '4 Expansion of CSMA/CD is',
    correctAnswerIndex: 2,
    option: [
      'a)	Carrier System Multiple Access/Collision Detection',
      ' b)	Carrier Sense Multiple Access/Collision Deletion',
      'c)	Carrier Sense Multiple Access/Collision Detection',
      ' d)	Carrier Signal Multiple Access/Collision Detection',
    ],
  ),
  QuestionModel(
    question: '5 UDP stands for',
    correctAnswerIndex: 0,
    option: [
      'a)	User Datagram Protocol',
      'b)	User Data Protocol',
      'c)	User Diagram Protocol',
      'd)	User Datagram Protection',
    ],
  ),
];
const List<QuestionModel> os = [
  QuestionModel(
    question:
        '1. To access the services of the operating system, the interface is provided by the ___________',
    correctAnswerIndex: 1,
    option: [
      ' a) Library',
      ' b) System calls',
      ' c) Assembly instructions',
      'd) API',
    ],
  ),
  QuestionModel(
      question:
          '2. When a process is in a “Blocked” state waiting for some I/O service. When the service is completed, it goes to the __________',
      correctAnswerIndex: 3,
      option: [
        'a) Terminated state',
        'b) Suspended state',
        'c) Running state',
        'd) Ready state',
      ]),
  QuestionModel(
    question: '3. What is the key objective of Integration testing?',
    correctAnswerIndex: 1,
    option: [
      'a)	Design Errors',
      'b)	Interface Errors',
      'c)	Procedure Errors',
      'd)	None of the mentioned',
    ],
  ),
  QuestionModel(
    question: '4. "V" model is?',
    correctAnswerIndex: 3,
    option: [
      'a)	Test type',
      'b)	Test Level',
      'c)	Test design technique',
      'd)	Software development testing (SDLC) model',
    ],
  ),
  QuestionModel(
    question: '5) What is the main task of test planning?',
    correctAnswerIndex: 2,
    option: [
      'a)	Measuring and analyzing results',
      'b)	Evaluating exit criteria and reporting',
      'c)	Determining the test approach',
      'd)	Preparing the test specification',
    ],
  ),
];
const List<QuestionModel> softwaretesting = [
  QuestionModel(
    question:
        '1. Which of the following is not a valid phase of SDLC (Software Development Life Cycle)?',
    correctAnswerIndex: 3,
    option: [
      ' a)	Testing Phase',
      ' b)	Requirement Phase',
      ' c)	Deployment phase',
      ' d)	Testing closure',
    ],
  ),
  QuestionModel(
      question:
          '2. Which of the following testing is related to the boundary value analysis?',
      correctAnswerIndex: 2,
      option: [
        'a)	White box and black box testing',
        'b)	White-box testing',
        'c)	Black box testing',
        'd)	None of the above',
      ]),
  QuestionModel(
    question:
        '3. For real time operating systems, interrupt latency should be ____________',
    correctAnswerIndex: 1,
    option: [
      'a) zero',
      'b) minimal',
      'c) maximum',
      'd) dependent on the scheduling',
    ],
  ),
  QuestionModel(
    question: '4. A process can be ___________',
    correctAnswerIndex: 2,
    option: [
      'a) single threaded',
      ' b) multithreaded',
      'c) both single threaded and multithreaded',
      'd) none of the mentioned',
    ],
  ),
  QuestionModel(
    question:
        '5. A problem encountered in multitasking when a process is perpetually denied necessary resources is called ____________',
    correctAnswerIndex: 1,
    option: [
      'a) deadlock',
      'b) starvation',
      'c) inversion',
      'd) aging',
    ],
  ),
];

const List<QuestionModel> angiospermAnatomyReproductiveBotanyPalynology = [
  QuestionModel(
      question:
          '1.The waxy substance associated with the wall of the cork cell is ',
      correctAnswerIndex: 3,
      option: [
        'a) Lignin',
        'b) Hemicellulose',
        'c) Cutin',
        'd) Suberin',
      ]),
  QuestionModel(
      question: '2.  A tissue that does not contain lignin',
      correctAnswerIndex: 2,
      option: [
        'a) Sclerenchyma',
        'b) Parenchyma',
        'c) Collenchyma',
        'd) Chlorenchyma',
      ]),
  QuestionModel(
    question: '3. The apical meristem of the root is found in',
    correctAnswerIndex: 3,
    option: [
      'a) Taproots',
      'b) Radicals',
      'c) Adventitious',
      'd) All the root',
    ],
  ),
  QuestionModel(
    question: '4. Bordered pits are found in',
    correctAnswerIndex: 0,
    option: [
      'a) Vessel walls ',
      'b) Sieve cells',
      'c) Sieve Tube ',
      'd) Companion cells ',
    ],
  ),
  QuestionModel(
    question: '5. Where in epiphytes are velamen cells located?',
    correctAnswerIndex: 2,
    option: [
      'a) Below the endodermis',
      'b) Below the epidermis',
      'c) Just outside the cortex',
      'd) Just outside the exodermis',
    ],
  ),
];

// Microbiology, Mycology, Lichenology  and plant pathology
const List<QuestionModel> microbiologyMycologyLichenologyandplantpathology = [
  QuestionModel(
      question: '1.This fungi division includes Club fungi ',
      correctAnswerIndex: 2,
      option: [
        'a) Zygomycota',
        'b) Deuteromycota',
        'c) Basidiomycota',
        'd) Ascomycota',
      ]),
  QuestionModel(
      question:
          '2. What is the name of the special hyphal tips through which parasitic fungi absorb nutrients directly from the cytoplasm of the living host?',
      correctAnswerIndex: 0,
      option: [
        'a) Haustoria',
        'b) Mildew',
        'c) Constricting ring',
        'd) All of the above',
      ]),
  QuestionModel(
    question:
        '3.  The fungi which derive their food directly from dead organic matter are known as',
    correctAnswerIndex: 1,
    option: [
      'a) Predators',
      'b) Decomposers',
      'c) Mutualists',
      'd) Parasitic fungi',
    ],
  ),
  QuestionModel(
    question: '4. The fungal disease – the black rust of wheat is caused by',
    correctAnswerIndex: 2,
    option: [
      'a) Melampsora lini ',
      'b) Claviceps purpurea',
      'c) Puccinia graminis tritici ',
      'd) Albugo candida ',
    ],
  ),
  QuestionModel(
    question:
        '5. Which of these entities is an indicator of the SO2 pollution of air?',
    correctAnswerIndex: 3,
    option: [
      'a) Puffball',
      'b) Mushrooms',
      'c) Mosses',
      'd) Lichen',
    ],
  ),
];

// Phycology, Bryology and Pteridology
const List<QuestionModel> phycologyBryologyandPteridology = [
  QuestionModel(
      question:
          '1.In which of the following groups would you place a plant that produces spores, lacks seeds and has vascular tissue? ',
      correctAnswerIndex: 2,
      option: [
        'a) Bryophyte',
        'b) Algae',
        'c) Pteriophyte',
        'd) Gymnosperm',
      ]),
  QuestionModel(
      question: '2. In Pteridophytes, the dominant generation is ',
      correctAnswerIndex: 2,
      option: [
        'a) Gametophytic',
        'b) Haploid',
        'c) Diploid',
        'd) triploid',
      ]),
  QuestionModel(
    question: '3. Reduction division in pteridophytes occurs in  ',
    correctAnswerIndex: 2,
    option: [
      'a) Prothallus is formed',
      'b) Gametes are formed',
      'c) Spores are formed',
      'd) sex organs are formed',
    ],
  ),
  QuestionModel(
    question: '4. Prothallus represents',
    correctAnswerIndex: 1,
    option: [
      'a) Sporophytic phase in a fern ',
      'b) Gametophytic phase in a fern',
      'c) Sporophytic phase in a gymnosperm',
      'd) Gametophytic phase in a gymnosperm ',
    ],
  ),
  QuestionModel(
    question: '5. Pteridophytes and Bryophytes differ in having',
    correctAnswerIndex: 3,
    option: [
      'a) Spermatozoids',
      'b) Archegonia',
      'c) Separate gametophytes',
      'd) Conducting system',
    ],
  ),
];

// Methodology & Perspective in Plant Science
const List<QuestionModel> methodologyPerspectiveinPlantScience = [
  QuestionModel(
      question:
          '1.The method that consists of collection of data through observation and experimentation, formulation and testing of hypothesis is called ',
      correctAnswerIndex: 1,
      option: [
        'a) Empirical method',
        'b) Scientific method',
        'c) Scientific information',
        'd) Practical knowledge',
      ]),
  QuestionModel(
      question:
          '2. Information acquired by experience or experimentation is called as ',
      correctAnswerIndex: 0,
      option: [
        'a) Empirical',
        'b) Scientific',
        'c) Facts',
        'd) Scientific evidences',
      ]),
  QuestionModel(
    question:
        '3. “All living things are made up of cells Blue whale is a living being Therefore blue whale is made up of cells” The reasoning used here is  ',
    correctAnswerIndex: 1,
    option: [
      'a) Inductive',
      'b) Deductive',
      'c) Both a and b',
      'd) Hypothetico-deductive',
    ],
  ),
  QuestionModel(
    question:
        '4. The reasoning that uses general principle to predict specific results is called',
    correctAnswerIndex: 1,
    option: [
      'a) Inductive',
      'b) Deductive',
      'c) Both a and b',
      'd) Hypothetico-deductive',
    ],
  ),
  QuestionModel(
    question: '5. Pteridophytes and Bryophytes differ in having',
    correctAnswerIndex: 1,
    option: [
      'a) Inductive',
      'b) Deductive',
      'c) Both a and b',
      'd) Hypothetico-deductive',
    ],
  ),
];

// Gymnosperms, Paleobotany Phytogeography and Evolution
const List<QuestionModel> gymnospermsPaleobotanyPhytogeographyandEvolution = [
  QuestionModel(
      question: '1.‘Saccus’ term is used for ',
      correctAnswerIndex: 2,
      option: [
        'a) Exine of pollen grains of Pinus',
        'b) Intine of pollen grains of Pinus',
        'c) Wings of pollen grains of Pinus',
        'd) Wings of seeds of Pinus',
      ]),
  QuestionModel(
      question: '2. Flowers and cones are similar because ',
      correctAnswerIndex: 3,
      option: [
        'a) Both assist seed dispersal',
        'b) Both are responsible for attracting insects to pollinate',
        'c) Both are shiny and bright',
        'd) Both are reproductive structures',
      ]),
  QuestionModel(
    question:
        '3. An autotrophic, prokaryotic and nitrogen-fixing symbiont is present in  ',
    correctAnswerIndex: 1,
    option: [
      'a) Cicer',
      'b) Cycas',
      'c) Sequoia',
      'd) Pinus',
    ],
  ),
  QuestionModel(
    question: '4. Pick the pair that is incorrectly matched',
    correctAnswerIndex: 1,
    option: [
      'a) Cycas – coralloid roots',
      'b) Abies – wood tar, wood gas',
      'c) Pinus – Mycorrhizal roots',
      'd) Sequoia – Redwood tree',
    ],
  ),
  QuestionModel(
    question:
        '5. This serves as a connecting link between the angiosperms and gymnosperms',
    correctAnswerIndex: 0,
    option: [
      'a) Gnetales',
      'b) Coniferales',
      'c) Ginkgoales',
      'd) Cycadales',
    ],
  ),
];

// Angiosperms Morphology And Plant Systematics
const List<QuestionModel> angiospermsMorphologyAndPlantSystematics = [
  QuestionModel(
      question:
          '1.The system of plant classification proposed by Carolus Linnaeus was artificial because',
      correctAnswerIndex: 1,
      option: [
        'a) It was based on evolutionary relationship of plants',
        'b) It was based on similarities and differences in floral and other morphological characters only',
        'c) It took into account the physiological facts along with the morphological characters',
        'd) None of the above',
      ]),
  QuestionModel(
      question: '2. Linnaeus is credited with introducing ',
      correctAnswerIndex: 3,
      option: [
        'a) The concept of inheritance',
        'b) Law of limiting factor',
        'c) Theory of heredity',
        'd) Binomial nomenclature',
      ]),
  QuestionModel(
    question:
        '3. Out of the 4 widely known systems of classification one remains less phylogenetic and more natural and that is of   ',
    correctAnswerIndex: 2,
    option: [
      'a) Engler and Prantl',
      'b) Hutchinson',
      'c) SBentham and Hooker',
      'd) Rendle',
    ],
  ),
  QuestionModel(
    question:
        '4. The chief merit of Bentham and Hookers classification is that',
    correctAnswerIndex: 1,
    option: [
      'a) it is a natural system of classification of all group of plants',
      'b) a system based on evolutionary concept',
      'c) it also considered the phylogenetic aspect',
      'd) The description of taxa are based on actual examination of the specimens',
    ],
  ),
  QuestionModel(
    question: '5. ‘Systema Naturae’ written by Linnaeus contains a list of',
    correctAnswerIndex: 3,
    option: [
      'a) 4000 species of plants',
      'b) 2000 species of plants',
      'c) 4200 species of plants',
      'd) 4200 species of animals',
    ],
  ),
];

//  Tissue Culture Horticulture Economic Botany And Ethnobotany
const List<QuestionModel>
    tissueCultureHorticultureEconomicBotanyAndEthnobotany = [
  QuestionModel(
      question: '1.Who is known as the Father of tissue culture?',
      correctAnswerIndex: 2,
      option: [
        'a) Bonner',
        'b) Laibach',
        'c) Haberlandt',
        'd) Gautheret',
      ]),
  QuestionModel(
      question:
          '2. The production of secondary metabolites requires the use of ________. ',
      correctAnswerIndex: 3,
      option: [
        'a) Meristem',
        'b) Protoplast',
        'c) Axillary buds',
        'd) Cell suspension',
      ]),
  QuestionModel(
    question:
        '3. The pair of hormones required for a callus to differentiate are________.  ',
    correctAnswerIndex: 1,
    option: [
      'a) Ethylene and Auxin',
      'b) Auxin and cytokinin',
      'c) Auxin and Abscisic acid',
      'd) Cytokinin and gibberellin',
    ],
  ),
  QuestionModel(
    question: '4. What is Dimethyl sulfoxide used for?',
    correctAnswerIndex: 1,
    option: [
      'a) A gelling agent',
      'b) Cryoprotectant',
      'c) Chelating agent',
      'd) An Alkylating agent',
    ],
  ),
  QuestionModel(
    question:
        '5.  The formation of embryoids from the pollen grains in the tissue culture medium is due to ________.',
    correctAnswerIndex: 3,
    option: [
      'a) Organogenesis',
      'b) Test tube culture',
      'c) Test tube tissue',
      'd) 4200 species of animals',
    ],
  ),
];

//  Cell Biology And Biochemistry
const List<QuestionModel> cellBiologyAndBiochemistry = [
  QuestionModel(
      question: '1.The term cell was given by',
      correctAnswerIndex: 0,
      option: [
        'a) Robert Hooke',
        'b) Tatum',
        'c) Schwann',
        'd) De Bary',
      ]),
  QuestionModel(
      question: '2. The cell is not applied for ',
      correctAnswerIndex: 2,
      option: [
        'a) Algea',
        'b) Bacteria',
        'c) Virus',
        'd) Fungi',
      ]),
  QuestionModel(
    question: '3. The membrane around the vacuole is known as  ',
    correctAnswerIndex: 0,
    option: [
      'a) Tonoplast',
      'b) Elaioplast',
      'c) Cytoplast',
      'd) Amyloplast',
    ],
  ),
  QuestionModel(
    question: '4. Microfilaments are composed of a protein called',
    correctAnswerIndex: 1,
    option: [
      'a) Tubulin',
      'b) Actin',
      'c) Myosin',
      'd) Chitin',
    ],
  ),
  QuestionModel(
    question: '5.  A plant cell wall is mainly composed of',
    correctAnswerIndex: 1,
    option: [
      'a) Protien',
      'b) Cellulose',
      'c) Lipid',
      'd) Starch',
    ],
  ),
];

//  Genetics And Plant Breeding
const List<QuestionModel> geneticsAndPlantBreeding = [
  QuestionModel(
      question:
          '1.ln tissue culture medium, the embryoids formed from pollen grains is due to the',
      correctAnswerIndex: 0,
      option: [
        'a) Cellular totipotency ',
        'b) Organogenesis',
        'c) Double fertilisationt',
        'd) Test tube culture',
      ]),
  QuestionModel(
      question: '2. Haploid plantlets can be produced by ',
      correctAnswerIndex: 0,
      option: [
        'a) Pollen culture',
        'b) Cotyledon culture',
        'c) Embryo culture',
        'd) Meristem culture',
      ]),
  QuestionModel(
    question:
        '3. The three topmost major crops of the world in the order of total production are  ',
    correctAnswerIndex: 0,
    option: [
      'a) maize > wheat > rice',
      'b) rice > wheat > maize',
      'c) wheat > maize > rice',
      'd) rice > maize > wheat',
    ],
  ),
  QuestionModel(
    question: '4. Bread wheat is',
    correctAnswerIndex: 1,
    option: [
      'a) Autopolyploid',
      'b) Allopolyploid',
      'c) Aneuploid',
      'd) Trisomic',
    ],
  ),
  QuestionModel(
    question: '5.  Which variety is not a result of induced mutations?',
    correctAnswerIndex: 2,
    option: [
      'a) Sharbati Sonara of wheat',
      'b) Jagannath of rice',
      'c) Bombay green of banana',
      'd) Aruna of castor',
    ],
  ),
];

//  Biotechnology, Molecular Biology And Bioinformatics
const List<QuestionModel> biotechnologyMolecularBiologyAndBioinformatics = [
  QuestionModel(
      question:
          '1.Which of the following is an example of Homology and similarity tool?',
      correctAnswerIndex: 0,
      option: [
        'a) BLAST',
        'b) RasMol',
        'c) EMBOSS',
        'd) PROSPECT',
      ]),
  QuestionModel(
      question:
          '2. In which year did the SWISSPROT protein sequence database begin? ',
      correctAnswerIndex: 3,
      option: [
        'a) 1988',
        'b) 1985',
        'c) 1986',
        'd) 1987',
      ]),
  QuestionModel(
    question:
        '3. Which of the following scientists created the first Bioinformatics database?  ',
    correctAnswerIndex: 0,
    option: [
      'a) Dayhoff',
      'b) Pearson',
      'c) Richard Durbin',
      'd) Michael.J.Dunn',
    ],
  ),
  QuestionModel(
    question: '4. The human genome contains approximately__________.',
    correctAnswerIndex: 2,
    option: [
      'a) 6 billion base pairs',
      'b) 5 billion base pairs',
      'c) 3 billion base pairs',
      'd) 4 billion base pairs',
    ],
  ),
  QuestionModel(
    question:
        '5.  Which of the following tools is used for the identification of motifs?',
    correctAnswerIndex: 1,
    option: [
      'a) BLAST',
      'b) COPIA',
      'c) PROSPECT',
      'd) Pattern hunter',
    ],
  ),
];

//  Plant Physiology And Metabolism
const List<QuestionModel> plantPhysiologyAndMetabolism = [
  QuestionModel(
      question:
          '1.Who Articulated the ‘Law of Limiting Factor’ in Photosynthesis?',
      correctAnswerIndex: 0,
      option: [
        'a) Blackman',
        'b) Calvin',
        'c) Ruben',
        'd) Emerson',
      ]),
  QuestionModel(
      question: '2. Who is Regarded as the Father of Plant Physiology? ',
      correctAnswerIndex: 0,
      option: [
        'a) Stephen hales',
        'b) Funk',
        'c) Fisher',
        'd) W.Kurtis',
      ]),
  QuestionModel(
    question: '3. Who Discovered the Process of Photophosphorylation?  ',
    correctAnswerIndex: 0,
    option: [
      'a) Warburg',
      'b) Arnon',
      'c) Calvin',
      'd) Priestley',
    ],
  ),
  QuestionModel(
    question: '4. What is the End Product of the Calvin Cycle?',
    correctAnswerIndex: 1,
    option: [
      'a) PGA',
      'b) ADP+NADP',
      'c) RuBP',
      'd) PGal',
    ],
  ),
  QuestionModel(
    question: '5.  Which Metabolic Pathway Produces Carbohydrate?',
    correctAnswerIndex: 1,
    option: [
      'a) Glycolysis',
      'b) Kerbs cycle',
      'c) Cyclic electron pathway',
      'd) Calvin cycle',
    ],
  ),
];

//  Environmental Science
const List<QuestionModel> environmentalScience = [
  QuestionModel(
      question:
          '1.Which of the following is the main reason for producing the atmospheric greenhouse effect?',
      correctAnswerIndex: 1,
      option: [
        'a) Absorption and re-emission of ultraviolet radiations by the atmosphere',
        'b) Absorption and re-emission of infrared radiations by the atmosphere',
        'c) Absorption and re-emission of visible light by the atmosphereRuben',
        'd) None of the above',
      ]),
  QuestionModel(
      question: '2. The salinization can be defined as -',
      correctAnswerIndex: 3,
      option: [
        'a) Accumulation of salts in the body',
        'b) Accumulation of salts in water',
        'c) Accumulation of salts in animals',
        'd) Accumulation of salts in the soil',
      ]),
  QuestionModel(
    question: '3. The main reason for blueness of the sky is -  ',
    correctAnswerIndex: 0,
    option: [
      'a) Due to the presence of water vapor',
      'b) Due to the absorption of blue light due to the air',
      'c)	Due to the scattering of sunlight by air moleculesn',
      'd) None of the above',
    ],
  ),
  QuestionModel(
    question: '4. Which of the following is the cause of soil pollution?',
    correctAnswerIndex: 1,
    option: [
      'a) Ozone',
      'b) Aerosol',
      'c) Acid rain',
      'd) None of the above',
    ],
  ),
  QuestionModel(
    question: '5.  What is the water vapor?',
    correctAnswerIndex: 1,
    option: [
      'a) It is the gaseous phase of water',
      'b) It is a rain droplet',
      'c) Water vapor is the cloud droplet',
      'd) None of the above',
    ],
  ),
];
// Sem1= MANAGEMENT THEORY AND PRACTICES
const List<QuestionModel> mANAGEMENTTHEORYANDPRACTICES = [
  QuestionModel(
      question:
          '1.Scientific Management were more concerned with the problems at the _________ levels ',
      correctAnswerIndex: 2,
      option: [
        'a)	higher levels',
        'b)	middle',
        'c)	operating',
        'd)	none',
      ]),
  QuestionModel(
      question:
          '2.______is undertaken to find out the one best way of doing the thing',
      correctAnswerIndex: 0,
      option: [
        'a)	job analysis.',
        'b)	merit rating.',
        'c)	job enrichment.',
        'd)	None',
      ]),
  QuestionModel(
    question: '3.The Book “ Functions of Executive” was written by …………………..',
    correctAnswerIndex: 1,
    option: [
      'a)	P.F. Drucker',
      'b)	Chester Barnard',
      'c)	Herbert Simon',
      'd)	None',
    ],
  ),
  QuestionModel(
    question:
        '4.Koontz and O Donnel are the advocates of _______ approach to manageme',
    correctAnswerIndex: 3,
    option: [
      'a)	system approach',
      'b)	empirical',
      'c)	contingency ',
      'd)	operational',
    ],
  ),
  QuestionModel(
    question:
        '5._________approach of management heavily concentrates on People aspect of management.',
    correctAnswerIndex: 0,
    option: [
      'a) human relations',
      'b) system',
      'c) empirical',
      'd) management science',
    ],
  ),
];

//Sem1=MANAGERIAL ECONOMICS

const List<QuestionModel> mANAGERIALECONOMICS = [
  QuestionModel(
      question: '1. A utility function shows the relation between _______ ',
      correctAnswerIndex: 0,
      option: [
        'a)	The amount of goods consumed and a consumer utility.',
        'b)	Income and a consumer utility.',
        'c)	Prices and consumers utility.',
        'd)	Maximum utility and the price and income facing a consumer.',
      ]),
  QuestionModel(
      question: '2._______ is known as father of economics',
      correctAnswerIndex: 2,
      option: [
        'a)	Marshal',
        'b)	Robins',
        'c)	Adam smith',
        'd)	A C Pigou',
      ]),
  QuestionModel(
    question:
        '3. The famous book on economics “An Enquiry into the Nature and Cause of Wealth of Nation” was written by',
    correctAnswerIndex: 3,
    option: [
      'a)	Marshal',
      'b)	Ricardo',
      'c)	Robins',
      'd)	Adam smith',
    ],
  ),
  QuestionModel(
    question: '4. Welfare (neo classical) definition of economics is given by',
    correctAnswerIndex: 3,
    option: [
      'a)	J B Say',
      'b)	Lionel Robbins',
      'c)	Adam Smith',
      'd)	Alfred Marshall',
    ],
  ),
  QuestionModel(
    question:
        '5. If the income elasticity of demand is that one, the good is a',
    correctAnswerIndex: 0,
    option: [
      'a)	Necessity',
      'b)	Luxury',
      'c)	Substitute',
      'd)	Complement',
    ],
  ),
];

// sem2=FINANCIAL ACCOUNTING

const List<QuestionModel> fINANCIALACCOUNTING = [
  QuestionModel(
      question: '1. Basic function of accounting is to',
      correctAnswerIndex: 3,
      option: [
        'a) Summarise the data.',
        'b) Assist the management in performing functions effectively',
        'c) Interpret the financial data',
        'd) Record all business transactions of monetary nature',
      ]),
  QuestionModel(
      question:
          '2.  Liabilities of a firm are 8,00,000 and capital of the proprietor is 7,00,000. Then total assets are:',
      correctAnswerIndex: 1,
      option: [
        'a) 2,00,000',
        'b) 15,00,000',
        'c) 4,00,000',
        'd) 6,00,000',
      ]),
  QuestionModel(
    question: '3. Which of the following is not a business transaction?',
    correctAnswerIndex: 1,
    option: [
      'a) Goods purchased from 1000',
      'b)	Placed an order for purchasing the goods for 2000',
      'c)	Received interest from Bank 5000',
      'd)	Rent paid to Landlord 3000',
    ],
  ),
  QuestionModel(
    question:
        '4. This method of writing every transaction in two accounts is known as',
    correctAnswerIndex: 0,
    option: [
      'a)	Double entry',
      'b)	Triple',
      'c)	Single entry',
      'd)	None',
    ],
  ),
  QuestionModel(
    question: '5. Income taxes Comes under',
    correctAnswerIndex: 1,
    option: [
      'a) Ind AS 11',
      'b)	Ind AS 12',
      'c)	Ind AS 13',
      'd)	Ind AS 14',
    ],
  ),
];

//sem2=MARKETING MANAGEMENT

const List<QuestionModel> mARKETINGMANAGEMENT = [
  QuestionModel(
      question:
          '1.Which of the following is NOT an element of the marketing mix?',
      correctAnswerIndex: 2,
      option: [
        'a) Distribution',
        'b) Product',
        'c) Target market',
        'd)	Pricing',
      ]),
  QuestionModel(
      question: '2.Political campaigns are generally examples of_____',
      correctAnswerIndex: 3,
      option: [
        'a)	Cause marketing',
        'b)	Organization marketing',
        'c)	Event marketing',
        'd)	Person marketing',
      ]),
  QuestionModel(
    question: '3. The term marketing refers to:',
    correctAnswerIndex: 1,
    option: [
      'a)	New product concepts and improvements',
      'b)	Advertising and promotion activities',
      'c)	A philosophy that stresses customer value and satisfaction',
      'd)	Planning sales campaigns',
    ],
  ),
  QuestionModel(
    question:
        '4. When looking at consumer income, marketers are most interested in',
    correctAnswerIndex: 0,
    option: [
      'a)	Discretionary income',
      'b)	Deferred income',
      'c)	Inflationary income',
      'd)	Disposable income',
    ],
  ),
  QuestionModel(
    question:
        '5. Typically profit is negative in which stage of the product life cycle?',
    correctAnswerIndex: 1,
    option: [
      'a)	Growth',
      'b)	Maturity',
      'c)	Introduction',
      'd)	Decline',
    ],
  ),
];

//sem3=CORPORATE ACCOUNTING

const List<QuestionModel> corporateaccouting = [
  QuestionModel(
      question:
          '1.	The company formed by the special Act of legistures of parliament is known as',
      correctAnswerIndex: 2,
      option: [
        'a) Public Company ',
        'b) registered company',
        'c) statutory company ',
        'd)	chartered company',
      ]),
  QuestionModel(
      question:
          '2. What is the minimum required paid up capital of a public company',
      correctAnswerIndex: 1,
      option: [
        'a)	10lakhs',
        'b)	5lakhs ',
        'c)	15lakhs ',
        'd)	25lakhs ',
      ]),
  QuestionModel(
    question:
        '3. When Redeemable Preference shares are due for redemption, the entry passed is',
    correctAnswerIndex: 1,
    option: [
      'a) Debit redeemable Preference Share capital a/c; Credit cash a/c',
      'b) Debit Redeemable Preference share capital a/c; credit Preference shareholders a/c',
      'c) Debit preference shareholders a/c; credit cash a/c',
      'd) Debit preference shareholders a/c; credit capital reduction a/c',
    ],
  ),
  QuestionModel(
    question:
        '4. Which of the following can be utilized for the redemption of preference shares of a company out of profit:',
    correctAnswerIndex: 1,
    option: [
      'a)	Shares forfeited account',
      'b)	Development rebate reserve account',
      'c)	Capital redemption reserve account',
      'd)	Dividend equalization reserve',
    ],
  ),
  QuestionModel(
    question: '5. Which of the following statements are incorrect?',
    correctAnswerIndex: 2,
    option: [
      'a)	A company registered in India issues only Equity and Preference shares.',
      'b) The preference share is that part of share capital which enjoys preferential rights regarding repayment of Capital and payment of Dividend',
      'c) A Public limited company can commence business as soon as it is incorporated.',
      'd) A private company can commence business after getting the certificate ',
    ],
  ),
];
