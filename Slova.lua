-- Word Bot GUI | Arceus X | авто-составление слова на букву сверху
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")
local VIM
pcall(function() VIM = game:GetService("VirtualInputManager") end)
local lp = Players.LocalPlayer

---------------------------------------------------------------- СЛОВАРИ
local RU = {}
local EN = {}
local BIG = {} -- большой словарь, индекс по первой букве (грузится из интернета)
for w in ([[абрикос август автобус автомат аквариум акварель акробат акула акция алмаз алфавит альбом аллея аллигатор альпинист амбар ананас ангел анекдот антенна апельсин аппарат аппетит апрель аптека арбуз арена армия аромат артист архив аспирин астра атака атлас атмосфера аудитория аукцион афиша аэропорт аист азбука агент агроном адрес аккорд актер арка арфа авария авторучка бабочка бабушка багаж базар байдарка балкон банан банка барабан барсук баскетбол батарея башня бегемот белка берег береза библиотека билет блин блокнот бобер богатырь болото борода ботинок бочка брат бревно бригада брюки бублик будильник бумага бутылка буфет бык бассейн бензин берлога бинокль бисер битва близнец блюдо боксер бомба борщ бритва броня булавка булка бульдог бусы бухта бюро багет бадминтон бак балет баллон бант банкет баран бархат башмак бегун бидон бизнес бинт бирюза бланк блеск блоха бокал болт бровь бросок буква букет булочка буря бутерброд бабка бег бетон бокс вагон валенки ванна варенье вафля ведро велосипед веник вентилятор верблюд весна ветер ветка вечер вешалка взрыв вилка вишня вода водопад водитель волк волна ворона ворота воробей вокзал воздух возраст война волейбол волосы воротник врач время вулкан вход выставка выбор высота вьюга вагончик вакцина валет вальс ванная вата ведомость век венок вера вершина весы ветеран ветчина видео вилла виноград вирус витамин витрина вкус внучка вопрос ворон вор восток вторник вчера выпечка вымя гараж гвоздь гвоздика гитара глаз глобус гнездо говядина голова голубь гора город горох гость град граница грач гроза гром груша грузовик гриб группа грядка гусь гусеница гвардия газета газон галстук гамак гармонь гепард герань гибрид гимн гипс гирлянда глина глоток гном голос голод гонка горло горизонт горшок гражданин грамота гранат граф график грелка гренки грим гроб гроздь гул гуляш гусар гусли гидрант дача двор девочка дедушка дерево дождь дом дорога доска дракон дрова друг дуб дудка дым дыня дятел дельфин день диван дизайн диктор диплом директор диск дневник доктор долина дочь древо дружба дуга душ дыра дверь деньги детство декабрь делегат десерт детектив джинсы диета динозавр дисплей дичь добыча довод договор доклад долг домино дорожка драма дрель дрозд дубина дуэль духи дворец дворник дрожжи дробь дуршлаг ель ежевика елка единица емкость енот еда ерш единорог епископ жаба жара жасмин жгут железо жемчуг жена жених жертва жилет жираф жизнь жук журавль журнал жабо жаворонок жало жандарм жар жвачка желание желток желудь жетон живот животное жилище житель жокей жребий жюри забор завод загадка закат закон залив замок занавес заря заяц звезда зебра зверь здание земля зеркало зима змея знамя зоопарк зонт зуб зубр зрение зал заварка зависть загар задача зайчик закуска залог замена зарплата заросли заставка затылок звон звук здоровье зелень зерно зефир зигзаг злак злодей знание золото зоолог зрелище зубило игла игра игрок игрушка идея извилина изгородь издание излом изумруд изба известь изюм икона иллюзия иней инжир институт инструмент интерес интернет искра истина история итог индюк индеец иголка ива игуана имя имбирь император ирис искусство ипподром инспектор интрига инфаркт кабина кабинет каблук казак кактус калитка калькулятор камера камень камин канава канал канат кандидат каникулы капитан капуста карандаш карман карниз карта картина картошка касса каска кастрюля катер каток кафе качели каша кашель квартира кекс кепка кефир кибитка кино киоск кирпич кислота кисть кит кладовка клавиша класс клевер клетка клещ климат клоун ключ книга ковер ковш кожа коза колбаса колесо колокол колонна кольцо команда комар комната компас компот конверт конфета конь копейка корабль корень коридор корка корм корова корона корыто космос костер кость костюм кот котлета кофе кофта кошка краб краска кран красота кресло крест крик кролик кровать кровь крокодил кросс круг кружка крыло крыльцо крыса крыша кубик кувшин кузнец кукла кукуруза кулак культура купол курица курорт курс куртка кусок куст кухня лавка лагерь ладонь лазер лайка лампа лапа ласка лебедь левша лев легенда лезвие лейка лента лес лестница лето летчик лиса лист литр лифт лицо лодка ложка локоть лук луна лужа лупа лягушка лыжи любовь люстра лампочка лавина лак ласточка латунь лень лидер лиман лимон липа линия линейка лира лоб ловушка логика лодырь лоза ломоть лопата лось лотос лошадь лыко лысина лыжник любитель магазин магнит мазь майка макароны макет малина мальчик мама манеж манго маска масло масса мастер математика матрас матрос мать машина медведь медуза мел мельница меню мера металл метель метро механик мечта мешок милиция миндаль минута мир миска мишка мнение мода модель молния молоко молоток момент монета монитор море мороз мост мотор мотыга мох мошка мрамор муравей муха музей музыка мусор мышь мыло мысль мясо мяч мякиш мазут макушка маляр мандарин маникюр марка март марш маршрут мастерская мебель мед медаль мелодия метла мозг мозаика мопс мостик мотоцикл мудрец мука мундир мурашка мускул мухомор мыс набор наволочка надежда нарцисс народ насекомое насос настроение наука находка небо небоскреб недра неделя нерв несчастье нефть нива нитка ниша новость нога ножницы нож номер нора норка нос носок ночь нота ноябрь нрав нужда нырок няня нагрузка накидка налог наряд нашествие нектар немец ненастье нить низина никель носорог ноутбук нотариус нуль обезьяна обед облако обои оболочка образ обувь овес овощ овраг овца огонь огород огурец одежда одеяло озеро океан окно окунь олень олива олимпиада омар опера опора опушка орган орден орех орел оса осень осел осина основа остров осьминог отдых ответ отец отпуск отряд офис охота очки очередь ошибка оазис обруч обрыв овал окраина окружность оладья омлет оркестр осадки осколок осока остаток отвертка отель отзыв отметка отпечаток оттенок охрана ощущение павлин падеж палатка палец палитра палка пальма пальто память панда папа папка парад парашют парк парта партия паспорт пастух пауза паук пашня певец пекарь пение пенал пень перец перо перчатка песня песок петух печать печка пила пингвин пион пират письмо плакат пламя планета пластилин платок платье плед плита плот площадь плуг плавание плечо пловец плод побег победа повар поводок погода погреб подарок подкова подушка подъезд пожар пожарный поза позвонок поздравление поле полено полка полотенце полюс помидор помощь понедельник пони пончик порог порода порт портрет посуда почта пояс правда праздник пресс принц природа приз пробка проволока проспект простыня пруд птица пуговица пудель пузырь пульт пума пурга пустыня путь пушка пчела пшеница пылесос пыль пятно пятница пятка пятачок пирамида пирог пирожок писатель пистолет питон пицца работа радио радуга ракета ракушка рама рамка рана ранец раскраска расческа расписание рассвет растение рация редис редька режим резинка река рельс ремень ремонт репа репка ресница ресторан рецепт решето рисунок рис ритм рогатка род рожь розетка роза роса рост рот рояль рубашка рубль ручей ручка рыба рыбак рывок рынок рысь рюкзак рюмка рябина радость радиатор ранчо рапира раскопки рейс репейник ржавчина ринг робот родник рожок ромашка ромб ряд сад сайт салат салфетка салют самовар самокат самолет сани сапог сарай сахар свекла свеча свинья свисток свитер свобода сделка север секрет секунда семья семя сено сентябрь сердце серп сестра сетка сеть сила символ синица сирень сирота сироп система ситец сито скала скамейка скатерть сквер скворец скейт склад скорость скрипка скульптор слива слово слон слуга случай смех смородина снег снеговик снегирь сова собака собор событие совок согласие сок солдат соль солнце соловей сон сопка сорока сосна сосулька сосед сочинение спальня спектакль спина список спорт спрут сталь стакан станция старик старт статуя стая стена степь стих стол столб стоп стопа стоянка страна страус стрела стрекоза строка стул ступенька стыд суббота судья суп суша сухарь сфера схема сцена счет сын сыр сыщик сюжет сюрприз таблетка таблица табурет тайна такси талант тарелка таракан тачка театр тезка текст телега телевизор телефон тело тембр тень теннис тент терем термометр терраса терпение тесто тетрадь тетя тигр тина тир титул ткань тоннель топор топь торт тоска тополь трава трактор трамвай транспорт трап трасса треугольник трибуна тренер трикотаж тропа тротуар труба труд трусы тряпка туман тумба тундра туннель тупик турист туфля тыква тысяча тюлень тюльпан тюрьма тяжесть таз танец танк тапок тахта телескоп тема тетерев тираж титан товар толпа томат тон топка тормоз тост точка трек трель тренога трон трость трюк туз тушь тюк уборка уважение угол уголь угорь удар удача удилище удочка узел узор уклон уксус улей улитка улица улыбка ум умывальник универмаг университет упряжка урожай урок урна услуга успех устрица утес утка утро уха ухо участок учебник ученик учитель ущелье уют уж ужин узник указка укроп утюг уточка уезд фабрика фаза факел факт фамилия фанера фара фартук фасоль фасад февраль фейерверк фен ферма фиалка фигура фильм финиш фирма фишка флаг флакон флейта флот флюгер фонарь фонд фонтан форма формула форточка фото фрак фрукт фундамент фут футбол фуфайка фазан фея фикус филин фитиль флора фланель фортуна фреска фронт фураж фужер хаос хата хвост хвоя хлеб хлопок хлопушка хмель хобби хобот ходьба хозяин хоккей холм холод холодильник хомяк хор хорек хоровод хохот храм хризантема хрусталь хрящ художник хулиган хутор хакер хамелеон хандра характер хижина химия хирург хитрость хлев хлопья хна хозяйство хроника хрущ хурма царь цвет цветок цветы цель цемент цена центр цепь церковь цех цирк циркуль цитата цифра цыпленок цапля цикл цилиндр цоколь цунами цыган цитрус цесарка цедра цикада цитадель цинк чай чайка чайник чаща чашка человек чемодан червь черепаха черепица чернила чернослив черта чеснок честь четверг чехол чешуя чиж число чудо чулок чума чувство чугун чушь чан часы часть чаепитие чебурек чек червяк черешня черника чертеж чижик чистота чтение чудак чучело шаблон шаг шайба шалаш шампунь шанс шапка шарф шар шахта шахматы шашки шея шезлонг шелк шелест шило шина шинель шип шиповник широта шкаф школа шкура шлем шлюпка шмель шнур шоколад шоссе шофер шпага шпинат шпион шприц шрам шрифт штаны штора штраф штурман шуба шум шуруп шут шутка шайка шалун шарик шахтер шашлык шербет шестерня шиншилла ширма шишка шкатулка шлагбаум шлейф шнурок шорох шоу штанга штепсель шторм штык шулер щавель щегол щека щель щенок щетка щипцы щит щука щупальце щебень щебет щелчок щепка щиколотка щи эхо эпоха экран экскаватор экзамен эскимо эстрада этаж этикетка эфир эскалатор эмблема энергия эпизод эра эскиз эталон этюд эксперт экспонат электрик электричество эльф эмаль эмоция энциклопедия эполет эскорт юбка юбилей юг юла юмор юноша юрист юнга юрта юннат яблоко яблоня явление ягода ягуар язык яичница яйцо якорь янтарь январь ярлык ярмарка ярус ясень ястреб ящерица ящик яма яхта яд ясли ядро ячмень]]):gmatch("%S+") do RU[#RU+1] = w end
for w in ([[apple animal arrow ant banana bridge bottle butter bat box castle cloud candle camera cat dragon dolphin donkey dog eagle earth engine egg forest flower finger fox garden guitar ground gum horse house hammer hat island insect ink jacket jungle jelly jam kitchen kitten kettle key lemon ladder lizard log monkey mountain mirror map needle nature number net orange ocean office owl planet pencil pillow pen queen quiet quilt rabbit river rocket rat spider summer silver sun table tiger turtle toy umbrella unicorn useful valley violin vanilla van window winter wizard web yellow yogurt yacht zebra zipper zodiac zoo]]):gmatch("%S+") do EN[#EN+1] = w end

-- дополнительные слова (дубликаты отфильтровываются)
local function addWords(dst, str)
	local seen = {}
	for _, w in ipairs(dst) do seen[w] = true end
	for w in str:gmatch("%S+") do
		if not seen[w] then seen[w] = true dst[#dst + 1] = w end
	end
end
addWords(RU, [[абзац абонемент абсурд авангард авеню авокадо агитатор агрегат адмирал азарт академия акцент аллергия алтарь алюминий амулет анкета анонс ансамбль антилопа апостол аргумент аристократ арматура артерия архитектор асфальт атом аура афоризм аэродром акт ад бабуин багор бадья баклажан бактерия баламут балерина баллада бамбук бандаж бандит барабанщик баржа барка барометр барс бастион батон батут бахрома бездна бейсбол белок беседка бизон билборд биолог биржа бисквит бита бифштекс благо блесна блокада блондин бобр бодрость божество болельщик бордюр боцман бредень брелок бриллиант брошюра брусника бугор буйвол бульвар бульон бумеранг бункер бусина бюджет бюст бой бок бум вазон валун валюта ванилин варежка василек вахта вдова вектор вексель велосипедист венец вертолет вес веранда верстак вертикаль веха вече взгляд видеокамера винт виолончель вишенка вклад вкладыш владелец влага вмятина внимание водоем водоросль водопровод возница волдырь волокно волшебник вопль воскресенье воспитатель вредитель вселенная вывеска выдра выпуск выстрел вытяжка вьюн вал вид гавань гайка галактика галерея галка галоши гантель гарнир гарпун гастроном гвардеец гектар геолог география геометрия герб герой гибель гильза гиппопотам гитарист глагол гладиолус глубина глухарь гоблин годовщина голубика гондола гонец гончар горбуша горка горожанин горчица готовность гравий гранит грязь губка гудок гуашь гол гид год газ давление дальность дамба даль дар двигатель двоечник дворняга дебют девиз дежурный декорация демон департамент деталь детеныш дефис джунгли дипломат дирижер дисциплина дичок добродетель дождевик долото доллар домовой донос дополнение дорожник досуг доцент дрессировщик дробилка дротик дубрава дудочка дымка дымоход дюна дно дар евангелие европеец егерь ежик ежедневник елочка епитафия ермолка жалюзи жаркое жатва желудок желе жердь жестянка живопись жилка жимолость жмых жонглер жрец журналист жир забава заблуждение завтрак загон задира зажигалка заимка заказ заклинание заколка залежь заметка занятие запад запас запись заповедник запонка зарница застава затвор захват зачет защитник звание звездочет зверинец здравица зевака зелье земляника зенит зеркальце злоба змей знаток значок зов зодчий зонтик зрачок зябь зло игрушечка идол избиратель извозчик излучина изоляция изречение имущество инвентарь индекс инженер инициатива инстинкт инструктор интеграл интервью инфекция ипотека ирония исток итальянец иск кабан кабель кавалер казино кайма какао календарь калина калач камыш камбала камертон камзол канарейка канистра кантата капля капот капкан карась каратэ карамель каркас карнавал карусель касатка кассета каталог катапульта кафтан качество кашне квадрат квас кегля кедр кельма кенгуру кефаль кивок кинжал кладбище клапан кларнет клен клещи клинок клубника клык кнопка кобра ковчег козел койка кокос колба колдун коллега колпак колхоз колючка комбайн комедия комиссия комод компьютер конкурс консерва конспект контейнер контур конус копилка корзина коромысло корпус корректор косарь косметика косынка кочан кошелек кошмар краюха кредит кремль кристалл кружок крупа ксилофон кубок кузов кулон купе куранты курьер кусачки кухарка лабиринт лаборатория лавр лазурь лайнер лакей ландыш ласт лебеда левкой легион лезгинка лекарство лекция лемур леопард лепесток лесник летопись лиана либерал лига лимузин литература лихорадка личинка ложа лоток лошак луговина лукошко лучник лыжня магистраль магия мазурка майор макрель маковка малыш мамонт манера манжета мантия маракуя маргарин маринад маркер массаж мастерок матч махорка мачта медник медальон мезонин мелочь мельник менеджер метеор метка мех мешковина микроб микрофон миллион мина миниатюра министр миссия митинг мишень мозоль молодец молот монастырь монах монолог монтер мораль мордочка морковь морж мотив мотылек мошенник мундштук мурлыка мушка мякоть набат набережная навык нагайка надпись наказание накладная наковальня налим намек напиток наперсток направление наследник насмешка настойка наушники нашивка недоросль неон непогода нервы несессер нищий новичок новелла ножка номинал норматив носилки нотация нутро нянька обвал обзор облава облик обман обмен оборона обочина образец обряд обыск овация овин овсянка огниво огонек ограда огрех одуванчик ожерелье ожог озарение оклад окорок окошко октава окрик омут онуча опека описание оплот опыт орбита орда ореол орнамент ортопед осада осетр осмотр остряк отвар отвага отголосок отдел откос отсек оттепель отчизна офицер охапка охотник оценка очаг очерк павильон падуб пакет палач палисадник палуба панель пантера папоротник парник паром парус паста пастила пастбище патефон патока патруль паутина пахарь пейзаж пекло пелена пеликан пемза пенсия пепел перевал перегной перекресток перила перрон персик перстень песочница петля пехота печенье пещера пиджак пиксель пикник пилот пинцет пионер пирс питомец плаха плащ племя плетень плинтус плотина плотник плюш пляж погон подвал подмастерье подоконник подпись подсолнух поезд пожелание позор покос покров полынь полярник помело помпа понтон попугай поросенок портниха портфель поручень посох поток потолок похлебка почерк правило прадед прапорщик прачка прибор привал пригорок привидение приказ прилавок принтер приправа причал пробирка проводник прогноз прогулка пролив промысел пропуск прорубь простор пророк протез профиль прохожий прудик прут прялка психолог пряник птенец публика пудра пулемет пункт пустошь путник пушинка пыж пьеса пятерка рабочий равнина радиус разведчик разлом размер разряд ракитник раковина рапорт рассказ рассол расчет ревень регата редактор резерв результат рейка рента репортер рессора реставрация ретушь ржанка рифма робость ровесник родня розга ромбик ропот роща рубеж рубин рубрика ругань рудник рукав рукоять румяна рупор русалка рухлядь ручеек рыцарь рычаг рюмочка рябчик сабля саженец сазан саквояж салон самец самородок самопал санки сантиметр сарафан сатин сафари сбор свадьба сват сверчок свиток свирель сдача сейф секира секстант семафор семинар сенокос сервант сервиз серебро сержант сигара сигнал силуэт синагога синоним сирена ситуация скарб скат скипетр склон скоба скобка скот скребок скрепка скрижаль слалом слепок слог сметана снайпер снимок собеседник создатель сокол солист солома сольфеджио сонет сопло сосуд сотня спасатель спектр сплав сплетня спираль спичка спринт сруб ссылка ставка стаж стадион стамеска станок старожил статья ствол стебель стезя стелла стенд степень стерх стожок страж стремя строитель студент стужа ступа ступня стяг субботник судак судно сумка сумрак сундук сухогруз счастье сцепка сыпь сырник сытость табак таверна таймер такт талисман тамбур танкер тапочки тара тариф тачанка твердыня тельняшка тенор теорема терние тесак тетива техник тигренок тимьян тлен товарищ тога толчок томик торг торпеда тотем точило травинка траншея трапеза трафарет требник трещина тромбон трудяга трюм тряпица туалет тугрик тулуп тура турнир тушенка тюфяк тяга убор убыток увал уголок удав удивление удовольствие ужас уклад укол укрытие улов умелец унитаз упор упряжь ураган урядник усадьба усик усилитель условие усмешка уступ усы утеха утесник утопия утварь ухват ухажер учение фаготист фазенда файл фаланга фальшь фанфара фасон фельдшер феномен ферзь фестиваль фетр фигурка физик фикция филармония философ фильтр финал финка фитнес флажок фланг фляга фойе фокус фольга фонарик фонетика форель формат фортепиано фракция франт фреза фронтон фугас фуражка фургон хайку халат халва хватка хлам хлебница ходули хозяйка холдинг холка хомут хорал хоспис хрип хруст хрюшка хулиганство цапфа царапина цветник цветочек цедилка цейхгауз целина цеппелин церемония цистерна цитрон цукат цыплята чабан чаевые чайхана чалма чародей часовня часовщик чаша чекан чело чемпион чердак чернозем черпак чертополох чесотка четверть чибис чиновник чипсы чирей читатель чреда чубук чудовище чутье шабаш шавка шагомер шакал шалость шаль шаман шапито шарада шарлатан шасси шатер шахматист швабра швея шедевр шейка шелуха шепот шеренга шериф шерсть шест шестеренка шиворот шинок шиповка ширина шифер шишак шкала шкипер шланг шлейка шлюз шляпа шницель шоколадка шпагат шпала шпиль шпора шторка штукатур шумок щебенка щелок щепоть щеточка щипок щиток щуп эвакуатор эгоизм эгида экватор экипаж экология экономика экспедиция экстракт эластик электрон элемент элита эмигрант эмир эпиграф эпилог эпитет эссе эстакада этикет эфес юнкер юрок юфть ябеда яблонька явь ягель ягодка язва языкознание яичко ямщик ярлычок ярость ясность яхонт ячейка]])
addWords(EN, [[able acid actor adult agent alarm album alley angel anchor april arena attic autumn avenue award baby back bacon badge bagel baker ball band bank barn basket beach bean bear beard bed bee beetle bell belt bench berry bicycle bird biscuit blanket blossom boat bone book boot bowl boy brain branch bread brick broom brush bucket bus button cabin cable cake camel candy canoe cap captain car card carpet carrot cave chain chair chalk cheese cherry chicken chimney circle clock coat coffee coin comb compass cookie copper corn cotton cow crab crayon crown cup curtain daisy dance desert desk diamond dinner doctor doll door dream dress drum duck dust ear east eggplant elbow elephant engine eraser eye fairy farm feather fence fern field fire fish flag flame floor fog fork frog fruit galaxy garlic gate ghost giant gift giraffe glass glove goat gold grape grass hair hand harbor hat hawk heart helmet hill honey hook hotel hour ice igloo iron ivory jar jewel jacket judge juice kangaroo kite knife knight knot lake lamp leaf leg lion lock lunch magnet market mask meadow melon milk moon mouse mud muffin nail nest night nose nut oak oar olive onion opera otter oven paint palace panda paper parrot peach pear pearl penguin piano pie pilot pizza plate pocket pond potato pumpkin puppy rain rainbow ring road robot roof rope rose sailor salad salt sand school scissors seal shadow sheep shell ship shoe shop sky snake snow soap sock spoon square star stone storm street sugar sword tent thread tomato tooth tower train tree truck tulip uncle universe vase village voice wagon wall watch water whale wheel whistle wind wolf wood worm yard zero zone]])


---------------------------------------------------------------- УТИЛИТЫ
local function lower(s)
	local out = {}
	for _, c in utf8.codes(s) do
		if c >= 0x410 and c <= 0x42F then c = c + 32
		elseif c == 0x401 then c = 0x451
		elseif c >= 65 and c <= 90 then c = c + 32 end
		out[#out + 1] = utf8.char(c)
	end
	return table.concat(out)
end
local function chars(s)
	local t = {}
	for _, c in utf8.codes(s) do t[#t + 1] = utf8.char(c) end
	return t
end
local function isLetter(s)
	if utf8.len(s) ~= 1 then return false end
	local c = utf8.codepoint(s)
	return (c >= 65 and c <= 90) or (c >= 97 and c <= 122) or (c >= 0x410 and c <= 0x44F) or c == 0x401 or c == 0x451
end
local function isCyr(ch) return utf8.codepoint(ch) >= 0x400 end
local function clean(s) local r = s:gsub("%s", "") return lower(r) end

---------------------------------------------------------------- GUI
local old
for _, p in ipairs({ pcall(function() return gethui() end) and gethui() or nil, game:GetService("CoreGui"), lp:FindFirstChild("PlayerGui") }) do
	if p then old = p:FindFirstChild("WordBotGui") if old then old:Destroy() end end
end

local gui = Instance.new("ScreenGui")
gui.Name = "WordBotGui"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local okp = pcall(function() gui.Parent = (gethui and gethui()) or game:GetService("CoreGui") end)
if not okp or not gui.Parent then gui.Parent = lp:WaitForChild("PlayerGui") end

local BG, PANEL, ACCENT, OFF = Color3.fromRGB(20, 18, 32), Color3.fromRGB(34, 30, 54), Color3.fromRGB(138, 92, 255), Color3.fromRGB(60, 56, 84)

local function corner(o, r) local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, r or 10) c.Parent = o end
local function stroke(o, col, th) local s = Instance.new("UIStroke") s.Color = col or ACCENT s.Thickness = th or 1.5 s.Transparency = 0.3 s.Parent = o end

local function drag(handle, frame, onTap)
	local dragging, start, startPos = false, nil, nil
	handle.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging, start, startPos = true, i.Position, frame.Position
			i.Changed:Connect(function()
				if i.UserInputState == Enum.UserInputState.End then
					dragging = false
					if onTap and (i.Position - start).Magnitude < 8 then onTap() end
				end
			end)
		end
	end)
	UIS.InputChanged:Connect(function(i)
		if dragging and (i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseMovement) then
			local d = i.Position - start
			frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
		end
	end)
end

-- кнопка открытия/закрытия
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.fromOffset(52, 52)
toggleBtn.Position = UDim2.new(0, 14, 0.5, -26)
toggleBtn.BackgroundColor3 = ACCENT
toggleBtn.Text = "Aa"
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 22
toggleBtn.AutoButtonColor = false
toggleBtn.ZIndex = 10
toggleBtn.Parent = gui
corner(toggleBtn, 26)
stroke(toggleBtn, Color3.new(1, 1, 1), 2)

-- главное окно
local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(310, 420)
main.Position = UDim2.new(0.5, -155, 0.5, -210)
main.BackgroundColor3 = BG
main.ClipsDescendants = true
main.Parent = gui
corner(main, 16)
stroke(main, ACCENT, 2)
local grad = Instance.new("UIGradient")
grad.Color = ColorSequence.new(Color3.fromRGB(30, 24, 52), Color3.fromRGB(14, 12, 24))
grad.Rotation = 90
grad.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 42)
title.BackgroundColor3 = PANEL
title.Text = "  ✦ Word Bot"
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.Parent = main
corner(title, 16)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -20, 0, 34)
status.Position = UDim2.new(0, 10, 0, 48)
status.BackgroundColor3 = PANEL
status.Text = "Готов"
status.TextColor3 = Color3.fromRGB(200, 190, 255)
status.Font = Enum.Font.GothamMedium
status.TextSize = 14
status.TextWrapped = true
status.Parent = main
corner(status, 8)
local function setStatus(t) status.Text = t end

local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1, -20, 1, -94)
list.Position = UDim2.new(0, 10, 0, 88)
list.BackgroundTransparency = 1
list.BorderSizePixel = 0
list.ScrollBarThickness = 4
list.ScrollBarImageColor3 = ACCENT
list.AutomaticCanvasSize = Enum.AutomaticSize.Y
list.CanvasSize = UDim2.new()
list.Parent = main
local lay = Instance.new("UIListLayout")
lay.Padding = UDim.new(0, 8)
lay.SortOrder = Enum.SortOrder.LayoutOrder
lay.Parent = list

