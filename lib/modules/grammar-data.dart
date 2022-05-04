// ignore_for_file: file_names, unnecessary_new

class Grammar {
  int id;
  String title;
  String structure;
  String define;
  String examples;

  Grammar(
      {required this.id,
      required this.title,
      required this.structure,
      required this.define,
      required this.examples});

  factory Grammar.fromJson(Map<String, dynamic> res) {
    return new Grammar(
        id: res['id'],
        title: res['title'],
        structure: res['structure'],
        define: res['define'],
        examples: res['examples']);
  }

  static List<Grammar> init() {
    List<Grammar> grammardatadetails = [
      Grammar(
        id: 1,
        title: 'Simple Present Tense',
        define:
            'Indicates an action which happens in the present, but it isn’t necessary for actions to happen right now. Simple present tense indicates, unchanging situations, general truths, scientific facts, habits, fixed arrangements and frequently occuring events.',
        structure:
            "POSITIVE FORMS (+):\n\n  Subject ( I, You, We, They ) + V1  ( First Form of Verb )\n\n  Subject ( He, She, It ) + VERB – S / ES / IES\n\nNEGATIVE FORMS (-) :\n\n  Subject ( I, You, We, They ) + do not / don’t + V1  ( First Form of Verb )\n\n  Subject ( He, She, It ) + does not / doesn’t + V1  ( First Form of Verb )\n\nQUESTION FORMS (?):\n\n  YES / NO + Subject ( I, You, We, They )+ do / do not (don’t)\n\nYES / NO + Subject  ( He, She, It ) + does / does not (doesn’t)\n\n",
        examples: 'EXAMPLE\n\n'
            'My mother lets me go out with my friends.\n\nMy mother does not (doesn’t) let  me go out with my friends.\n\nDoes your mother let you go out with your friends?',
      ),
      Grammar(
        id: 2,
        title: 'Present Continuous Tense',
        define:
            'Indicate an action which is in progress at the time of speaking or at the present time.',
        structure:
            "POSITIVE FORM (+):\n\n  Subject + BE ( am / is / are ) + Verb-ING\n\nNEGATIVE FORM (-):\n\n  Subject + BE ( am / is / are ) + NOT + Verb-ING\n\nQUESTION FORM (?):\n\n  BE ( am / is / are ) + Subject + Verb-ING\n\nSHORT ANSWER FORM ( + / – ) :\n\n  YES / NO + Subject + BE / BE NOT \n\n",
        examples: 'EXAMPLE\n\n'
            'She is listening the music now.\n\nShe is not (isn’t) listening the music now.\n\nIs she listening the music now?',
      ),
      Grammar(
        id: 3,
        title: 'Present Perfect Tense',
        define:
            'Is used to express an event that started in the past and the impact of the event is now continuing (or a long-running event that started in the past and is still going on). This tense is used to express actions completed recent past. In this tense, it is important whether the event occured or not. ( or the result of the event is important, not the time of the event ).',
        structure:
            'POSITIVE FORMS (+):\n\n  Subject ( I, You, We, You, They ) + HAVE + V3/ed ( third form of main verb – past participle )\n\n  Subject ( I, You, We, You, They ) + HAVE + V3/ed ( third form of main verb – past participle )\n\nNEGATIVE FORMS (-):\n\n  Subject ( I, You, We, You, They ) + HAVE  + NOT + V3/ed ( third form of main verb – past participle )\n\n  Subject ( He, She, It ) + HAS + NOT + V3 ( third form of main verb – past participle )\n\nQUESTION FORMS (?):\n\n  HAVE  + Subject ( I, You, We, You, They ) + V3/ed ( third form of main verb – past participle\n\nSHORT ANSWER FORMS (?):\n\n  YES + Subject + have/has\n\n  NO + Subject + have/has NOT',
        examples: 'EXAMPLE\n\n'
            'I have already prepared breakfast.\n\n have not (haven’t) prepared breakfast yet.\n\nHave you prepared breakfast?',
      ),
      Grammar(
        id: 4,
        title: 'Present Perfect Continuous Tense',
        define:
            'Indicates that something started in the past and is continuing at the present time.',
        structure:
            'POSITIVE FORM (+):\n\n  Subject + HAVE/HAS + BEEN + Verb-ING\n\nNEGATIVE FORM (-):\n\n  Subject + HAVE/HAS + NOT + BEEN + Verb-ING\n\nQUESTION FORM (?):\n\n  HAVE/HAS + Subject + BEEN + Verb-ING',
        examples: 'EXAMPLE\n\n'
            'My father have been repairing the car. That‘s why his hands are greasy.\n\nMy father have not (haven’t) been repairing the car. That‘s why his hands are greasy.\n\nHave you been studying English?',
      ),
      Grammar(
        id: 5,
        title: 'Simple Past Tense',
        define:
            'Indicates an action which is completed at a definite time in the past.',
        structure:
            "POSITIVE FORM (+):\n\n  Subject + V2 ( Second Form of Verb )\n\nNEGATIVE FORM (-):\n\n  Subject + did not + V1  ( First Form of Verb )\n\nQUESTION FORM (?):\n\n  BE (was/were)/Did + Subject + V1",
        examples: 'EXAMPLE\n\n'
            'She is listening the music now.\n\nShe is not (isn’t) listening the music now.\n\nIs she listening the music now?',
      ),
      Grammar(
          id: 6,
          title: 'Past Continuous Tense',
          define:
              'Indicates an action which started in the past and continued in a certain time period. The point to be taken into consideration is that the action started in the past and the continuity of the action was also in the past, so it does not continue at this moment.',
          structure:
              'POSITIVE FORM (+):\n\n  Subject + BE ( was / were ) + Verb-ING\n\nNEGATIVE FORM (-):\n\n  Subject + BE ( was / were ) + NOT + Verb-ING\n\nQUESTION FORM (?):\n\n  BE ( was / were ) + Subject + Verb-ING\n\nSHORT ANSWER FORM ( + / – ) :\n\n  YES / NO + Subject + BE (was/were) / BE(was/were) NOT',
          examples: 'EXAMPLE\n\n'
              'You were watching television last night.\n\nYou were not (weren’t) watching television last night.\n\nWere you watching television last night?'),
      Grammar(
          id: 7,
          title: 'Past Perfect Tense',
          define:
              'The Past Perfect tense expresses something that happened before another action in the past. This is the past in the past.  We form the past perfect by using ‘had’ and the past participle of the verb.',
          structure:
              'POSITIVE FORM (+):\n\n  Subject + HAD + V3\n\nNEGATIVE FORM (-):\n\n  Subject + HADN'
              'T (HAD NOT) + V3\n\nQUESTION FORM (?):\n\n  HAD + Subject + V3/ed\n\nSHORT WH QUESTION (?):\n\n  WH question + HAD + S + V3/ed?',
          examples: 'EXAMPLE\n\n'
              'She had met him before the party.\n\nI had not called the police before I investigated the noise in the garden.\n\nHad the weather been nice in previous years?\n\nWhy had the bus stopped in the previous city?'),
      Grammar(
          id: 8,
          title: 'Past Perfect Continuous Tense',
          define:
              'The past perfect continuous is used to describe an action that started before another action in the past.',
          structure:
              'POSITIVE FORM (+):\n\n  Subject + HAD BEEN + Verb-ING\n\nNEGATIVE FORM (-):\n\n  Subject + HADN'
              'T (HAD NOT) BEEN + Verb-ING\n\nQUESTION FORM (?):\n\n  HAD + Subject +  BE + Verb-ING\n\nSHORT WH QUESTION (?):\n\n  WH question + HAD + S + BEEN + Verb-ING?',
          examples: 'EXAMPLE\n\n'
              'Michael had been teaching at the university for more than 2 year before he left for\n\nMy husband had not been doing anything when I came home.\n\nHad he been waiting for me when you met him?\n\nHow long had you been waiting to get on the bus?'),
      Grammar(
          id: 9,
          title: 'Simple Future Tense',
          define:
              'Simple future is used to talk about an is used to description of the action, the work will take out in the future, or the action, the action is after say.',
          structure:
              'POSITIVE FORMS (+):\n\n  Subject + WILL + V1  ( First Form of Verb )\n\nNEGATIVE FORMS (-) :\n\n  Subject ( I, You, We, They, He, She, It ) + won\'t + V1  ( First Form of Verb )\n\nQUESTION FORMS (?):\n\n  WILL/SHALL + Subject +  V1  ( First Form of Verb )',
          examples: 'EXAMPLE\n\n'
              'I will help mom cooking tomorrow morning.\n\nI won’t tell her my secret.\n\nWill you come here tomorrow morning?'),
      Grammar(
          id: 10,
          title: 'Future Perfect Tense',
          define:
              'The Future Perfect is used to describe an action that will be completed by a specified time in the future.',
          structure:
              'POSITIVE FORMS (+):\n\n  Subject + WILL HAVE + V3/ed\n\nNEGATIVE FORMS (-) :\n\n  Subject + WILL NOT HAVE + V3/ed\n\nQUESTION FORMS (?):\n\n  WILL + Subject + BE + V3/ed\n\nSHORT WH QUESTION (?):\n\n  WH question + WILL + S + HAVE + V3/ed?',
          examples: 'EXAMPLE\n\n'
              'I will have finished my exam by the end of this weekend.\n\nI won’t have finished my work by the end of tomorrow morning.\n\nWill your parents have come back England before the summer vacation?\n\nWhat time will he have finished his work?'),
      Grammar(
          id: 11,
          title: 'Future Continuous Tense',
          define:
              'The action is not complete when another action happens in the future. This is similar to past continuous, but it refers to the future.',
          structure:
              'POSITIVE FORMS (+):\n\n  Subject + WILL BE + Verb_ING\n\nNEGATIVE FORMS (-) :\n\n  Subject + WILL NOT BE + Verb_ING\n\nQUESTION FORMS (?):\n\n  WILL + Subject + BE + Verb_ING\n\nSHORT WH QUESTION (?):\n\n  WH question + WILL + S + BE + Verb_ING?',
          examples: 'EXAMPLE\n\n'
              'I will be playing volleyball at 6pm tomorrow.\n\nI will not be sleeping when you telephone me.\n\nWill you be waiting for the bus at 8 a.m next Tuesday?\n\nWhen will Moana be coming back from Singapore?'),
      Grammar(
          id: 12,
          title: 'Future Perfect Continuous Tense',
          define:
              'The action is not complete when another action happens in the future. This is similar to past continuous, but it refers to the future.',
          structure:
              'POSITIVE FORMS (+):\n\n  Subject + WILL HAVE BEEN + Verb_ING\n\nNEGATIVE FORMS (-) :\n\n  Subject + WILL NOT HAVE BEEN + Verb_ING\n\nQUESTION FORMS (?):\n\n  WILL + Subject + HAVE BEEN + Verb_ING\n\nSHORT WH QUESTION (?):\n\n  WH question + WILL + S + HAVE BEEN + Verb_ING?',
          examples: 'EXAMPLE\n\n'
              'By the end of this year, I will have been playing chess for 2 years.\n\nI won’t have been playing sports for 4 months until the end of this year.\n\nWill she have been studying for 5 years by the end of next year?\n\nHow long will you have been playing chess by the end of the year?'),
    ];
    return grammardatadetails;
  }
}
