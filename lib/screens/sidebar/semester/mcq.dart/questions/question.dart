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
