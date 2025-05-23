import 'package:vaden/vaden.dart';

@DTO()
class Project with Validator<Project> {
  final List<String> dependenciesKeys;
  final String projectName;
  final String projectDescription;
  final String dartVersion;

  Project({
    required this.dependenciesKeys,
    required this.projectName,
    required this.projectDescription,
    required this.dartVersion,
  });

  ProjectWithTempPath addPath(String path) {
    return ProjectWithTempPath(
      path: path,
      dependenciesKeys: dependenciesKeys,
      projectName: projectName,
      projectDescription: projectDescription,
      dartVersion: dartVersion,
    );
  }

  @override
  LucidValidator<Project> validate(ValidatorBuilder<Project> builder) {
    builder //
        .ruleFor((p) => p.projectName, key: 'dependenciesKeys');

    builder //
        .ruleFor((p) => p.projectName, key: 'projectName')
        .notEmpty()
        .matchesPattern(r"^[a-z0-9_]+$", message: "Invalid project name");

    builder //
        .ruleFor((p) => p.projectDescription, key: 'projectDescription')
        .notEmpty();

    builder //
        .ruleFor((p) => p.dartVersion, key: 'dartVersion')
        .notEmpty()
        .matchesPattern(r"^\d+\.\d+\.\d+$", message: "Invalid dart version");

    return builder;
  }
}

class ProjectWithTempPath extends Project {
  final String path;

  ProjectWithTempPath({
    required this.path,
    required super.dependenciesKeys,
    required super.projectName,
    required super.projectDescription,
    required super.dartVersion,
  });
}
