import 'package:finet/bloc/ecategory/ecategory_bloc.dart';
import 'package:finet/bloc/ecategory/ecategory_event.dart';
import 'package:finet/bloc/ecategory/ecategory_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late ECategoryBloc eCategoryBloc;

  @override
  void initState() {
    super.initState();
    eCategoryBloc = BlocProvider.of<ECategoryBloc>(context);
    eCategoryBloc.add(FetchCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ECategoryBloc, ECategoryState>(
      bloc: eCategoryBloc,
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: state.categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      // Handle category selection
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Colors.blue,
                        ),
                      ),
                      padding: EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                        left: 12.0,
                        right: 12.0,
                      ),
                      child: Text(
                        category.eCategoryName,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
