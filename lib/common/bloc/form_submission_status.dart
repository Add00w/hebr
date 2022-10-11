import 'package:flutter/material.dart';

@immutable
abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class FormInitial extends FormSubmissionStatus {
  const FormInitial();
}

class FormSubmitting extends FormSubmissionStatus {}

class Formsubmitted extends FormSubmissionStatus {}

class FormSubmissionFailed extends FormSubmissionStatus {
  final Exception exception;
  const FormSubmissionFailed(this.exception);
}
