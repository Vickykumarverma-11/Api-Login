import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../network/PrefStore.dart';
import '../providers/ProjectsProvider.dart';

class ProjectsPageHelper extends StatefulWidget {
  const ProjectsPageHelper({Key? key}) : super(key: key);

  @override
  State<ProjectsPageHelper> createState() => _HomePageHelpState();
}

class _HomePageHelpState extends State<ProjectsPageHelper> {
  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      getToken(PrefStore.TOKEN).then((token) {
        var provider = Provider.of<ProjectsProvider>(context, listen: false);
        provider.fetchProjects(token ?? "");
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                ListView.builder(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: provider.projects?.projectsList.length ?? 0,
                    itemBuilder: (context, index) {
                      var item = provider.projects?.projectsList[index];
                      return ListTile(
                        title: Text(item?.labl ?? ""),
                        subtitle: Text(item?.stats ?? ""),
                      );
                    }),
                if (provider.isLoading)
                  Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        );
      },
    );
  }
}