local function mkBtn(text, color)
	local b = Instance.new("TextButton")
	b.Size = UDim2.new(1, -6, 0, 42)
	b.BackgroundColor3 = color or PANEL
	b.Text = text
	b.TextColor3 = Color3.new(1, 1, 1)
	b.Font = Enum.Font.GothamBold
	b.TextSize = 15
	b.AutoButtonColor = true
	b.Parent = list
	corner(b, 10)
	return b
end
local function mkBox(placeholder)
	local t = Instance.new("TextBox")
	t.Size = UDim2.new(1, -6, 0, 38)
	t.BackgroundColor3 = PANEL
	t.PlaceholderText = placeholder
	t.PlaceholderColor3 = Color3.fromRGB(140, 130, 180)
	t.Text = ""
	t.TextColor3 = Color3.new(1, 1, 1)
	t.Font = Enum.Font.Gotham
	t.TextSize = 14
	t.ClearTextOnFocus = false
	t.Parent = list
	corner(t, 10)
	return t
end

---------------------------------------------------------------- НАСТРОЙКИ
local opt = {
	auto = false,
	clickFirst = false,
	pool = false,
	submit = true,
	verify = true,
	method = "auto",
	delay = 0.03,
}
local manualBox
local used = {}
local busy = false
local lastTop, lastPlay = nil, 0

