import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/claims_riverpod.dart';

final _itemsPerPage = [25, 50, 100, 500, 1000];

class ClaimsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Claims'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Export'))
                  ],
                ),
                Row(
                  children: [
                    const Text('Claims'),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                        width: 150,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 3),
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: 'Search',
                              suffixIcon: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.clear))),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Search')),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                        'Showing ${ref.watch(currentFromRecProvider)} - ${ref.watch(currentToRecProvider)} of ${ref.watch(currentRecCountProvider)}'),
                    const SizedBox(
                      width: 10,
                    ),
                    DropdownButton(
                        value: ref.watch(currentRecPerPageProvider),
                        items: _itemsPerPage.map((int item) {
                          return DropdownMenuItem(
                              value: item, child: Text('$item per Page'));
                        }).toList(),
                        onChanged: (value) {
                          ref.read(currentRecPerPageProvider.notifier).state =
                              value!;
                        }),
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: ref.read(currentFromRecProvider) == 1
                          ? null
                          : () {
                              ref.read(currentPageProvider.notifier).state--;
                            },
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: ref.watch(currentToRecProvider) >=
                              ref.watch(currentRecCountProvider)
                          ? null
                          : () {
                              ref.read(currentPageProvider.notifier).state++;
                            },
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
