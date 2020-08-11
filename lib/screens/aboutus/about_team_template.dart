import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:erobot_app/models/models.dart';

class AboutTeamTemplate extends StatefulWidget {
  final index; //ARTICLE INDEX FROM TeamReputation();
  AboutTeamTemplate(this.index);
  @override
  _AboutTeamTemplateState createState() => _AboutTeamTemplateState(index);
}

class _AboutTeamTemplateState extends State<AboutTeamTemplate> {
  final int index;
  _AboutTeamTemplateState(this.index);

  //SECTION 1 - MEMORIES - PICTURES COLLECTION
  final List<String> imagePath = [
    'arduino_doc.png',
    'our_team.png',
    'our_team.png',
    'our_team.png',
    'our_team.png',
    'our_team.png'
  ];

  //SECTION 2 - PARTICIPATING MEMBER 
  final List<String> member = ['Suy Kosal', 'Han Leangsiv', 'Run Seyha'];
  final List<String> memberPath = ['kosal.png', 'leangsiv.png', 'seyha.png'];

  //SECTION 3 - ROBOT USED
  final List<String> robot = ['Car runner', 'Ball shooter', 'Car runner'];
  final List<String> robotPath = [
    'car_runner.png',
    'ball_shooter.png',
    'car_runner.png'
  ];

  final String paragraph1 =
      'នៅថ្ងៃទី 12​ ខែ​កុម្ភៈ​  ឆ្នាំ 2019​ គឺជាថ្ងៃចាប់ផ្ដើម​ និងធ្វើអោយ​ក្រុមមួយនេះ​ ចាប់​ផ្ដើម​ទទួល​បាន​ការងារ​ដំបូង​របស់ខ្លួន​ ក្រោយពីត្រូវបានគេ បដិសេធ​ជាច្រើន​សារ។   ការងារនោះគឺ​  Event STEM នៅ​អូឡាំពិក​ដោយ​តំណាង​អោយក្រុម​ហ៊ុន​ Smart​  ពួកយើងក៏បាន​រៀបចំ​កម្មវីធី​នេះ​ចំនួន​បីថ្ងៃ​ គឺចាប់ពី​ថ្ងៃទី 21​  ខែ​កុម្ភៈ​  ឆ្នាំ​ដដែរ​។ ពួកយើង​ទទួលបាន​លុយនៅថ្ងៃទី​ 16​ ខែ​កុម្ភៈ​ឆ្នាំដដែរ​ចំនួន 400\$​ ដើម្បី​រៀបចំ​កម្មវីធី​។  ដោយយើងបាន​បង្កើត​  Robot​ទាំងតូចទាំងធំគឺ 10គ្រឿង។   ទីកន្លែងធ្វើវាគឺយើងនាំគ្នា​ បែងចែកជាពីរផ្នែក​ គឺមួយផ្នែកនៅបន្ទប់ជួលរបស់ខ្ញុំ​ និងមួយផ្នែកទៀតនៅ​ សាលា NPIC​ ដែលមានចម្ងាយប្រហែល20Km​ ពីភ្នំពេញ​ ដោយមានការជួយជ្រុំជ្រែងដោយប្អូនប្រុសណារិន​ សីហា​ និងតូនី​ ពួកយើងបានធ្វើវាទាំងយប់ហើយពួកគាត់​ ពិតជា​តស៊ូ​ណាស់​ ពេលនោះដែរ ខាងសាលាបានរករឿងពួកគាត់ដោយនាំមនុស្សប្លែកមុខដូចជាពួកខ្ញុំទៅធ្វើការនៅទីនោះ។​ ហើយនៅខាងបន្ទាប់ជួយខ្ញុំវិញ​ ម្ចាស់ផ្ទះ​បានរករឿងអ្នកដែលនាំគ្នាទៅគេងធ្វើ Robot​ ទាំងយប់ហើយបង្កអោយមាន​បញ្ហាកើតឡើង។ ពួកយើងបានដោះស្រាយបានហើយព្យាយាមបន្តដោយក្ដី​សង្ឃឹម​។';
  final String paragraph2 =
      'អ្វីដែលក្រុមយើងទទួលបាន​ជោគជ័យ​បំផុតនោះគឺ​ ពួកយើងបាននាំអោយ​មនុស្សម្នាជាច្រើនចូលមកកាន់​ ប៉ូត Robot​របស់​យើង​ ហើយលេង​កំសាន្តដោយ​រីករាយ​  ជា​ពិសេសគឺ​ពួកយើង​បាននាំអោយ​ ក្រុម​ហ៊ុន​ ពេញចិត្តនឹងចង់អោយពួកយើង​ បន្តការងារនេះទៅមុខទៀត។ សរុប​ចំនួនទាំងអស់ជិត៣០​ នាក់ពួកយើងបាន​ខិតខំ​យ៉ាងខ្លាំងក្នុងការងារមួយនេះ។​ ក្នុង​រយៈពេលមុន​ និង​អំឡុង​ពេលកម្មវិធី​ មាន​សមាជិក​យើងខ្លះ​ ដែលពួកគាត់​សកម្មរហូតត្រូវមិនគេង​ រយៈពេលជិត៥​ ថ្ងៃហើយមាន​ថ្ងៃខ្លះ​ ពួកយើងមិនបានគេងសោះតែម្ដង។ នេះហើយជា​ឆន្ទៈ​ពិតដោយមិនគិតសោះថាកាងារនោះជាការងារ​ស្មាក់ចិត្ត​។   ខ្ញុំនិយាយទាំងអស់នេះ​ ពិតណាស់មិនអាច​រៀបរាប់​អស់​សេចក្ដី​នោះទេ​ តែខ្ញុំនៅតែ​ចង់ចាំនូវ​សេចក្ដី​ ព្យាយាម​  ប្រឹងប្រែង​ជា​ពិសេសគឺ​មិនខ្លាចភាពនឿយ​ហត់​ របស់ពួកគេ។   បើគ្មានពួកគេទេ​ ខ្ញុំ​ជឿជាក់​ថា​ កម្មវិធី​នោះមិនអាច​ទទួល​បាន​ជោគជ័យ​ដូចនោះទេ។ នេះហើយ​ សកម្មភាព​ និង​ កម្លាំង​របស់​យុវជនយើង​  ពួកគេជាមនុស្ស​រីកចំរើន​។ ក្រោយការងារនេះបាន​បញ្ចប់​  ពួកយើបាន​បន្តការងាររៀនជាមួយគ្នាទៀត។';