---------------------------------------------------------------- ПОИСК ЭЛЕМЕНТОВ
local function visible(o)
	local x = o
	while x and x ~= game do
		if x:IsA("GuiObject") and not x.Visible then return false end
		if x:IsA("ScreenGui") and not x.Enabled then return false end
		x = x.Parent
	end
	return true
end

local function textOf(o)
	if (o:IsA("TextButton") or o:IsA("TextLabel")) and o.Text ~= "" then return o.Text end
	for _, d in ipairs(o:GetDescendants()) do
		if (d:IsA("TextLabel") or d:IsA("TextButton")) and d.Text ~= "" then return d.Text end
	end
	return nil
end

-- буква сверху (и сам объект, чтобы не принять его за клавишу)
local function scanTop()
	local pg = lp:FindFirstChild("PlayerGui")
	if not pg then return nil end
	local best, bestY, bestObj
	for _, d in ipairs(pg:GetDescendants()) do
		if d:IsA("TextLabel") and not d:IsDescendantOf(gui) and not d.Parent:IsA("GuiButton") and visible(d) then
			local t = clean(d.Text)
			if isLetter(t) and (not bestY or d.AbsolutePosition.Y < bestY) then
				best, bestY, bestObj = t, d.AbsolutePosition.Y, d
			end
		end
	end
	return best, bestObj
