import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';
import '../../design_system/design_system.dart';

class ShowcaseTab {
  final String label;
  final IconData icon;

  ShowcaseTab(this.label, this.icon);
}

class DesignSystemShowcasePage extends StatefulWidget {
  const DesignSystemShowcasePage({super.key});

  @override
  State<DesignSystemShowcasePage> createState() =>
      _DesignSystemShowcasePageState();
}

class _DesignSystemShowcasePageState extends State<DesignSystemShowcasePage> {
  int _selectedIndex = 0;

  final List<ShowcaseTab> _tabs = [
    ShowcaseTab('Components', Icons.widgets_rounded),
    ShowcaseTab('Glass Effects', Icons.auto_awesome_rounded),
    ShowcaseTab('Colors', Icons.palette_rounded),
    ShowcaseTab('Typography', Icons.text_fields_rounded),
    ShowcaseTab('Settings', Icons.tune_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Material 3 Design System',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: context.colorScheme.surface,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return IconButton(
                  tooltip: 'Toggle theme',
                  onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      state.themeMode == ThemeMode.light
                          ? Icons.dark_mode_rounded
                          : Icons.light_mode_rounded,
                      key: ValueKey(state.themeMode),
                      color: context.colorScheme.onPrimaryContainer,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: _tabs.asMap().entries.map((entry) {
                final index = entry.key;
                final tab = entry.value;
                final isSelected = _selectedIndex == index;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ElevatedButton.icon(
                    onPressed: () => setState(() => _selectedIndex = index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected
                          ? context.colorScheme.primary
                          : context.colorScheme.surfaceContainer,
                      foregroundColor: isSelected
                          ? context.colorScheme.onPrimary
                          : context.colorScheme.onSurfaceVariant,
                      elevation: isSelected ? 2 : 0,
                    ),
                    icon: Icon(tab.icon, size: 18),
                    label: Text(tab.label),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _getShowcaseContent(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getShowcaseContent(int index) {
    switch (index) {
      case 0:
        return const ComponentsShowcase(key: ValueKey('components'));
      case 1:
        return const LiquidGlassShowcase(key: ValueKey('glass'));
      case 2:
        return const ColorsShowcase(key: ValueKey('colors'));
      case 3:
        return const TypographyShowcase(key: ValueKey('typography'));
      case 4:
        return const SettingsShowcase(key: ValueKey('settings'));
      default:
        return const ComponentsShowcase(key: ValueKey('components'));
    }
  }
}

class LiquidGlassShowcase extends StatelessWidget {
  const LiquidGlassShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            title: 'Glass Effects',
            subtitle: 'Beautiful glass morphism with native Flutter',
            icon: Icons.auto_awesome_rounded,
          ),
          const SizedBox(height: 32),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.colorScheme.primary.withOpacity(0.3),
                  context.colorScheme.secondary.withOpacity(0.3),
                  context.colorScheme.tertiary.withOpacity(0.3),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _GlassBackgroundPainter(context.colorScheme),
                  ),
                ),
                Center(
                  child: _GlassMorphismContainer(
                    blur: 10,
                    opacity: 0.2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      child: Text(
                        'GLASS',
                        style: context.textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          _SectionHeader(
            title: 'Glass Cards',
            subtitle: 'Different glass morphism styles',
            icon: Icons.credit_card_rounded,
          ),
          const SizedBox(height: 24),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: ResponsiveUtils.getGridColumns(context,
                compact: 1, medium: 2, expanded: 3),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
            children: [
              _buildGlassCard(
                context,
                'Subtle Glass',
                'Minimal blur effect',
                Icons.opacity_rounded,
                blur: 5,
                opacity: 0.1,
              ),
              _buildGlassCard(
                context,
                'Medium Glass',
                'Balanced transparency',
                Icons.blur_on_rounded,
                blur: 10,
                opacity: 0.2,
              ),
              _buildGlassCard(
                context,
                'Strong Glass',
                'Heavy blur effect',
                Icons.auto_awesome_rounded,
                blur: 20,
                opacity: 0.3,
              ),
              _buildGlassCard(
                context,
                'Colorful Glass',
                'Tinted glass effect',
                Icons.palette_rounded,
                blur: 15,
                opacity: 0.25,
                tintColor: context.colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 40),
          _SectionHeader(
            title: 'Interactive Glass',
            subtitle: 'Adjustable glass effects',
            icon: Icons.tune_rounded,
          ),
          const SizedBox(height: 24),
          _InteractiveGlassDemo(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildGlassCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon, {
    required double blur,
    required double opacity,
    Color? tintColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.colorScheme.primary.withOpacity(0.2),
            context.colorScheme.secondary.withOpacity(0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: _GlassMorphismContainer(
        blur: blur,
        opacity: opacity,
        tintColor: tintColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.white.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InteractiveGlassDemo extends StatefulWidget {
  @override
  _InteractiveGlassDemoState createState() => _InteractiveGlassDemoState();
}

class _InteractiveGlassDemoState extends State<_InteractiveGlassDemo> {
  double _blur = 10.0;
  double _opacity = 0.2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.colorScheme.primaryContainer,
            context.colorScheme.secondaryContainer,
            context.colorScheme.tertiaryContainer,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Glass Effect Controls',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Blur: ${_blur.round()}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          Slider(
                            value: _blur,
                            min: 0,
                            max: 30,
                            divisions: 30,
                            onChanged: (value) {
                              setState(() => _blur = value);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Opacity: ${(_opacity * 100).round()}%',
                            style: const TextStyle(color: Colors.white),
                          ),
                          Slider(
                            value: _opacity,
                            min: 0.05,
                            max: 0.5,
                            divisions: 45,
                            onChanged: (value) {
                              setState(() => _opacity = value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: _GlassMorphismContainer(
                blur: _blur,
                opacity: _opacity,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.auto_awesome_rounded,
                        color: Colors.white,
                        size: 48,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'INTERACTIVE',
                        style: context.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Adjust the sliders above',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlassMorphismContainer extends StatelessWidget {
  const _GlassMorphismContainer({
    required this.child,
    required this.blur,
    required this.opacity,
    this.tintColor,
  });

  final Widget child;
  final double blur;
  final double opacity;
  final Color? tintColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: (tintColor ?? Colors.white).withOpacity(opacity),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _GlassBackgroundPainter extends CustomPainter {
  final ColorScheme colorScheme;

  _GlassBackgroundPainter(this.colorScheme);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = colorScheme.outline.withOpacity(0.1);

    for (int i = 0; i < 8; i++) {
      final x = (i * size.width / 7) % size.width;
      final y = (i * size.height / 5) % size.height;
      canvas.drawCircle(
        Offset(x, y),
        20 + (i * 5),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ComponentsShowcase extends StatelessWidget {
  const ComponentsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            title: 'Components',
            subtitle: 'Interactive UI elements and controls',
            icon: Icons.widgets_rounded,
          ),
          const SizedBox(height: 32),
          _ComponentSection(
            title: 'Buttons',
            description: 'Primary actions and interactions',
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: context.colorScheme.outline.withOpacity(0.1),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.star_rounded),
                          label: const Text('Primary'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton.tonalIcon(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_rounded),
                          label: const Text('Secondary'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.share_rounded),
                          label: const Text('Outlined'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.info_rounded),
                          label: const Text('Text'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          _ComponentSection(
            title: 'Cards & Surfaces',
            description: 'Content containers and layouts',
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: context.colorScheme.outline.withOpacity(0.1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: context.colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.design_services_rounded,
                              color: context.colorScheme.onPrimaryContainer,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Design System Card',
                                  style:
                                      context.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Modern Material 3 styling',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: context.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'This card demonstrates the new Material 3 design language with improved spacing, typography, and visual hierarchy.',
                        style: context.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Learn More'),
                          ),
                          const SizedBox(width: 8),
                          FilledButton(
                            onPressed: () {},
                            child: const Text('Get Started'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _ComponentSection(
            title: 'Input Fields',
            description: 'Text inputs and form controls',
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: context.colorScheme.outline.withOpacity(0.1),
                ),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Modern Text Field',
                      hintText: 'Enter your text here...',
                      prefixIcon: const Icon(Icons.person_rounded),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear_rounded),
                        onPressed: () {},
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Outlined Style',
                      hintText: 'Clean outlined design',
                      prefixIcon: const Icon(Icons.email_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class ColorsShowcase extends StatelessWidget {
  const ColorsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            title: 'Color System',
            subtitle: 'Material 3 dynamic color palette',
            icon: Icons.palette_rounded,
          ),
          const SizedBox(height: 32),
          _ColorPaletteSection(
            title: 'Primary Colors',
            description: 'Brand and accent colors',
            colors: [
              _ModernColorItem('Primary', colorScheme.primary),
              _ModernColorItem('On Primary', colorScheme.onPrimary),
              _ModernColorItem(
                  'Primary Container', colorScheme.primaryContainer),
              _ModernColorItem(
                  'On Primary Container', colorScheme.onPrimaryContainer),
            ],
          ),
          const SizedBox(height: 24),
          _ColorPaletteSection(
            title: 'Secondary Colors',
            description: 'Supporting interface colors',
            colors: [
              _ModernColorItem('Secondary', colorScheme.secondary),
              _ModernColorItem('On Secondary', colorScheme.onSecondary),
              _ModernColorItem(
                  'Secondary Container', colorScheme.secondaryContainer),
              _ModernColorItem(
                  'On Secondary Container', colorScheme.onSecondaryContainer),
            ],
          ),
          const SizedBox(height: 24),
          _ColorPaletteSection(
            title: 'Surface Colors',
            description: 'Backgrounds and containers',
            colors: [
              _ModernColorItem('Surface', colorScheme.surface),
              _ModernColorItem('On Surface', colorScheme.onSurface),
              _ModernColorItem(
                  'Surface Container', colorScheme.surfaceContainer),
              _ModernColorItem(
                  'Surface Variant', colorScheme.surfaceContainerHighest),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class TypographyShowcase extends StatelessWidget {
  const TypographyShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(
            title: 'Typography',
            subtitle: 'Text styles and hierarchies',
            icon: Icons.text_fields_rounded,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: context.colorScheme.outline.withOpacity(0.1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ModernTypographyItem(
                  'Display Large',
                  context.textTheme.displayLarge,
                  'Headlines and hero text',
                ),
                _ModernTypographyItem(
                  'Headline Large',
                  context.textTheme.headlineLarge,
                  'Section headers',
                ),
                _ModernTypographyItem(
                  'Title Large',
                  context.textTheme.titleLarge,
                  'Card titles and emphasis',
                ),
                _ModernTypographyItem(
                  'Body Large',
                  context.textTheme.bodyLarge,
                  'Primary body text',
                ),
                _ModernTypographyItem(
                  'Body Medium',
                  context.textTheme.bodyMedium,
                  'Regular content text',
                ),
                _ModernTypographyItem(
                  'Label Large',
                  context.textTheme.labelLarge,
                  'Button and UI labels',
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class SettingsShowcase extends StatelessWidget {
  const SettingsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionHeader(
                title: 'Theme Settings',
                subtitle: 'Customize your experience',
                icon: Icons.tune_rounded,
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: context.colorScheme.outline.withOpacity(0.1),
                  ),
                ),
                child: Column(
                  children: [
                    _ModernSettingsTile(
                      icon: state.themeMode == ThemeMode.light
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded,
                      title: 'Dark Theme',
                      subtitle: 'Switch between light and dark appearance',
                      value: state.themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    ),
                    Container(
                      height: 1,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      color: context.colorScheme.outline.withOpacity(0.1),
                    ),
                    _ModernSettingsTile(
                      icon: Icons.auto_awesome_rounded,
                      title: 'Dynamic Colors',
                      subtitle: 'Use colors from your wallpaper (Material You)',
                      value: state.useDynamicColor,
                      enabled:
                          context.read<ThemeCubit>().isDynamicColorAvailable,
                      onChanged: context
                              .read<ThemeCubit>()
                              .isDynamicColorAvailable
                          ? (value) {
                              context.read<ThemeCubit>().toggleDynamicColors();
                            }
                          : null,
                    ),
                  ],
                ),
              ),
              if (state.useDynamicColor &&
                  context.read<ThemeCubit>().isDynamicColorAvailable) ...[
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        context.colorScheme.primaryContainer,
                        context.colorScheme.secondaryContainer,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.auto_awesome_rounded,
                        color: context.colorScheme.onPrimaryContainer,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Dynamic colors are active',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: context.colorScheme.onPrimaryContainer,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ComponentSection extends StatelessWidget {
  const _ComponentSection({
    required this.title,
    required this.description,
    required this.child,
  });

  final String title;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}

class _ColorPaletteSection extends StatelessWidget {
  const _ColorPaletteSection({
    required this.title,
    required this.description,
    required this.colors,
  });

  final String title;
  final String description;
  final List<_ModernColorItem> colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveUtils.getGridColumns(context,
                compact: 2, medium: 4, expanded: 4),
            childAspectRatio: 1.5,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: colors.length,
          itemBuilder: (context, index) => colors[index],
        ),
      ],
    );
  }
}

class _ModernColorItem extends StatelessWidget {
  const _ModernColorItem(this.name, this.color);

  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 12,
            left: 12,
            right: 12,
            child: Text(
              name,
              style: context.textTheme.labelMedium?.copyWith(
                color: ColorUtils.getContrastingTextColor(color),
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _ModernTypographyItem extends StatelessWidget {
  const _ModernTypographyItem(this.name, this.style, this.description);

  final String name;
  final TextStyle? style;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                description,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'The quick brown fox jumps over the lazy dog',
            style: style,
          ),
        ],
      ),
    );
  }
}

class _ModernSettingsTile extends StatelessWidget {
  const _ModernSettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: enabled
                ? context.colorScheme.primaryContainer
                : context.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: enabled
                ? context.colorScheme.onPrimaryContainer
                : context.colorScheme.onSurfaceVariant,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: enabled
                      ? context.colorScheme.onSurface
                      : context.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: enabled ? onChanged : null,
        ),
      ],
    );
  }
}
