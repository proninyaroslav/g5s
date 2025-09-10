import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  String _selectedLanguage = 'RU';
  double formAreaTop = 70; // Move the form area 50 px higher

  void _navigateTo(String routeName) {
    _controller.clear();
    Navigator.pushNamed(context, routeName);
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Выберите язык'),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ['RU', 'EN', 'ES'].map((lang) {
            final isSelected = _selectedLanguage == lang;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedLanguage = lang;
                });
                Navigator.pop(context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  lang,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blueColor = const Color(0xFF3B82F6);
    final yellowColor = const Color(0xFFFACC15);
    final buttonGradientStart = const Color(0xFF2BB9C2);
    final buttonGradientEnd = const Color(0xFF16C9A9);
    final bottomNavActiveBlue = const Color(0xFF41A6FF);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cardWidth = screenWidth * 0.9;
// 40% of screen height
    final iconSize = cardWidth * 0.15;

    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        backgroundColor: blueColor,
        elevation: 0,
        titleSpacing: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => _navigateTo('/splash'),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Icon(
                    Icons.house_outlined,
                    color: Colors.white,
                    size: 31,
                  ),
                ),
              ),
              const Text(
                'Поиск данных',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: _showLanguageDialog,
                child: Row(
                  children: [
                    Text(
                      _selectedLanguage,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                      size: 26,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: FractionallySizedBox(
              heightFactor: 0.924, // 92.4% of parent height
              child: Container(
                width: cardWidth,
                height: screenHeight * 0.924,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Icon at the top
                    Positioned(
                      top: cardWidth * 0.1,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Icon(
                          Icons.description_outlined,
                          size: iconSize,
                          color: blueColor,
                        ),
                      ),
                    ),
                    // Button at the bottom
                    Positioned(
                      bottom: 24,
                      left: 16,
                      right: 16,
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: LinearGradient(
                              colors: [buttonGradientStart, buttonGradientEnd],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () => _navigateTo('/search'),
                            icon: const Icon(Icons.search, color: Colors.white),
                            label: const Text(
                              'Найти',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Form field and grey line centered vertically, 5px higher
                    Align(
                      alignment: Alignment(0,
                          -0.035), // Move up by 5px (approximate for most card heights)
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: TextField(
                                controller: _controller,
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                textAlign: TextAlign.center,
                                onChanged: (value) {
                                  final upper = value.toUpperCase();
                                  if (value != upper) {
                                    _controller.value =
                                        _controller.value.copyWith(
                                      text: upper,
                                      selection: TextSelection.collapsed(
                                          offset: upper.length),
                                    );
                                  }
                                },
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 24,
                                  color: Colors.grey[500],
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Введите номер документа',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 24,
                                    color: Colors.grey[500],
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                  alignLabelWithHint: true,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey[500],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0, // Home/Search tab active
        selectedItemColor: bottomNavActiveBlue,
        unselectedItemColor: Colors.grey[500],
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        onTap: (index) {
          if (index == 0) {
            _navigateTo('/search');
          } else if (index == 1) {
            _navigateTo('/profile');
          }
        },
        iconSize: 26, // Larger icons proportional to the 18pt font
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
