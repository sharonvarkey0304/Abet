import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginpage/controler/contribution_controller.dart';
import 'package:loginpage/screens/sidebar/semester/content_details.dart';
import 'package:loginpage/screens/sidebar/semester/mcq.dart/mcqScreen.dart';
import 'package:loginpage/screens/sidebar/semester/mcq.dart/questions/question.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key, required this.subjectName});
  final String subjectName;

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  final contributionCntrller = Get.put(ContributionController());

  @override
  void initState() {
    contributionCntrller.setItemsInsideSubjectList(widget.subjectName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            title: Text('subject shows here'),
            centerTitle: true,
          ),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(
                  icon: Icon(
                    Icons.book_outlined,
                    color: Colors.black,
                  ),
                  text: 'NOTES',
                ),
                Tab(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  text: 'M C Q',
                ),
              ],
              indicatorColor: Color.fromARGB(255, 255, 196, 59),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount:
                        contributionCntrller.itemsInsideSubjectList.length,
                    itemBuilder: (context, index) {
                      final item =
                          contributionCntrller.itemsInsideSubjectList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContentDetailsPage(
                                  item: item,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber.withOpacity(0.1)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        color: Colors.grey.withOpacity(0.5),
                                        child: Image.network(
                                          item.imageBase64 ?? "",
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              width: 30,
                                              height: 30,
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      item.title.toString(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  McqScreen(
                    questions: questions(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<QuestionModel> questions() {
    switch (widget.subjectName) {
      //bca
      case 'Computer fundamentals and html':
        return computerFundamentalsAndHtml;
      case 'Mathematical foundation':
        return mathematicalFoundation;
      case 'Discrete mathematics':
        return discreteMathematics;
      case 'Problem solving using c':
        return problemSolvingUsingC;
      case 'Financial and management accounting':
        return finacialAndManagementAccounting;
      case 'Operation research':
        return operationResearch;
      case 'Data structure using c':
        return dataStructureUsingC;
      case 'Python programming':
        return pythonPrograming;
      case 'Computer oriented numerical and statistical methods':
        return computeroriented;
      case 'Data communication and optical fibers':
        return datacommunication;
      case 'Theory of computation':
        return toc;
      case 'Microprocessors architecture and programming':
        return microprocessors;
      case 'Sensors and transducers':
        return sensors;
      case 'Database management system and rdbms':
        return rdbms;
      case 'E-commerce':
        return ecommers;
      case 'Computer graphics':
        return cg;
      case 'Computer organisation and architechture':
        return coa;
      case 'Web programming using php':
        return php;
      case 'Java programming':
        return java;
      case 'Principle of software engineering':
        return se;
      case 'Android programming':
        return androidPrograming;
      case 'Computer networks':
        return computernetworks;
      case 'Operating system':
        return os;
      case 'Software testing and quality assurance':
        return softwaretesting;

      //bsc
      case 'Angiosperm anatomy reproductive botany &palynology':
        return angiospermAnatomyReproductiveBotanyPalynology;
      case 'Microbiology,mycrology, lichenology and plant pathology':
        return microbiologyMycologyLichenologyandplantpathology;
      case 'Phycology, bryology and pteridology':
        return phycologyBryologyandPteridology;
      case 'Methodology&perspective in plant science':
        return methodologyPerspectiveinPlantScience;
      case 'Gymnosperms,palaeobotany phytogeography and evolution':
        return gymnospermsPaleobotanyPhytogeographyandEvolution;
      case 'Angiosperms morphology and plant systematics':
        return angiospermsMorphologyAndPlantSystematics;
      case 'Tissue culture horticulture Economic botany and ethnobotany':
        return tissueCultureHorticultureEconomicBotanyAndEthnobotany;
      case 'Cell biology and biochemistry':
        return cellBiologyAndBiochemistry;
      case 'Genetics and plant breeding':
        return geneticsAndPlantBreeding;
      case 'Biotechnology moleculer Biology and bioinformatics':
        return biotechnologyMolecularBiologyAndBioinformatics;
      case 'Plant physiology and metabolism':
        return plantPhysiologyAndMetabolism;
      case 'Environmental science':
        return environmentalScience;

      //bba

      case 'Management theory and practices':
        return mANAGEMENTTHEORYANDPRACTICES;
      case 'Managerial economics':
        return mANAGERIALECONOMICS;
      case 'Financial accounting':
        return fINANCIALACCOUNTING;
      case 'Marketing management':
        return mARKETINGMANAGEMENT;
      case 'Corporate accounting':
        return corporateaccouting;
      case 'Financial management':
        return mANAGEMENTTHEORYANDPRACTICES;
      case 'Cost and management accounting':
        return mANAGERIALECONOMICS;
      case 'Corporate regulations':
        return fINANCIALACCOUNTING;
      case 'Human resources management':
        return mANAGERIALECONOMICS;
      case 'Business research methods':
        return mANAGEMENTTHEORYANDPRACTICES;
      case 'Operations management':
        return mANAGERIALECONOMICS;
      case 'Organizational behaviour':
        return fINANCIALACCOUNTING;
      case 'Management science':
        return mANAGERIALECONOMICS;
      case 'Project management':
        return mANAGEMENTTHEORYANDPRACTICES;
      default:
        return [];
    }
  }
}
