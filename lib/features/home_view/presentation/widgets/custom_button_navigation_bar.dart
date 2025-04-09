import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:wallpaper_app/core/manager/navigation/navigation_cubit.dart';
import 'package:wallpaper_app/core/widgets/navigation_bar_item.dart';

class CustomButtonNavigationBar extends StatelessWidget {
  const CustomButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const ShapeDecoration(
        color: Color(0xffF9F9F9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return Row(
            children:
                bottomNavigationBarItems.asMap().entries.map((e) {
                  var index = e.key;
                  var entity = e.value;
                  return Expanded(
                    flex:
                        index ==
                                context.read<NavigationCubit>().currentViewIndex
                            ? 3
                            : 2,
                    child: GestureDetector(
                      onTap: () {
                        context.read<NavigationCubit>().changeIndex(index);
                      },
                      child: NavigationBarItem(
                        isSelected:
                            context.read<NavigationCubit>().currentViewIndex ==
                            index,
                        entity: entity,
                      ),
                    ),
                  );
                }).toList(),
          );
        },
      ),
    );
  }
}
