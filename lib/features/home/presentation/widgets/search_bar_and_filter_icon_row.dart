import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsouq/features/home/presentation/cubit/home_cubit.dart';
import 'package:newsouq/features/home/presentation/widgets/app_search_bar.dart';
import 'package:newsouq/features/home/presentation/widgets/search_result_container.dart';

class SearchBarAndFilterIconRow extends StatefulWidget {
  const SearchBarAndFilterIconRow({super.key});

  @override
  State<SearchBarAndFilterIconRow> createState() =>
      _SearchBarAndFilterIconRowState();
}

class _SearchBarAndFilterIconRowState extends State<SearchBarAndFilterIconRow> {
  late FocusNode focusNode;
  final controller = TextEditingController();
  final layerLink = LayerLink();
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        removeOverlay();
      }
    });
  }

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  void showOverlay() {
    if (!mounted || overlayEntry != null) return;
    final overlay = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (overlayContext) {
        final homeCubit = context.read<HomeCubit>();
        return Positioned(
          width: 280.w,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: Offset(2.w, 52.h),
            showWhenUnlinked: false,
            child: BlocProvider.value(
              value: homeCubit,
              child: SearchResultContainer(),
            ),
          ),
        );
      },
    );
    overlay.insert(overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppSearchBar(
          layerLink: layerLink,
          focusNode: focusNode,
          controller: controller,
          showOverlay: showOverlay,
        ),
        Spacer(),
        SvgPicture.asset('assets/icons/Button.svg'),
      ],
    );
  }
}
