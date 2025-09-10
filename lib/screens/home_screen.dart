import 'package:flutter/material.dart';

import '../app_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ...existing code...
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cardWidth = screenWidth * AppTheme.cardWidthFraction;
    final cardHeight = screenHeight * AppTheme.cardHeightFraction;
    final iconSize = cardWidth * AppTheme.iconSizeCardFraction;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppTheme.primaryBlue,
        appBar: AppBar(
          backgroundColor: AppTheme.primaryBlue,
          elevation: 0,
          titleSpacing: 0,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.fromLTRB(AppTheme.horizontalPadding,
                AppTheme.verticalPadding, AppTheme.horizontalPadding, 0),
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
                      size: AppTheme.iconSizeAppBar,
                    ),
                  ),
                ),
                const Text(
                  'Поиск данных',
                  style: AppTheme.appBarTitle,
                ),
                GestureDetector(
                  onTap: () => _showLanguageDialog(),
                  child: Row(
                    children: [
                      Text(
                        _selectedLanguage,
                        style: AppTheme.appBarTitle,
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.language,
                        color: Colors.white,
                        size: AppTheme.iconSizeNav,
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: FractionallySizedBox(
            heightFactor: 0.934,
            child: Container(
              width: cardWidth,
              height: cardHeight,
              decoration: BoxDecoration(
                color: AppTheme.cardBackground,
                borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withValues(alpha: AppTheme.cardShadowOpacity),
                    blurRadius: AppTheme.cardShadowBlur,
                    offset: Offset(0, AppTheme.cardShadowOffsetY),
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
                        color: AppTheme.primaryBlue,
                      ),
                    ),
                  ),
                  // Button at the bottom
                  Positioned(
                    bottom: 24,
                    left: AppTheme.horizontalPadding,
                    right: AppTheme.horizontalPadding,
                    child: SizedBox(
                      width: double.infinity,
                      height: AppTheme.buttonHeight,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppTheme.buttonBorderRadius),
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.accentGradientStart,
                              AppTheme.accentGradientEnd
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () => _navigateTo('/search'),
                          icon: Icon(Icons.search,
                              color: Colors.white, size: AppTheme.iconSizeNav),
                          label: Text(
                            'Найти',
                            style: AppTheme.appBarTitle,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  AppTheme.buttonBorderRadius),
                            ),
                            textStyle: AppTheme.navLabel,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Form field and grey line centered vertically, 5px higher
                  Align(
                    alignment: Alignment(0, -0.035),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppTheme.horizontalPadding),
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
                              style: AppTheme.textField,
                              decoration: InputDecoration(
                                hintText: 'Введите номер документа',
                                hintStyle: AppTheme.textFieldHint,
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
                            color: AppTheme.grey,
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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppTheme.cardBackground,
          currentIndex: 0,
          selectedItemColor: AppTheme.navActiveBlue,
          unselectedItemColor: AppTheme.grey,
          selectedLabelStyle: AppTheme.navLabel,
          unselectedLabelStyle: AppTheme.navLabel,
          onTap: (index) {
            if (index == 0) {
              _navigateTo('/search');
            } else if (index == 1) {
              _navigateTo('/profile');
            }
          },
          iconSize: AppTheme.iconSizeNav,
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
      ),
    );
  }
}