end

local function scanLetters()
	local avail = {}
	local pg = lp:FindFirstChild("PlayerGui")
	if not pg then return avail end
	for _, d in ipairs(pg:GetDescendants()) do
		if d:IsA("GuiButton") and not d:IsDescendantOf(gui) and visible(d) then
			local t = textOf(d)
			if t then
				t = clean(t)
				if isLetter(t) then
					avail[t] = avail[t] or {}
					table.insert(avail[t], d)
				end
			end
		end
	end
	-- запасной вариант: клавиши без кнопок (просто надписи) — нажмём тапом по экрану
	local cnt = 0
	for _ in pairs(avail) do cnt += 1 end
	if cnt < 8 then
		local _, topObj = scanTop()
		for _, d in ipairs(pg:GetDescendants()) do
			if d:IsA("TextLabel") and d ~= topObj and not d:IsDescendantOf(gui) and visible(d) then
				local t = clean(d.Text)
				if isLetter(t) and not avail[t] then
					avail[t] = { d }
				end
			end
		end
	end
	return avail
end

local function getTop()
	local m = clean(manualBox and manualBox.Text or "")
	if m ~= "" then return chars(m)[1] end
	return (scanTop())
end

local SUBMIT = { "ok", "enter", "отправить", "ввод", "готово", "submit", "send", "ответ", "✓", "✔", "играть", "go" }
local function findSubmit()
	local pg = lp:FindFirstChild("PlayerGui")
	if not pg then return nil end
	for _, d in ipairs(pg:GetDescendants()) do
		if d:IsA("GuiButton") and not d:IsDescendantOf(gui) and visible(d) then
			local t = textOf(d)
			if t then
				t = clean(t)
				for _, s in ipairs(SUBMIT) do if t == s then return d end end
			end
		end
	end
