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

const List<QuestionModel> bca11 = [
  QuestionModel(question: '1.MIME stands for ', correctAnswerIndex: 0, option: [
    'a) Multimedia Internet Mail Extensions',
    'b) Multipurpose Internet Multimedia Extensions',
    'c) Multipurpose Internet Mail Extensions',
    'd) Multiple Internet Mail Extensions',
  ]),
  QuestionModel(
      question:
          '2. …………… attribute of a table determine how much space there is between the contents of a cell and its border.',
      correctAnswerIndex: 2,
      option: [
        'a) cellspacing',
        'b) margin',
        'c) cellpadding',
        'd) cellborder',
      ]),
  QuestionModel(
    question: '3. ………………tag is used to include javascript into the HTML page.',
    correctAnswerIndex: 1,
    option: [
      'a) <link>',
      'b) <script>',
      'c) <javascript>',
      'd) <style>',
    ],
  ),
  QuestionModel(
    question: '4. In javascript what does is NaN function do?',
    correctAnswerIndex: 0,
    option: [
      'a) Return true if the argument is not a number ',
      'b) Return false if the argument is not a number',
      'c) Return true if the argument is a number ',
      'd) None of the above ',
    ],
  ),
  QuestionModel(
    question:
        '5. …………method is used to remove focus from the specified object.',
    correctAnswerIndex: 0,
    option: [
      'a) blur()',
      'b) unload()',
      'c) focus()',
      'd) removefocus()',
    ],
  ),
  // QuestionModel(
  //   question: '6. Javascript code can be called by using',
  //   correctAnswerIndex: 3,
  //   option: [
  //     'a) method',
  //     'b) preprocessor',
  //     'c) RMI',
  //     'd) triggering event',
  //   ],
  // ),
  // QuestionModel(
  //   question:
  //       '7. In PHP ……………. tests a variable to see whether it has been assigned a value.',
  //   correctAnswerIndex: 1,
  //   option: [
  //     'a) set()',
  //     'b) isNull()',
  //     'c) isSet()',
  //     'd) None',
  //   ],
  // ),
  // QuestionModel(
  //   question: '8. Which is not an attribute of the cookie property',
  //   correctAnswerIndex: 1,
  //   option: [
  //     'a) path',
  //     'b) host',
  //     'c) secure',
  //     'd) domain',
  //   ],
  // ),
  // QuestionModel(
  //   question: '9.To use mysql on your computer, youll need',
  //   correctAnswerIndex: 3,
  //   option: [
  //     'a) Perl, PHP or Java',
  //     'b) FTP and Telnet',
  //     'c) Browser',
  //     'd) All of them',
  //   ],
  // ),
  // QuestionModel(
  //   question:
  //       '10. To remove duplicate rows from the result set of a SELECT use the following keyword:',
  //   correctAnswerIndex: 2,
  //   option: [
  //     'a) NO DUPLICATE',
  //     'b) UNIQUE',
  //     'c) DISTINCT',
  //     'd) None of the above',
  //   ],
  // ),
];
