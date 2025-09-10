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
    final greyBackgroundColor = const Color(0xFFF1F3FB);
    final bottomNavActiveBlue = const Color(0xFF41A6FF);

    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;
    final iconSize = cardWidth * 0.15;

    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        backgroundColor: blueColor,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => _navigateTo('/splash'),
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Guest 5 Stars',
                  style: TextStyle(
                    color: yellowColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              'Поиск данных',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: _showLanguageDialog,
              child: Row(
                children: [
                  Text(
                    _selectedLanguage,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 22,
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: cardWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                // Bottom grey section with text field
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: greyBackgroundColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                    border: const Border(
                      top: BorderSide(color: Color(0xFFE0E0E0), width: 1),
                    ),
                  ),
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Введите номер документа',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
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
                          style: TextStyle(color: Colors.white),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0, // Home/Search tab active
        selectedItemColor: bottomNavActiveBlue,
        unselectedItemColor: greyBackgroundColor,
        onTap: (index) {
          if (index == 0) {
            _navigateTo('/search');
          } else if (index == 1) {
            _navigateTo('/profile');
          }
        },
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
