import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controller = TextEditingController();
  String _selectedLanguage = 'RU';

  void _navigateTo(String routeName) {
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
        title: const Text(
          'Поиск данных',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        leading: GestureDetector(
          onTap: () => _navigateTo('/splash'),
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Guest 5 Stars',
                style: TextStyle(
                  color: yellowColor,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        leadingWidth: 140,
        actions: [
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
                  size: 26, // Increased by factor of 1.2
                ),
                const SizedBox(
                    width: 21), // Increased by 5px to move elements right
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: FractionallySizedBox(
              heightFactor: 0.924, // 92.4% of parent height
              child: Container(
                width: cardWidth,
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Top white section with icon
                    Container(
                      padding: EdgeInsets.symmetric(vertical: cardWidth * 0.1),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.description_outlined,
                        size: iconSize,
                        color: blueColor,
                      ),
                    ),
                    Spacer(),
                    SizedBox(height: 6),
                    // Bottom section with text field (now white)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          top: 10,
                          left: 16,
                          right: 16), // reduced top padding by 6px (was 16)
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(8),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: TextField(
                              controller: _controller,
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.center,
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
                    Spacer(),
                    // Button inside the card with margin
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
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