  //IMAGE INDEX FROM LIST (FOR CHANGABLE IMAGE ON SLIVER APP BAR)
  int _imageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Event> event = [
      Event('PNC Event', 'pnc.png', 'Coming Soon', imagePath, member,
          memberPath, robot, robotPath, 1),
      Event('Smart Event', 'smart.png', '19th Jul 2019', imagePath, member,
          memberPath, robot, robotPath, 2),
      Event('Stem Event', 'stem.png', '12th Feb 2019', imagePath, member,
          memberPath, robot, robotPath, 3),
    ];
    Event eventAcc = event[index];

    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              //SLIVER APP BAR
              SliverAppBar(
                iconTheme: IconThemeData(color: Hexcolor('172634')),
                expandedHeight: 400,
                floating: false,
                pinned: true,
                //APP BAR BACKGROUND
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                      'assets/home/${eventAcc.imagePath[_imageIndex]}',
                      fit: BoxFit.cover),
                ),
                //APP BAR
                title: Text(
                  eventAcc.eventName,
                  style: TextStyle(
                      color: Hexcolor('172634'),
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(
                      kToolbarHeight), //kToolbarHeight has same constant that AppBar uses.
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(18.0, 10.0, 0.0, 10.0),
                          child: Container(
                              height: 85,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  //EVENT IMAGE
                                  Image.asset(
                                      'assets/events/${eventAcc.eventPath}'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  //EVENT NAME AND TITLE
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            //EVENT NAME
                                            Text(
                                              eventAcc.eventName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18),
                                            ),
                                            //EVENT DATE
                                            Text(
                                              eventAcc.eventDate,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12),
                                            ),
                                            index == 1
                                                ? Text(
                                                    'Cancel due to Covid 19',
                                                    style: TextStyle(
                                                        color: Colors.redAccent,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12),
                                                  )
                                                : Text(''),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ]),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          //HIDE SCROLL END EFFECT
          body: ScrollConfiguration(
            behavior: ScrollBehavior()
              ..buildViewportChrome(context, null, AxisDirection.down),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //SECTION 1 - MEMORIES
                  Text(
                    '   ' + 'Memories',
                    style: TextStyle(
                        color: Hexcolor('172634'),
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: buildListView(0.55, 1, eventAcc),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 5, bottom: 5),
                    child: Text(paragraph1),
                  ),
                  SizedBox(
                    height: 8,
                  ),

                  //SECTION2 - PARTICIPATING MEMBERS
                  Text(
                    '   ' + 'Participating Members',
                    style: TextStyle(
                        color: Hexcolor('172634'),
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: buildListView(0.35, 2, eventAcc),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  //SECTION 3 - ROBOT USED
                  Text(
                    '   ' + 'Robots used at the Event',
                    style: TextStyle(
                        color: Hexcolor('172634'),
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    child: buildListView(0.35, 3, eventAcc),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 5, bottom: 5),
                    child: Text(paragraph2),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // AUTHOR
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Color.fromRGBO(22, 31, 40, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: '    '),
                          TextSpan(text: 'Written by '),
                          TextSpan(
                              text: 'Suy Kosal',
                              style: TextStyle(color: Hexcolor('03a0b0'))),
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  //IMAGE LIST WITH HORIZONTAL SCROLL
  ListView buildListView(double widthContainer, int section, Event eventAcc) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: section == 1
            ? eventAcc.imagePath.length
            : section == 2 ? eventAcc.member.length : eventAcc.robot.length,
        itemBuilder: (context, index) {
          //CLICK TO CHANGE IMAGE (SECTION 1 ONLY)
          return GestureDetector(
            onTap: () {
              if (section == 1)
                setState(() {
                  _imageIndex = index;
                });
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 8, 2, 8),
              child: Container(
                // IF == SECTION 1 => NO NAME ON IMAGE
                child: section != 1
                    ? Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          ' ' +
                              (section == 2
                                  ? eventAcc.member[index]
                                  : eventAcc.robot[index]) +
                              ' ',
                          style: TextStyle(
                              backgroundColor: Hexcolor('03a0b0'),
                              color: Colors.white),
                        ),
                      )
                    : null,
                width: MediaQuery.of(context).size.width * widthContainer,

                //BACKGROUND IMAGE WITH SHADOW
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                    ],
                    image: DecorationImage(
                        image: AssetImage(section == 1
                            ? 'assets/home/${imagePath[index]}'
                            : section == 2
                                ? 'assets/profiles/${eventAcc.memberPath[index]}'
                                : 'assets/home/${eventAcc.robotPath[index]}'),
                        fit: BoxFit.cover)),
              ),
            ),
          );
        });
  }
}