end

local function allLetters(t)
	for _, c in ipairs(chars(t)) do if not isLetter(c) then return false end end
	return true
end

local BACK = { "⌫", "←", "⬅", "⌦", "стереть", "удалить", "del", "delete", "backspace", "erase", "назад" }
local function findBackspace()
	local pg = lp:FindFirstChild("PlayerGui")
	if not pg then return nil end
	for _, d in ipairs(pg:GetDescendants()) do
		if d:IsA("GuiButton") and not d:IsDescendantOf(gui) and visible(d) then
			local t = textOf(d)
			local n = lower(d.Name)
			if t then
				t = clean(t)
				for _, s in ipairs(BACK) do if t == s then return d end end
			end
			if n:find("backspace") or n:find("delete") or n:find("erase") then return d end
		end
	end
end

local function snapshotLabels()
	local snap = {}
	local pg = lp:FindFirstChild("PlayerGui")
	if not pg then return snap end
	for _, d in ipairs(pg:GetDescendants()) do
		if (d:IsA("TextLabel") or d:IsA("TextBox")) and not d:IsDescendantOf(gui)
			and not d:FindFirstAncestorWhichIsA("GuiButton") and visible(d) then
			snap[d] = d.Text
		end
	end
	return snap
end

-- поле, где набирается слово: подпись, которая изменилась после нажатия буквы
local function findDisplay(snap, lastCh)
	for d, old in pairs(snap) do
		if d.Parent and d.Text ~= old then
			local t = clean(d.Text)
			if t ~= "" and allLetters(t) then
				local cc = chars(t)
				if cc[#cc] == lastCh then return d end
			end
		end
	end
end

-- слова, которые уже написаны на экране в этом раунде
local function markScreenWords(snap)
	for _, txt in pairs(snap) do
		local t = clean(txt)
		local n = utf8.len(t)
		if n and n >= 2 and allLetters(t) then used[t] = true end
	end
end

---------------------------------------------------------------- КЛИК
local METHODS = { "auto", "signal", "tap", "touch" }
local METHOD_NAMES = { auto = "Авто", signal = "Сигнал", tap = "Тап мышью", touch = "Тап пальцем" }
local autoM = (getconnections or firesignal) and "signal" or "tap"
local AUTO_ORDER = { "signal", "tap", "touch" }

local function rotateMethod()
	if opt.method ~= "auto" then return end
	for i, m in ipairs(AUTO_ORDER) do
		if m == autoM then autoM = AUTO_ORDER[i % #AUTO_ORDER + 1] break end
	end
	setStatus("Не нажимается, пробую способ: " .. METHOD_NAMES[autoM])
end

local function screenPos(b)
	local p = b.AbsolutePosition + b.AbsoluteSize / 2
	local sg = b:FindFirstAncestorWhichIsA("ScreenGui")
	if not (sg and sg.IgnoreGuiInset) then p = p + GuiService:GetGuiInset() end
	return p
end

local function tapMouse(b)
	if not VIM then return end
	local p = screenPos(b)
	VIM:SendMouseMoveEvent(p.X, p.Y, game)
	VIM:SendMouseButtonEvent(p.X, p.Y, 0, true, game, 1)
	task.wait(0.02)
	VIM:SendMouseButtonEvent(p.X, p.Y, 0, false, game, 1)
end

local function tapTouch(b)
	if not VIM then return end
	local p = screenPos(b)
	pcall(function() VIM:SendTouchEvent(1, 0, p.X, p.Y) end)
	task.wait(0.03)
	pcall(function() VIM:SendTouchEvent(1, 2, p.X, p.Y) end)
end

local function sigFire(b)
	local p = screenPos(b)
	local fakeIn = {
		UserInputType = Enum.UserInputType.MouseButton1,
		UserInputState = Enum.UserInputState.Begin,
		Position = Vector3.new(p.X, p.Y, 0),
		Delta = Vector3.new(),
		KeyCode = Enum.KeyCode.Unknown,
	}
	local function fire(sig, ...)
		local args = table.pack(...)
		local cons
		if getconnections then
			local ok, r = pcall(getconnections, sig)
			if ok then cons = r end
		end
		if cons then
			if #cons == 0 then return false end
			for _, c in ipairs(cons) do
				pcall(function() c:Fire(table.unpack(args, 1, args.n)) end)
			end
			return true
		elseif firesignal then
			pcall(firesignal, sig, table.unpack(args, 1, args.n))
			return true
		end
		return false
	end
	local function ev(n) local ok, r = pcall(function() return b[n] end) return ok and r or nil end
	local any = false
	if ev("MouseButton1Down") then any = fire(b.MouseButton1Down, p.X, p.Y) or any end
	if ev("MouseButton1Click") then any = fire(b.MouseButton1Click) or any end
	if ev("Activated") then any = fire(b.Activated, fakeIn, 1) or any end
	if ev("MouseButton1Up") then any = fire(b.MouseButton1Up, p.X, p.Y) or any end
	if ev("TouchTap") then any = fire(b.TouchTap, { Vector2.new(p.X, p.Y) }, false) or any end
	-- игры, которые слушают InputBegan/InputEnded
	if not any or getconnections then
		fire(b.InputBegan, fakeIn)
		local fakeEnd = table.clone(fakeIn)
		fakeEnd.UserInputState = Enum.UserInputState.End
		fire(b.InputEnded, fakeEnd)
	end
end

local function click(b)
	local m = opt.method == "auto" and autoM or opt.method
	if m == "signal" then
		if getconnections or firesignal then sigFire(b) else tapMouse(b) end
	elseif m == "tap" then
		tapMouse(b)
	else
		tapTouch(b)
	end
end

---------------------------------------------------------------- ЛОГИКА
local BAD = {} -- слова, которые игра не приняла (помним всегда)

local function wordChars(w, top, avail)
	local cs = chars(w)
	if cs[1] ~= top then return nil end
	local from = opt.clickFirst and 1 or 2
	local need = {}
	for i = from, #cs do
		local l = cs[i]
		if not avail[l] then return nil end -- такой буквы нет на клавиатуре
		need[l] = (need[l] or 0) + 1
		if opt.pool and need[l] > #avail[l] then return nil end
	end
	return cs
end

local function pickWord(top, avail)
	local src = isCyr(top) and RU or EN
	local cands = {}
	for _, w in ipairs(src) do
		if not used[w] and not BAD[w] then
			local cs = wordChars(w, top, avail)
			if cs then cands[#cands + 1] = { w, cs } end
		end
	end
	if #cands > 0 then return table.unpack(cands[math.random(#cands)]) end
	local big = BIG[top]
	if big and #big > 0 then
		local n = #big
		local st = math.random(n)
		for k = 0, n - 1 do
			local w = big[(st + k) % n + 1]
			if not used[w] and not BAD[w] then
				local cs = wordChars(w, top, avail)
				if cs then return w, cs end
			end
		end
	end
	return nil
end

-- "ok" | "bad" (игра не приняла слово) | "fail"
local function tryWord(top, avail, snap, word, cs)
	used[word] = true
	lastTop, lastPlay = top, os.clock()
	setStatus("Буква: " .. top .. "  →  " .. word)
	local bs = opt.verify and findBackspace() or nil
	local display
	local startIdx = opt.clickFirst and 1 or 2

	local function key(i)
		local l = cs[i]
		local lst = avail[l]
		if not lst then return false end
		local btn = lst[1]
		if opt.pool then
			local n = 0
			for j = startIdx, i do if cs[j] == l then n += 1 end end
			btn = lst[n] or lst[1]
		end
		click(btn)
		return true
	end
	local function readDisp() return display and clean(display.Text) or nil end

	local function anyChange()
		for d, old in pairs(snap) do
			if d.Parent and d.Text ~= old then
				local t = clean(d.Text)
				if t ~= "" and allLetters(t) then return true end
			end
		end
		return false
	end

	local i, guard, rot = startIdx, 0, 0
	while i <= #cs and guard < #cs * 3 + 6 do
		guard += 1
		local before = readDisp()
		if not key(i) then setStatus("Нет кнопки «" .. cs[i] .. "»") return "fail" end
		if opt.verify then
			if not display then
				local t0 = os.clock()
				repeat
					task.wait(0.05)
					display = findDisplay(snap, cs[i])
				until display or os.clock() - t0 > 0.4
			end
			if not display then
				if opt.method == "auto" and rot < 3 and not anyChange() then
					rot += 1
					rotateMethod() -- клик не сработал: повторим эту же букву другим способом
				else
					i += 1
				end
			else
				local t0 = os.clock()
				while readDisp() == before and os.clock() - t0 < 0.4 do task.wait(0.02) end
				if readDisp() == before and opt.method == "auto" and rot < 3 then
					rot += 1
					rotateMethod()
				end
				local cc = chars(readDisp() or "")
				local full = cc[1] == top
				local want = chars(table.concat(cs, "", full and 1 or 2, i))
				local k = 0
				while k < #cc and k < #want and cc[k + 1] == want[k + 1] do k += 1 end
				if k == #cc and k == #want then
					i += 1
				else
					local extra = #cc - k
					if extra > 0 then
						if not bs then setStatus("Ошибка в слове, а кнопку «Стереть» не вижу") return "fail" end
						for _ = 1, extra do click(bs) task.wait(opt.delay) end
						local t1 = os.clock()
						while #chars(readDisp() or "") > k and os.clock() - t1 < 0.4 do task.wait(0.02) end
					end
					i = k + (full and 1 or 2)
				end
			end
		else
			i += 1
		end
		task.wait(opt.delay)
	end

	if opt.verify and display then
		local final = readDisp()
		if final ~= word and final ~= table.concat(cs, "", 2) then
			setStatus("Не удалось набрать слово: " .. tostring(final))
			return "fail"
		end
	end

	if opt.submit then
		local s = findSubmit()
		if s then task.wait(0.05) click(s) end
	end

	-- слово осталось в поле после «Ввод» = игра его не приняла
	if opt.verify and opt.submit and display then
		task.wait(0.5)
		local after = readDisp() or ""
		if after == word or after == table.concat(cs, "", 2) then
			BAD[word] = true
			if bs then
				local ac = chars(after)
				local full = ac[1] == top
				for _ = 1, #ac - (full and 1 or 0) do click(bs) task.wait(opt.delay) end
			end
			setStatus("«" .. word .. "» не принято, беру другое")
			return "bad"
		end
	end
	return "ok"
end

local function play()
	if busy then return end
	busy = true
	local ok, err = pcall(function()
		local top = getTop()
		if not top then setStatus("Не вижу букву сверху. Введи её вручную ↓") return end
		local avail = scanLetters()
		if next(avail) == nil then setStatus("Не вижу кнопок с буквами (нажми «Сканировать»)") return end
		for _ = 1, 6 do
			local snap = snapshotLabels()
			markScreenWords(snap)
			local word, cs = pickWord(top, avail)
			if not word then
				used = {}
				setStatus("Нет слова на «" .. top .. "»")
				return
			end
			if tryWord(top, avail, snap, word, cs) ~= "bad" then break end
		end
		lastTop, lastPlay = top, os.clock()
	end)
	if not ok then setStatus("Ошибка: " .. tostring(err)) end
	busy = false
end

---------------------------------------------------------------- ЭЛЕМЕНТЫ ГУИ
local autoBtn = mkBtn("▶  Авто-игра: ВЫКЛ", OFF)
autoBtn.LayoutOrder = 1
autoBtn.MouseButton1Click:Connect(function()
	opt.auto = not opt.auto
	autoBtn.Text = "▶  Авто-игра: " .. (opt.auto and "ВКЛ" or "ВЫКЛ")
	TweenService:Create(autoBtn, TweenInfo.new(0.2), { BackgroundColor3 = opt.auto and ACCENT or OFF }):Play()
end)

local onceBtn = mkBtn("⚡ Сыграть слово сейчас", PANEL)
onceBtn.LayoutOrder = 2
onceBtn.MouseButton1Click:Connect(function() task.spawn(play) end)

local order = 3
local function mkToggle(text, key, textFn)
	local b = mkBtn("", opt[key] and ACCENT or OFF)
	b.TextSize = 14
	b.LayoutOrder = order
	order += 1
	local function refresh()
		b.Text = textFn and textFn(opt[key]) or (text .. ": " .. (opt[key] and "ВКЛ" or "ВЫКЛ"))
		TweenService:Create(b, TweenInfo.new(0.2), { BackgroundColor3 = opt[key] and ACCENT or OFF }):Play()
	end
	refresh()
	b.MouseButton1Click:Connect(function() opt[key] = not opt[key] refresh() end)
	return b
end

mkToggle("Нажимать первую букву", "clickFirst")
mkToggle("Буквы расходуются (набор)", "pool")
mkToggle("Жать кнопку отправки", "submit")
mkToggle("Проверка и стирание ошибок", "verify")
local methodBtn = mkBtn("", OFF)
methodBtn.TextSize = 14
methodBtn.LayoutOrder = order
order += 1
local function refreshMethod()
	methodBtn.Text = "Клик: " .. METHOD_NAMES[opt.method]
end
refreshMethod()
methodBtn.MouseButton1Click:Connect(function()
	for i, m in ipairs(METHODS) do
		if m == opt.method then opt.method = METHODS[i % #METHODS + 1] break end
	end
	refreshMethod()
end)

local row = Instance.new("Frame")
row.Size = UDim2.new(1, -6, 0, 42)
row.BackgroundTransparency = 1
row.LayoutOrder = order
order += 1
row.Parent = list
local minus = Instance.new("TextButton")
minus.Size = UDim2.new(0, 60, 1, 0)
minus.BackgroundColor3 = PANEL
minus.Text = "−"
minus.TextColor3 = Color3.new(1, 1, 1)
minus.Font = Enum.Font.GothamBold
minus.TextSize = 22
minus.Parent = row
corner(minus, 10)
local plus = minus:Clone()
plus.Text = "+"
plus.Position = UDim2.new(1, -60, 0, 0)
plus.Parent = row
local dl = Instance.new("TextLabel")
dl.Size = UDim2.new(1, -140, 1, 0)
dl.Position = UDim2.new(0, 70, 0, 0)
dl.BackgroundTransparency = 1
dl.TextColor3 = Color3.fromRGB(200, 190, 255)
dl.Font = Enum.Font.GothamMedium
dl.TextSize = 14
dl.Parent = row
local function refreshDelay() dl.Text = string.format("Пауза: %.2f с", opt.delay) end
refreshDelay()
minus.MouseButton1Click:Connect(function() opt.delay = math.max(0.01, opt.delay - 0.01) refreshDelay() end)
plus.MouseButton1Click:Connect(function() opt.delay = math.min(3, opt.delay + 0.01) refreshDelay() end)

manualBox = mkBox("Буква вручную (пусто = авто)")
manualBox.LayoutOrder = order
order += 1

local urlBox = mkBox("URL словаря (txt, слово на строку)")
urlBox.LayoutOrder = order
order += 1
local loadBtn = mkBtn("⬇ Загрузить словарь", PANEL)
loadBtn.TextSize = 14
loadBtn.LayoutOrder = order
order += 1
loadBtn.MouseButton1Click:Connect(function()
	local ok, res = pcall(function() return game:HttpGet(urlBox.Text) end)
	if not ok or type(res) ~= "string" then setStatus("Не удалось загрузить словарь") return end
	local n = 0
	for line in res:gmatch("[^\r\n]+") do
		local w = clean(line)
		local len = utf8.len(w)
		if len and len >= 2 then
			local first = chars(w)[1]
			local dst = isCyr(first) and RU or EN
			dst[#dst + 1] = w
			n += 1
		end
	end
	setStatus("Загружено слов: " .. n)
end)

local scanBtn = mkBtn("🔍 Сканировать экран", PANEL)
scanBtn.TextSize = 14
scanBtn.LayoutOrder = order
order += 1
scanBtn.MouseButton1Click:Connect(function()
	local avail = scanLetters()
	local keys, total = {}, 0
	for l, t in pairs(avail) do keys[#keys + 1] = l total += #t end
	table.sort(keys)
	local top = getTop()
	setStatus("Верх: " .. tostring(top) .. " | кнопок: " .. total .. " [" .. table.concat(keys, "") .. "] | клик: " .. METHOD_NAMES[opt.method])
	print("[WordBot] top =", top, "letters =", table.concat(keys, ","))
end)

local resetBtn = mkBtn("♻ Сбросить использованные", PANEL)
resetBtn.TextSize = 14
resetBtn.LayoutOrder = order
order += 1
resetBtn.MouseButton1Click:Connect(function() used = {} setStatus("Список использованных слов очищен") end)

---------------------------------------------------------------- ОТКРЫТЬ / ЗАКРЫТЬ
local FULL = UDim2.fromOffset(310, 420)
local isOpen = true
local function setOpen(v)
	isOpen = v
	if v then
		main.Visible = true
		TweenService:Create(main, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = FULL }):Play()
	else
		local t = TweenService:Create(main, TweenInfo.new(0.2), { Size = UDim2.fromOffset(310, 0) })
		t:Play()
		t.Completed:Once(function() if not isOpen then main.Visible = false end end)
	end
end
drag(toggleBtn, toggleBtn, function() setOpen(not isOpen) end)
drag(title, main)

local closeX = Instance.new("TextButton")
closeX.Size = UDim2.fromOffset(34, 30)
closeX.Position = UDim2.new(1, -40, 0, 6)
closeX.BackgroundColor3 = Color3.fromRGB(200, 70, 90)
closeX.Text = "✕"
closeX.TextColor3 = Color3.new(1, 1, 1)
closeX.Font = Enum.Font.GothamBold
closeX.TextSize = 16
closeX.Parent = main
corner(closeX, 8)
closeX.MouseButton1Click:Connect(function() setOpen(false) end)

---------------------------------------------------------------- АВТО-ЦИКЛ
task.spawn(function()
	local seenTop
	while gui.Parent do
		local top = getTop()
		if top ~= seenTop then
			if top then used = {} end -- новый раунд
			seenTop = top
		end
		if opt.auto and not busy and top then
			if os.clock() - lastPlay > 30 then used = {} end
			if top ~= lastTop or os.clock() - lastPlay > 2.5 then
				play()
			end
		end
		task.wait(0.3)
	end
end)


---------------------------------------------------------------- БОЛЬШОЙ СЛОВАРЬ
local KEYS = {}
for _, c in ipairs(chars("йцукенгшщзхъфывапролджэячсмитьбюqwertyuiopasdfghjklzxcvbnm")) do KEYS[c] = true end
local DICT_URLS = {
	"https://raw.githubusercontent.com/Harrix/Russian-Nouns/main/dist/russian_nouns.txt",
	"https://raw.githubusercontent.com/hingston/russian/master/100000-russian-words.txt",
	"https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt",
}
local BIGSEEN = {}
local function loadBig(url)
	local ok, res = pcall(function() return game:HttpGet(url) end)
	if not ok or type(res) ~= "string" or #res < 1000 then return 0 end
	local n, c = 0, 0
	for line in res:gmatch("[^\r\n]+") do
		c += 1
		local w = clean(line)
		local len = utf8.len(w)
		if len and len >= 3 and len <= 12 and not BIGSEEN[w] then
			local cs = chars(w)
			local good = true
			for _, ch in ipairs(cs) do if not KEYS[ch] then good = false break end end
			if good then
				BIGSEEN[w] = true
				BIG[cs[1]] = BIG[cs[1]] or {}
				table.insert(BIG[cs[1]], w)
				n += 1
			end
		end
		if c % 5000 == 0 then task.wait() end
	end
	return n
end
task.spawn(function()
	setStatus("Загружаю большие словари…")
	local total, okc = 0, 0
	for _, u in ipairs(DICT_URLS) do
		local n = loadBig(u)
		total += n
		if n > 0 then okc += 1 end
	end
	if total > 0 then
		setStatus("Словари загружены (" .. okc .. "/" .. #DICT_URLS .. "): " .. total .. " слов")
	else
		setStatus("Большие словари не загрузились, работаю на встроенном")
	end
end)



